import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/core/utils/validation.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/kubernetes_data_source.dart';
import 'package:api_grpc_dart/data/datasources/refresh_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/session_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
import 'package:api_grpc_dart/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';
import '../datasources/verification_code_local_data_source.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationImpl implements AuthenticationRepository {
  final KubernetesDataSource kubernetesDataSource;
  final JsonWebToken jsonWebToken;
  final Emailer emailer;
  final VerificationCodeLocalDataSource verificationCodeLocalDataSource;
  final UserLocalDataSource userLocalDataSource;
  final DeviceLocalDataSource deviceLocalDataSource;
  final BannedUserLocalDataSource bannedUserLocalDataSource;
  final BannedDeviceLocalDataSource bannedDeviceLocalDataSource;
  final AuthorizationTokenLocalDataSource authorizationTokenLocalDataSource;
  final RefreshTokenLocalDataSource refreshTokenLocalDataSource;
  final SessionLocalDataSource sessionLocalDataSource;

  AuthenticationImpl(
      {required this.emailer,
      required this.jsonWebToken,
      required this.kubernetesDataSource,
      required this.deviceLocalDataSource,
      required this.authorizationTokenLocalDataSource,
      required this.refreshTokenLocalDataSource,
      required this.bannedUserLocalDataSource,
      required this.bannedDeviceLocalDataSource,
      required this.userLocalDataSource,
      required this.sessionLocalDataSource,
      required this.verificationCodeLocalDataSource});

  @override
  Future<Either<GrpcError, SignInResponse>> signIn(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (!StringUtils.isNumeric(data['code']) || data['code'].length != 6) {
        return Left(GrpcError.invalidArgument('Input `code` invalid'));
      } else if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
        final getVerificationCodeResponse =
            await verificationCodeLocalDataSource
                .getVerificationCode(context: context, data: {
          'code': data['code'],
          'email': data['email'],
          'deviceId': metadata.deviceId,
          'type': 'SIGN_IN'
        }, paths: [
          NormalAttribute(name: 'id'),
          NormalAttribute(name: 'type'),
        ]);
        if (getVerificationCodeResponse == null) {
          return Left(GrpcError.invalidArgument('VerificationCode Not found'));
        }
        final getBannedUserResponse = await bannedUserLocalDataSource
            .getBannedUser(context: context, data: {
          'email': data['email']
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (getBannedUserResponse != null) {
          return Left(GrpcError.invalidArgument('User banned'));
        }
        final getBannedDeviceResponse = await bannedDeviceLocalDataSource
            .getBannedDevice(context: context, data: {
          'deviceId': metadata.deviceId
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (getBannedDeviceResponse != null) {
          return Left(GrpcError.invalidArgument('Device banned'));
        }
        final getUserResponse = await userLocalDataSource.getUser(
            context: context, data: {'email': data['email']}, paths: []);
        if (getUserResponse == null) {
          return Left(GrpcError.invalidArgument('User not found'));
        }
        final verificationCodeListResponse =
            await verificationCodeLocalDataSource.listVerificationCode(
                data: {
                  'email': data['email'],
                  'type': getVerificationCodeResponse.type.toString(),
                  'deviceId': metadata.deviceId
                },
                context: context,
                paths: [
                  NormalAttribute(name: 'id'),
                ]);
        if (verificationCodeListResponse.isNotEmpty) {
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'email': data['email'],
            'type': getVerificationCodeResponse.type.toString(),
            'deviceId': metadata.deviceId
          }, context: context);
        }
        late Device device;
        final getDeviceResponse = await deviceLocalDataSource.getDevice(
            context: context, data: {'deviceId': metadata.deviceId}, paths: []);
        if (getDeviceResponse == null) {
          device =
              await deviceLocalDataSource.createDevice(context: context, data: {
            'platform': metadata.platform,
            'systemVersion': metadata.systemVersion,
            'deviceId': metadata.deviceId,
            'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
            'model': metadata.model
          }, paths: []);
        } else {
          final updateDeviceResponse = await deviceLocalDataSource
              .updateDevice(context: context, where: {
            'id': getDeviceResponse.id,
          }, data: {
            'platform': metadata.platform,
            'systemVersion': metadata.systemVersion,
            'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
            'model': metadata.model,
          }, paths: []);
          device = updateDeviceResponse!;
        }
        late RefreshToken refreshToken;
        late AuthorizationToken authorizationToken;
        final getRefreshTokenResponse = await refreshTokenLocalDataSource
            .getRefreshToken(context: context, data: {
          'userFk': getUserResponse.id,
          'deviceFk': device.id,
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (getRefreshTokenResponse != null) {
          await refreshTokenLocalDataSource.deleteRefreshToken(
              data: {'id': getRefreshTokenResponse.id}, context: context);
        }
        refreshToken =
            await refreshTokenLocalDataSource.createRefreshToken(data: {
          'userFk': getUserResponse.id,
          'deviceFk': device.id,
          'expirationTime': DateTime.now().add(Duration(hours: 24)),
        }, paths: [
          NormalAttribute(name: 'id'),
        ], context: context);
        authorizationToken = await authorizationTokenLocalDataSource
            .createAuthorizationToken(data: {
          'refreshTokenFk': refreshToken.id,
          'deviceFk': device.id,
          'userFk': getUserResponse.id,
          'app': metadata.app.toString(),
          'appVersion': metadata.appVersion
        }, paths: [], context: context);
        await emailer.sendSignInMail(
            recipient: getUserResponse.email,
            ip: metadata.ipv4,
            device:
                '${metadata.model} - ${metadata.platform} ${metadata.systemVersion}',
            time: DateTime.now());
        var newRefreshToken = jsonWebToken
            .generateRefreshToken(payload: {'refreshTokenFk': refreshToken.id});
        var newAuthorizationToken =
            jsonWebToken.generateAuthorizationToken(payload: {
          'authorizationTokenFk': authorizationToken.id,
        });
        return Right(SignInResponse(
            authorizationToken: newAuthorizationToken,
            refreshToken: newRefreshToken,
            user: getUserResponse));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      if (error is SmtpClientCommunicationException) {
        if (error.message
            .contains('Response from server: < 550 Error: no such user')) {
          return Left(GrpcError.invalidArgument(
              'The mail server could not deliver the verification code email'));
        }
      }
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, CheckSessionResponse>> checkSession(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata}) async {
    try {
      late AuthorizationToken? authorizationToken;
      late RefreshToken? refreshToken;
      late Device? device;
      late User? user;
      if (data['authorizationToken'] != null && data['refreshToken'] != null) {
        device = await deviceLocalDataSource.getDevice(
            context: context, data: {'deviceId': metadata.deviceId}, paths: []);
        if (device == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        await deviceLocalDataSource.updateDevice(context: context, where: {
          'deviceId': metadata.deviceId,
        }, data: {
          'platform': metadata.platform,
          'systemVersion': metadata.systemVersion,
          'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
          'model': metadata.model,
        }, paths: []);
        final getBannedDeviceResponse = await bannedDeviceLocalDataSource
            .getBannedDevice(
                context: context,
                data: {'deviceId': metadata.deviceId},
                paths: [NormalAttribute(name: 'id')]);
        if (getBannedDeviceResponse != null) {
          return Left(GrpcError.invalidArgument('Device Banned'));
        }
        final authorizationTokenPayload = jsonWebToken.verify(
            data['authorizationToken'], 'AuthorizationToken');
        final refreshTokenPayload =
            jsonWebToken.verify(data['refreshToken'], 'RefreshToken');
        authorizationToken = await authorizationTokenLocalDataSource
            .getAuthorizationToken(context: context, data: {
          'id': authorizationTokenPayload['authorizationTokenFk'],
          'deviceFk': device.id
        }, paths: []);
        refreshToken = await refreshTokenLocalDataSource.getRefreshToken(
            context: context,
            data: {
              'id': refreshTokenPayload['refreshTokenFk'],
              'deviceFk': device.id
            },
            paths: []);
        if (authorizationToken == null || refreshToken == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        user = await userLocalDataSource.getUser(
            context: context,
            data: {'id': authorizationToken.userFk},
            paths: []);
        if (user == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        final getBannedUserResponse = await bannedUserLocalDataSource
            .getBannedUser(
                context: context,
                data: {'userFk': authorizationToken.userFk},
                paths: [NormalAttribute(name: 'id')]);
        if (getBannedUserResponse != null) {
          return Left(GrpcError.invalidArgument('User Banned'));
        }
      } else {
        device = await deviceLocalDataSource.getDevice(
            context: context, data: {'deviceId': metadata.deviceId}, paths: []);
        if (device != null) {
          await deviceLocalDataSource.updateDevice(context: context, where: {
            'deviceId': metadata.deviceId,
          }, data: {
            'platform': metadata.platform,
            'systemVersion': metadata.systemVersion,
            'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
            'model': metadata.model,
          }, paths: []);
        }
        final getBannedDeviceResponse = await bannedDeviceLocalDataSource
            .getBannedDevice(
                context: context,
                data: {'deviceId': metadata.deviceId},
                paths: [NormalAttribute(name: 'id')]);
        if (getBannedDeviceResponse != null) {
          return Left(GrpcError.invalidArgument('Device Banned'));
        }
      }
      final ips = await kubernetesDataSource.listNodes();
      return Right(CheckSessionResponse(ipAddresses: ips));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      if (error is SmtpClientCommunicationException) {
        if (error.message
            .contains('Response from server: < 550 Error: no such user')) {
          return Left(GrpcError.invalidArgument(
              'The mail server could not deliver the verification code email'));
        }
      }
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, SignUpResponse>> signUp(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['fullName'] == '' ||
          !StringUtils.isName(data['fullName']) ||
          !Validation.name(data['fullName'])) {
        return Left(GrpcError.invalidArgument('Input `fullName` invalid'));
      }
      if (data['birthday'] == '') {
        return Left(GrpcError.invalidArgument('Input `birthday` invalid'));
      }
      if (data['photo'] == '') {
        return Left(GrpcError.invalidArgument('Input `photo` invalid'));
      }
      if (data['alias'] == '' ||
          !StringUtils.isAlias(data['alias']) ||
          !Validation.alias(data['alias'])) {
        return Left(GrpcError.invalidArgument('Input `alias` invalid'));
      }
      if (!StringUtils.isNumeric(data['code']) || data['code'].length != 6) {
        return Left(GrpcError.invalidArgument('Input `code` invalid'));
      }
      if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
        late Device device;
        final getDeviceResponse = await deviceLocalDataSource.getDevice(
            context: context, data: {'deviceId': metadata.deviceId}, paths: []);
        if (getDeviceResponse == null) {
          device =
              await deviceLocalDataSource.createDevice(context: context, data: {
            'platform': metadata.platform,
            'systemVersion': metadata.systemVersion,
            'deviceId': metadata.deviceId,
            'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
            'model': metadata.model
          }, paths: []);
        } else {
          final updateDeviceResponse = await deviceLocalDataSource
              .updateDevice(context: context, where: {
            'id': getDeviceResponse.id,
          }, data: {
            'platform': metadata.platform,
            'systemVersion': metadata.systemVersion,
            'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
            'model': metadata.model,
          }, paths: []);
          device = updateDeviceResponse!;
        }
        final getVerificationCodeResponse =
            await verificationCodeLocalDataSource
                .getVerificationCode(context: context, data: {
          'code': data['code'],
          'email': data['email'],
          'deviceId': metadata.deviceId,
          'type': 'SIGN_UP'
        }, paths: [
          NormalAttribute(name: 'id'),
          NormalAttribute(name: 'type'),
        ]);
        if (getVerificationCodeResponse == null) {
          return Left(GrpcError.invalidArgument('VerificationCode incorrect'));
        }
        final getUserResponse = await userLocalDataSource.getUser(
            context: context, data: {'email': data['email']}, paths: []);
        if (getUserResponse != null) {
          return Left(GrpcError.invalidArgument('User exists'));
        }
        final verificationCodeListResponse =
            await verificationCodeLocalDataSource.listVerificationCode(
                data: {
                  'email': data['email'],
                  'type': getVerificationCodeResponse.type.toString(),
                  'deviceId': metadata.deviceId
                },
                context: context,
                paths: [
                  NormalAttribute(name: 'id'),
                ]);
        if (verificationCodeListResponse.isNotEmpty) {
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'email': data['email'],
            'type': getVerificationCodeResponse.type.toString(),
            'deviceId': metadata.deviceId
          }, context: context);
        }
        final getBannedUserResponse = await bannedUserLocalDataSource
            .getBannedUser(context: context, data: {
          'email': data['email']
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (getBannedUserResponse != null) {
          return Left(GrpcError.invalidArgument('User Banned'));
        }
        final getBannedDeviceResponse = await bannedDeviceLocalDataSource
            .getBannedDevice(context: context, data: {
          'deviceId': metadata.deviceId
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (getBannedDeviceResponse != null) {
          return Left(GrpcError.invalidArgument('Device Banned'));
        }
        late RefreshToken refreshToken;
        late AuthorizationToken authorizationToken;
        User user =
            await userLocalDataSource.createUser(context: context, data: {
          'email': data['email'],
          'alias': data['alias'],
          'fullName': data['fullName'],
          'birthday': DateTime.parse(data['birthday']),
          'photo': data['photo']
        }, paths: []);
        refreshToken =
            await refreshTokenLocalDataSource.createRefreshToken(data: {
          'userFk': user.id,
          'deviceFk': device.id,
          'expirationTime': DateTime.now().add(Duration(hours: 24)),
        }, paths: [
          NormalAttribute(name: 'id'),
          NormalAttribute(name: 'refreshToken'),
        ], context: context);
        authorizationToken = await authorizationTokenLocalDataSource
            .createAuthorizationToken(data: {
          'refreshTokenFk': refreshToken.id,
          'deviceFk': device.id,
          'userFk': user.id,
          'app': metadata.app.toString(),
          'appVersion': metadata.appVersion
        }, paths: [], context: context);
        // await emailer.sendSignUpMail(
        //     recipient: user.email,
        //     ip: metadata.ipv4,
        //     device:
        //         '${metadata.model} - ${metadata.platform} ${metadata.systemVersion}',
        //     time: DateTime.now());
        var newRefreshToken = jsonWebToken
            .generateRefreshToken(payload: {'refreshTokenFk': refreshToken.id});
        var newAuthorizationToken =
            jsonWebToken.generateAuthorizationToken(payload: {
          'authorizationTokenFk': authorizationToken.id,
        });
        return Right(SignUpResponse(
            authorizationToken: newAuthorizationToken,
            refreshToken: newRefreshToken,
            user: user));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      if (error is SmtpClientCommunicationException) {
        if (error.message
            .contains('Response from server: < 550 Error: no such user')) {
          return Left(GrpcError.invalidArgument(
              'The mail server could not deliver the verification code email'));
        }
      }
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, RefreshTokenResponse>> refreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['refreshToken'] == null || data['refreshToken'] == '') {
        return Left(GrpcError.invalidArgument('Input `refreshToken` invalid'));
      }
      final refreshTokenPayload =
          jsonWebToken.verify(data['refreshToken'], 'RefreshToken');
      final refreshToken = await refreshTokenLocalDataSource.getRefreshToken(
          context: context,
          data: {'id': refreshTokenPayload['refreshTokenFk']},
          paths: []);
      if (refreshToken == null) {
        return Left(GrpcError.unauthenticated('Unauthenticated'));
      }
      final user = await userLocalDataSource.getUser(
          context: context, data: {'id': refreshToken.userFk}, paths: []);
      if (user == null) {
        return Left(GrpcError.unauthenticated('Unauthenticated'));
      }
      await refreshTokenLocalDataSource.deleteRefreshToken(
        context: context,
        data: {'id': refreshToken.id},
      );
      late Device device;
      final getDeviceResponse = await deviceLocalDataSource.getDevice(
          context: context, data: {'id': refreshToken.deviceFk}, paths: []);
      if (getDeviceResponse == null) {
        device =
            await deviceLocalDataSource.createDevice(context: context, data: {
          'platform': metadata.platform,
          'systemVersion': metadata.systemVersion,
          'deviceId': metadata.deviceId,
          'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
          'model': metadata.model
        }, paths: []);
      } else {
        final updateDeviceResponse =
            await deviceLocalDataSource.updateDevice(context: context, where: {
          'id': getDeviceResponse.id,
        }, data: {
          'platform': metadata.platform,
          'systemVersion': metadata.systemVersion,
          'firebaseCloudMessagingId': metadata.firebaseCloudMessagingId,
          'model': metadata.model,
        }, paths: []);
        device = updateDeviceResponse!;
      }
      var refreshTokenResponse =
          await refreshTokenLocalDataSource.createRefreshToken(data: {
        'userFk': user.id,
        'deviceFk': device.id,
        'expirationTime': DateTime.now().add(Duration(hours: 24)),
      }, paths: [
        NormalAttribute(name: 'id'),
        NormalAttribute(name: 'refreshToken'),
      ], context: context);
      var authorizationTokenResponse = await authorizationTokenLocalDataSource
          .createAuthorizationToken(data: {
        'refreshTokenFk': refreshTokenResponse.id,
        'deviceFk': device.id,
        'userFk': user.id,
        'app': metadata.app.toString(),
        'appVersion': metadata.appVersion
      }, paths: [], context: context);
      var newRefreshToken = jsonWebToken.generateRefreshToken(
          payload: {'refreshTokenFk': refreshTokenResponse.id});
      var newAuthorizationToken =
          jsonWebToken.generateAuthorizationToken(payload: {
        'authorizationTokenFk': authorizationTokenResponse.id,
      });
      return Right(RefreshTokenResponse(
          authorizationToken: newAuthorizationToken,
          refreshToken: newRefreshToken));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, void>> signOut(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['all']) {
        final authorizationTokenPayload = jsonWebToken.verify(
            metadata.authorizationToken!, 'AuthorizationToken');
        final authorizationToken = await authorizationTokenLocalDataSource
            .getAuthorizationToken(
                context: context,
                data: {'id': authorizationTokenPayload['authorizationTokenFk']},
                paths: [NormalAttribute(name: 'userFk')]);
        if (authorizationToken == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        final device = await deviceLocalDataSource.getDevice(
            context: context,
            data: {'deviceId': metadata.deviceId},
            paths: [NormalAttribute(name: 'id')]);
        if (device == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        await refreshTokenLocalDataSource.deleteRefreshToken(
          context: context,
          data: data,
          where: [
            WhereNormalAttributeEqual(
                key: 'userFk', value: authorizationToken.userFk),
            WhereNormalAttributeNotEqual(key: 'deviceFk', value: device.id)
          ],
        );
        return Right(null);
      } else if (data['authorizationTokenFk'] != '') {
        final authorizationTokenPayload = jsonWebToken.verify(
            metadata.authorizationToken!, 'AuthorizationToken');
        final authorizationTokenByMetadata =
            await authorizationTokenLocalDataSource.getAuthorizationToken(
                context: context,
                data: {'id': authorizationTokenPayload['authorizationTokenFk']},
                paths: [NormalAttribute(name: 'userFk')]);
        final authorizationTokenByRequest =
            await authorizationTokenLocalDataSource
                .getAuthorizationToken(context: context, data: {
          'id': data['authorizationTokenFk']
        }, paths: [
          NormalAttribute(name: 'userFk'),
          NormalAttribute(name: 'refreshTokenFk'),
        ]);
        if (authorizationTokenByMetadata!.userFk !=
            authorizationTokenByRequest!.userFk) {
          return Left(GrpcError.permissionDenied('Permission denied'));
        }
        await refreshTokenLocalDataSource.deleteRefreshToken(
          context: context,
          data: data,
          where: [
            WhereNormalAttributeEqual(
                key: 'id', value: authorizationTokenByRequest.refreshTokenFk),
          ],
        );
        return Right(null);
      } else {
        final authorizationTokenPayload = jsonWebToken.verify(
            metadata.authorizationToken!, 'AuthorizationToken');
        final authorizationTokenByMetadata =
            await authorizationTokenLocalDataSource
                .getAuthorizationToken(context: context, data: {
          'id': authorizationTokenPayload['authorizationTokenFk']
        }, paths: [
          NormalAttribute(name: 'refreshTokenFk'),
        ]);
        if (authorizationTokenByMetadata == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        await refreshTokenLocalDataSource.deleteRefreshToken(
          context: context,
          data: data,
          where: [
            WhereNormalAttributeEqual(
                key: 'id', value: authorizationTokenByMetadata.refreshTokenFk),
          ],
        );
        return Right(null);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, ListSessionResponse>> listSession(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      final authorizationTokenPayload = jsonWebToken.verify(
          metadata.authorizationToken!, 'AuthorizationToken');
      final authorizationToken = await authorizationTokenLocalDataSource
          .getAuthorizationToken(context: context, data: {
        'id': authorizationTokenPayload['authorizationTokenFk'],
      }, paths: [
        NormalAttribute(name: 'userFk'),
      ]);
      if (authorizationToken == null) {
        return Left(GrpcError.unauthenticated('Unauthenticated'));
      }
      final response = await sessionLocalDataSource.listSession(
        paths: [],
        context: context,
        data: {
          'userFk': authorizationToken.userFk,
          'authorizationTokenFk':
              authorizationTokenPayload['authorizationTokenFk'],
        },
      );
      return Right(ListSessionResponse(sessions: response));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
