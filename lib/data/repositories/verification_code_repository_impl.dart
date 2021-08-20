import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/verification_code_local_data_source.dart';

@Injectable(as: VerificationCodeRepository)
class VerificationCodeRepositoryImpl implements VerificationCodeRepository {
  final VerificationCodeLocalDataSource localDataSource;

  VerificationCodeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, VerificationCode>> createVerificationCode(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await localDataSource.createVerificationCode(data: data);
      return Right(response);
    } on InternalException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Iterable<VerificationCode>>>
      listVerificationCode() async {
    try {
      final response = await localDataSource.listVerificationCode();
      return Right(response);
    } on InternalException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, VerificationCode>> getVerificationCode(
      {required String id}) async {
    try {
      final response = await localDataSource.getVerificationCode(id: id);
      return Right(response);
    } on NotFoundException {
      return Left(ServerFailure());
    }
  }
}
