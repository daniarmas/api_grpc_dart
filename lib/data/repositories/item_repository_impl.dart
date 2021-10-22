import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/item_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

@Injectable(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource itemLocalDataSource;

  ItemRepositoryImpl({required this.itemLocalDataSource});

  @override
  Future<Either<GrpcError, Item>> getItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      if (data['id'] == null || data['id'] == '') {
        return Left(GrpcError.invalidArgument('Input `id` invalid'));
      } else {
        final response = await itemLocalDataSource.getItem(
            data: data, paths: paths, context: context);
        if (response != null) {
          return Right(response);
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception catch (error) {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, List<Item>>> listItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      final response = await itemLocalDataSource.listItem(
          paths: paths, context: context, data: data);
      if (response.length <= 5) {
        response.shuffle();
        return Right(response);
      } else {
        response.removeLast();
        return Right(response);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, SearchItemResponse>> searchItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      if (data['nextPage'] == null) {
        return Left(GrpcError.invalidArgument('Input `nextPage` invalid'));
      } else if (data['location'] == null ||
          data['location'].latitude == 0.0 ||
          data['location'].longitude == 0.0) {
        return Left(GrpcError.invalidArgument('Input `location` invalid'));
      } else if (data['name'] == null || data['name'] == '') {
        return Left(GrpcError.invalidArgument('Input `name` invalid'));
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
        final response = await itemLocalDataSource.searchItem(
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
