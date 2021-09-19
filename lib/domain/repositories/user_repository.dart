import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

abstract class UserRepository {
  Future<Either<GrpcError, User>> createUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, Iterable<User>>> listUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, User>> getUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<Either<GrpcError, void>> deleteUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}
