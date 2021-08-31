import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exception.dart';
import '../../domain/repositories/business_repository.dart';
import '../../protos/protos/main.pb.dart';
import '../datasources/business_local_data_source.dart';

@Injectable(as: BusinessRepository)
class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessLocalDataSource localDataSource;

  BusinessRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<GrpcError, List<Business>>> listBusiness(
      LatLng latLng, List<String> notIds) async {
    try {
      var response =
          await localDataSource.listBusiness(latLng: latLng, notIds: notIds);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
