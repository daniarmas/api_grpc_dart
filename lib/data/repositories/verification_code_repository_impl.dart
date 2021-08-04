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
      return localDataSource.createVerificationCode(data: data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Iterable<VerificationCode>>>
      listVerificationCode() async {
    try {
      return localDataSource.listVerificationCode();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
