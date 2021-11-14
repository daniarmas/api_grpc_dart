// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import '../../protos/protos/main.pb.dart' as grpc_model;

abstract class OrderRepository {
  Future<Either<GrpcError, List<grpc_model.Order>>> listItem({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, grpc_model.SearchItemResponse>> searchItem({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, grpc_model.Item>> getItem({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
}
