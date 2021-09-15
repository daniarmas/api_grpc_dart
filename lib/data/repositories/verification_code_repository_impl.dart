import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

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
      {required Map<String, dynamic> data, required List<String> paths}) async {
    try {
      if (data['type'] == VerificationCodeType.UNSPECIFIED) {
        return Left(GrpcError.invalidArgument('Input `type` invalid'));
      } else if (!StringUtils.isEmail(data['email'])) {
        return Left(GrpcError.invalidArgument('Input `email` invalid'));
      } else {
        final verificationCodeListResponse =
            await localDataSource.listVerificationCodeReturnIds(data: data);
        if (verificationCodeListResponse.isNotEmpty) {
          await localDataSource
              .deleteVerificationCodeBeforeCreateVerificationCode(data: data);
        }
        final response = await localDataSource.createVerificationCode(
            data: data, paths: paths);
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
      {required List<String> paths}) async {
    try {
      final response = await localDataSource.listVerificationCode(paths: paths);
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
      {required String id, required List<String> paths}) async {
    try {
      final response =
          await localDataSource.getVerificationCode(id: id, paths: paths);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on GrpcError {
      rethrow;
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, void>> deleteVerificationCode(
      {required String id}) async {
    try {
      await localDataSource.deleteVerificationCode(data: {'id': id});
      return Right(null);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on NotFoundException {
      throw GrpcError.notFound('Not Found');
    } on GrpcError {
      rethrow;
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
