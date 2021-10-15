import 'dart:convert';
import 'dart:typed_data';

import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

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
      required List<String> paths}) async {
    try {
      final response = await businessLocalDataSource.getBusiness(
          data: data, paths: paths, context: context);
      if (response != null) {
        return Right(GetBusinessResponse(business: response));
      }
      return Left(GrpcError.notFound('Not found'));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, ListBusinessResponse>> listBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths}) async {
    try {
      final response = await businessLocalDataSource.listBusiness(
          paths: paths, context: context, data: data);
      if (response.length <= 1) {
        response.shuffle();
        return Right(ListBusinessResponse(
          businesses: response,
          nextPage: '',
        ));
      } else {
        response.removeLast();
        response.shuffle();
        return Right(
          ListBusinessResponse(
              businesses: response,
              nextPage:
                  base64.encode(utf8.encode(response.last.name.toString()))),
        );
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
