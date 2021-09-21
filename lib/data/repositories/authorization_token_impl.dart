import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/authorization_token.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';

import '../../core/error/exception.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: AuthorizationTokenRepository)
class AuthorizationTokenRepositoryImpl implements AuthorizationTokenRepository {
  final AuthorizationTokenLocalDataSource localDataSource;

  AuthorizationTokenRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<GrpcError, AuthorizationToken>> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final response = await localDataSource.createAuthorizationToken(
          data: data, paths: paths, context: context);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, Iterable<AuthorizationToken>>>
      listAuthorizationToken(
          {required PostgreSQLExecutionContext context,
          required Map<String, dynamic> data,
          required List<String> paths}) async {
    try {
      final response = await localDataSource.listAuthorizationToken(
          context: context, data: data, paths: paths);
      return Right(response);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, AuthorizationToken>> getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final response = await localDataSource.getAuthorizationToken(
          data: data, context: context, paths: paths);
      if (response != null) {
        return Right(response);
      }
      return Left(GrpcError.notFound('Not found'));
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, void>> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      localDataSource.deleteAuthorizationToken(data: data, context: context);
      return Right(null);
    } on DatabaseConnectionNotOpenException {
      return Left(GrpcError.internal('Internal server error'));
    } on DatabaseTableNotExistsException {
      return Left(GrpcError.internal('Internal server error'));
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
