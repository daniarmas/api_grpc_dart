import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/attribute.dart';

import '../../protos/protos/main.pb.dart';

abstract class AuthenticationRepository {
  Future<Either<GrpcError, SignInResponse>> signIn({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, SignUpResponse>> signUp({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, ListSessionResponse>> listSession({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, void>> signOut({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, RefreshTokenResponse>> refreshToken({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, CheckSessionResponse>> checkSession({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
  });
}
