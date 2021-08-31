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
      {required Map<String, dynamic> data}) async {
    try {
      final response = await localDataSource.createVerificationCode(data: data);
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
  Future<Either<GrpcError, Iterable<VerificationCode>>>
      listVerificationCode() async {
    try {
      final response = await localDataSource.listVerificationCode();
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
      {required String id}) async {
    try {
      final response = await localDataSource.getVerificationCode(id: id);
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
  Future<Either<GrpcError, void>> deleteVerificationCode(
      {required String id}) async {
    try {
      localDataSource.deleteVerificationCode(id: id);
      return Right(null);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
