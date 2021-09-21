import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

import '../../core/error/exception.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/verification_code_local_data_source.dart';

@Injectable(as: VerificationCodeRepository)
class VerificationCodeRepositoryImpl implements VerificationCodeRepository {
  final VerificationCodeLocalDataSource verificationCodeLocalDataSource;
  final UserLocalDataSource userLocalDataSource;
  final BannedUserLocalDataSource bannedUserLocalDataSource;
  final BannedDeviceLocalDataSource bannedDeviceLocalDataSource;

  VerificationCodeRepositoryImpl(
      {required this.bannedUserLocalDataSource,
      required this.bannedDeviceLocalDataSource,
      required this.userLocalDataSource,
      required this.verificationCodeLocalDataSource});

  @override
  Future<Either<GrpcError, VerificationCode>> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      if (data['type'] ==
          VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED) {
        return Left(GrpcError.invalidArgument('Input `type` invalid'));
      } else if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
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
            context: context, data: {'email': data['email']}, paths: ['id']);
        if ((data['type'] == VerificationCodeType.SIGN_IN ||
                data['type'] == VerificationCodeType.CHANGE_USER_EMAIL) &&
            getUserResponse == null) {
          return Left(GrpcError.invalidArgument('User Not found'));
        } else if (data['type'] == VerificationCodeType.SIGN_UP &&
            getUserResponse != null) {
          return Left(GrpcError.invalidArgument('User Already Exists'));
        }
        final verificationCodeListResponse =
            await verificationCodeLocalDataSource.listVerificationCode(
                data: {
                  'email': data['email'],
                  'type': data['type'],
                  'deviceId': data['deviceId']
                },
                context: context,
                paths: ['id']);
        if (verificationCodeListResponse.isNotEmpty) {
          await verificationCodeLocalDataSource.deleteVerificationCode(data: {
            'email': data['email'],
            'type': data['type'],
            'deviceId': data['deviceId']
          }, context: context);
        }
        final response = await verificationCodeLocalDataSource
            .createVerificationCode(data: data, paths: paths, context: context);
        return Right(response);
      }
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      var sads = error;
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, Iterable<VerificationCode>>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      final response = await verificationCodeLocalDataSource
          .listVerificationCode(paths: paths, context: context, data: data);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, VerificationCode>> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      final response = await verificationCodeLocalDataSource
          .getVerificationCode(data: data, paths: paths, context: context);
      if (response != null) {
        return Right(response);
      }
      return Left(GrpcError.notFound('Not found'));
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
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
      await verificationCodeLocalDataSource
          .deleteVerificationCode(data: {'id': data['id']}, context: context);
      return Right(null);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on NotFoundException {
      throw GrpcError.notFound('Not Found');
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
