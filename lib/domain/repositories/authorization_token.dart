import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class AuthorizationTokenRepository {
  Future<Either<GrpcError, AuthorizationToken>> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, Iterable<AuthorizationToken>>>
      listAuthorizationToken(
          {required PostgreSQLExecutionContext context,
          required Map<String, dynamic> data,
          required List<String> paths});
  Future<Either<GrpcError, AuthorizationToken>> getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, void>> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}
