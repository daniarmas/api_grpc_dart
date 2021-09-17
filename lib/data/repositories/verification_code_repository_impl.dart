import 'package:api_grpc_dart/core/utils/string_utils.dart';
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
  final VerificationCodeLocalDataSource localDataSource;

  VerificationCodeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<GrpcError, VerificationCode>> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      if (data['type'] == VerificationCodeType.UNSPECIFIED) {
        return Left(GrpcError.invalidArgument('Input `type` invalid'));
      } else if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
        final verificationCodeListResponse = await localDataSource
            .listVerificationCodeReturnIds(data: {
          'email': data['email'],
          'type': data['type'],
          'deviceId': data['deviceId']
        }, context: context);
        if (verificationCodeListResponse.isNotEmpty) {
          await localDataSource
              .deleteVerificationCodeBeforeCreateVerificationCode(data: {
            'email': data['email'],
            'type': data['type'],
            'deviceId': data['deviceId']
          }, context: context);
        }
        final response = await localDataSource.createVerificationCode(
            data: data, paths: paths, context: context);
        return Right(response);
      }
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, Iterable<VerificationCode>>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required List<String> paths}) async {
    try {
      final response = await localDataSource.listVerificationCode(
          paths: paths, context: context);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, VerificationCode>> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final response = await localDataSource.getVerificationCode(
          data: data, paths: paths, context: context);
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
  Future<Either<GrpcError, void>> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await localDataSource
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
