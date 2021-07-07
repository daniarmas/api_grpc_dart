import 'package:api_grpc_dart/data/datasources/list_business_local_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/repositories/business_repository.dart';
import '../../protos/main.pb.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final ListBusinessLocalDataSource localDataSource;

  BusinessRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Business>>> listBusiness() async {
    return Right(await localDataSource.listBusiness());
  }
}
