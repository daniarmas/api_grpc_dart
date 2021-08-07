import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/repositories/business_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/business_local_data_source.dart';

@Injectable(as: BusinessRepository)
class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessLocalDataSource localDataSource;

  BusinessRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Business>>> listBusiness(
      LatLng latLng, List<String> notIds) async {
    try {
      var response =
          await localDataSource.listBusiness(latLng: latLng, notIds: notIds);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
