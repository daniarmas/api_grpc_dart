import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

import '../../protos/protos/main.pb.dart';

@Injectable(as: BusinessRepository)
class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessLocalDataSource businessLocalDataSource;

  BusinessRepositoryImpl({required this.businessLocalDataSource});

  @override
  Future<Either<GrpcError, GetBusinessResponse>> getBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['id'] == null || data['id'] == '') {
        return Left(GrpcError.invalidArgument('Input `id` invalid'));
      } else {
        final response = await businessLocalDataSource.getBusiness(
            data: data, paths: paths, context: context);
        if (response != null) {
          return Right(GetBusinessResponse(business: response));
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, FeedResponse>> feed(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['location'] == null ||
          data['location'].latitude == 0.0 &&
              data['location'].longitude == 0.0) {
        return Left(GrpcError.invalidArgument('Input `location` invalid'));
      } else if (data['nextPage'] == null) {
        return Left(GrpcError.invalidArgument('Input `nextPage` invalid'));
      } else if (data['provinceFk'] == null || data['provinceFk'] == '') {
        return Left(GrpcError.invalidArgument('Input `provinceFk` invalid'));
      } else if (data['municipalityFk'] == null ||
          data['municipalityFk'] == '') {
        return Left(
            GrpcError.invalidArgument('Input `municipalityFk` invalid'));
      } else if (data['searchMunicipalityType'] == null ||
          data['searchMunicipalityType'] ==
              SearchMunicipalityType.SEARCH_MUNICIPALITY_TYPE_UNSPECIFIED) {
        return Left(GrpcError.invalidArgument(
            'Input `searchMunicipalityType` invalid'));
      } else {
        final response = await businessLocalDataSource.feed(
            paths: paths, context: context, data: data);
        return Right(response);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
