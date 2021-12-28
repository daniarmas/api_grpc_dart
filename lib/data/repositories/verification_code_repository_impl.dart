// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/verification_code_local_data_source.dart';

@Injectable(as: VerificationCodeRepository)
class VerificationCodeRepositoryImpl implements VerificationCodeRepository {
  final VerificationCodeLocalDataSource verificationCodeLocalDataSource;
  final UserLocalDataSource userLocalDataSource;
  final BannedUserLocalDataSource bannedUserLocalDataSource;
  final BannedDeviceLocalDataSource bannedDeviceLocalDataSource;
  final Emailer emailer;

  VerificationCodeRepositoryImpl(
      {required this.emailer,
      required this.bannedUserLocalDataSource,
      required this.bannedDeviceLocalDataSource,
      required this.userLocalDataSource,
      required this.verificationCodeLocalDataSource});

  @override
  Future<Either<GrpcError, CreateVerificationCodeResponse>>
      createVerificationCode(
          {required PostgreSQLExecutionContext context,
          required Map<String, dynamic> data,
          required HeadersMetadata metadata,
          required List<Attribute> paths}) async {
    try {
      if (data['type'] ==
          VerificationCodeType.VerificationCodeTypeUnspecified) {
        return Left(GrpcError.invalidArgument('Input `type` invalid'));
      } else if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
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
        final getUserResponse =
            await userLocalDataSource.getUser(context: context, data: {
          'email': data['email']
        }, paths: [
          NormalAttribute(name: 'id'),
        ]);
        if (data['type'] == VerificationCodeType.SignIn &&
            getUserResponse == null) {
          return Left(GrpcError.notFound('User not found'));
        } else if ((data['type'] == VerificationCodeType.SignUp ||
                data['type'] == VerificationCodeType.ChangeUserEmail) &&
            getUserResponse != null) {
          return Left(GrpcError.alreadyExists('User already exists'));
        }
        final verificationCodeListResponse =
            await verificationCodeLocalDataSource.listVerificationCode(
                data: {
                  'email': data['email'],
                  'type': data['type'],
                  'deviceId': metadata.deviceId
                },
                context: context,
                paths: [
                  NormalAttribute(name: 'id'),
                ]);
        if (verificationCodeListResponse.isNotEmpty) {
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'email': data['email'],
            'type': data['type'],
            'deviceId': metadata.deviceId
          }, context: context);
        }
        final response = await verificationCodeLocalDataSource
            .createVerificationCode(data: data, paths: paths, context: context);
        // await emailer.sendVerificationCodeMail(
        //     verificationCodeType: data['type'],
        //     code: response.code,
        //     recipient: response.email,
        //     ip: metadata.ipv4,
        //     device:
        //         '${metadata.model} - ${metadata.platform} ${metadata.systemVersion}',
        //     time: DateTime.parse(response.createTime));
        return Right(
            CreateVerificationCodeResponse(verificationCode: response));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      if (error is SmtpClientCommunicationException) {
        if (error.message
            .contains('Response from server: < 550 Error: no such user')) {
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'email': data['email'],
            'type': data['type'],
            'deviceId': metadata.deviceId
          }, context: context);
          return Left(GrpcError.invalidArgument(
              'The mail server could not deliver the verification code email'));
        }
      }
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, ListVerificationCodeResponse>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      final response = await verificationCodeLocalDataSource
          .listVerificationCode(paths: paths, context: context, data: data);
      return Right(ListVerificationCodeResponse(verificationCodes: response));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, GetVerificationCodeResponse>> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      final response = await verificationCodeLocalDataSource
          .getVerificationCode(data: data, paths: paths, context: context);
      if (response != null) {
        return Right(GetVerificationCodeResponse(verificationCode: response));
      }
      return Left(GrpcError.notFound('Not found'));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, void>> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required HeadersMetadata metadata,
      required Map<String, dynamic> data}) async {
    try {
      final result = await verificationCodeLocalDataSource
          .deleteVerificationCode(data: {'id': data['id']}, context: context);
      if (result) {
        return Right(null);
      } else {
        return Left(GrpcError.notFound('Not Found'));
      }
    } on GrpcError {
      rethrow;
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, UpdateVerificationCodeResponse>>
      updateVerificationCode(
          {required PostgreSQLExecutionContext context,
          required Map<String, dynamic> data,
          required HeadersMetadata metadata,
          required List<Attribute> paths}) async {
    try {
      final response = await verificationCodeLocalDataSource
          .updateVerificationCode(data: data, paths: paths, context: context);
      if (response != null) {
        return Right(
            UpdateVerificationCodeResponse(verificationCode: response));
      }
      return Left(GrpcError.notFound('Not found'));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
