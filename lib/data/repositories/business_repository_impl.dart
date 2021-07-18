import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repositories/business_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/list_business_local_data_source.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final ListBusinessLocalDataSource localDataSource;

  BusinessRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Iterable<Business>>> listBusiness() async {
    try {
      return await localDataSource.listBusiness();
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
