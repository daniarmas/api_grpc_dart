// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class UserRepository {
  // Future<Either<GrpcError, User>> createUser(
  //     {required PostgreSQLExecutionContext context,
  //     required Map<String, dynamic> data,
  //     required HeadersMetadata metadata,
  //     required List<String> paths});
  // Future<Either<GrpcError, Iterable<User>>> listUser(
  //     {required PostgreSQLExecutionContext context,
  //     required Map<String, dynamic> data,
  //     required HeadersMetadata metadata,
  //     required List<String> paths});
  Future<Either<GrpcError, User>> getUser({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, UpdateUserResponse>> updateUser({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, UserExistsStreamResponse>> userExistsStream({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
  });
  // Future<Either<GrpcError, void>> deleteUser(
  //     {required PostgreSQLExecutionContext context,
  //     required HeadersMetadata metadata,
  //     required Map<String, dynamic> data});
}
