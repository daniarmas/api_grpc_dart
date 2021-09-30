import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/refresh_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
import 'package:api_grpc_dart/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:postgres/postgres.dart';
import 'package:uuid/uuid.dart';

import '../../protos/protos/main.pb.dart';
import '../datasources/verification_code_local_data_source.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationImpl implements AuthenticationRepository {
  final Emailer emailer;
  final VerificationCodeLocalDataSource verificationCodeLocalDataSource;
  final UserLocalDataSource userLocalDataSource;
  final DeviceLocalDataSource deviceLocalDataSource;
  final BannedUserLocalDataSource bannedUserLocalDataSource;
  final BannedDeviceLocalDataSource bannedDeviceLocalDataSource;
  final AuthorizationTokenLocalDataSource authorizationTokenLocalDataSource;
  final RefreshTokenLocalDataSource refreshTokenLocalDataSource;

  AuthenticationImpl(
      {required this.emailer,
      required this.deviceLocalDataSource,
      required this.authorizationTokenLocalDataSource,
      required this.refreshTokenLocalDataSource,
      required this.bannedUserLocalDataSource,
      required this.bannedDeviceLocalDataSource,
      required this.userLocalDataSource,
      required this.verificationCodeLocalDataSource});

  @override
  Future<Either<GrpcError, SignInResponse>> signIn(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
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
          'id',
          'type'
        ]);
        if (getVerificationCodeResponse == null) {
          return Left(GrpcError.invalidArgument('VerificationCode Not found'));
        }
        final getBannedUserResponse = await bannedUserLocalDataSource
            .getBannedUser(
                context: context,
                data: {'email': data['email']},
                paths: ['id']);
        if (getBannedUserResponse != null) {
          return Left(GrpcError.invalidArgument('User Banned'));
        }
        final getBannedDeviceResponse = await bannedDeviceLocalDataSource
            .getBannedDevice(
                context: context,
                data: {'deviceId': metadata.deviceId},
                paths: ['id']);
        if (getBannedDeviceResponse != null) {
          return Left(GrpcError.invalidArgument('Device Banned'));
        }
        final getUserResponse = await userLocalDataSource.getUser(
            context: context, data: {'email': data['email']}, paths: []);
        if (getUserResponse == null) {
          return Left(GrpcError.invalidArgument('User Not found'));
        }
        final verificationCodeListResponse =
            await verificationCodeLocalDataSource.listVerificationCode(
                data: {
                  'email': data['email'],
                  'type': getVerificationCodeResponse.type.toString(),
                  'deviceId': metadata.deviceId
                },
                context: context,
                paths: ['id']);
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
          'id',
          'refreshToken'
        ]);
        if (getRefreshTokenResponse != null) {
          await refreshTokenLocalDataSource.deleteRefreshToken(
              data: {'id': getRefreshTokenResponse.id}, context: context);
        }
        String refreshTokenId = Uuid().v4();
        refreshToken =
            await refreshTokenLocalDataSource.createRefreshToken(data: {
          'id': refreshTokenId,
          'userFk': getUserResponse.id,
          'deviceFk': device.id,
          'refreshToken': JsonWebToken().generateRefreshToken(
              payload: {'refreshTokenFk': refreshTokenId}),
          'expirationTime': DateTime.now().add(Duration(hours: 24)),
        }, paths: [
          'id',
          'refreshToken'
        ], context: context);
        String id = Uuid().v4();
        authorizationToken = await authorizationTokenLocalDataSource
            .createAuthorizationToken(data: {
          'id': id,
          'authorizationToken':
              JsonWebToken().generateAuthorizationToken(payload: {
            'authorizationTokenFk': id,
          }),
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
        return Right(SignInResponse(
            authorizationToken: authorizationToken.authorizationToken,
            refreshToken: refreshToken.refreshToken,
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
}
