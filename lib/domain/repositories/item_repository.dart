import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

abstract class ItemRepository {
  Future<Either<GrpcError, List<Item>>> listItem({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<String> paths,
  });
  Future<Either<GrpcError, Item>> getItem({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<String> paths,
  });
}
