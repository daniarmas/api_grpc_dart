import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

abstract class AuthorizationTokenRepository {
  Future<Either<GrpcError, Iterable<AuthorizationToken>>>
      listAuthorizationToken(
          {required PostgreSQLExecutionContext context,
          required Map<String, dynamic> data,
          required HeadersMetadata metadata,
          required List<String> paths});
  Future<Either<GrpcError, AuthorizationToken>> getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required HeadersMetadata metadata,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, void>> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required HeadersMetadata metadata,
      required Map<String, dynamic> data});
}
