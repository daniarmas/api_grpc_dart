import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/authorization_token.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exception.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: AuthorizationTokenRepository)
class AuthorizationTokenRepositoryImpl implements AuthorizationTokenRepository {
  final AuthorizationTokenLocalDataSource localDataSource;

  AuthorizationTokenRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<GrpcError, AuthorizationToken>> createAuthorizationToken(
      {required Map<String, dynamic> data}) async {
    try {
      final response =
          await localDataSource.createAuthorizationToken(data: data);
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
      listAuthorizationToken() async {
    try {
      final response = await localDataSource.listAuthorizationToken();
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
      {required String id}) async {
    try {
      final response = await localDataSource.getAuthorizationToken(id: id);
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
  Future<Either<GrpcError, void>> deleteAuthorizationToken(
      {required String id}) async {
    try {
      localDataSource.deleteAuthorizationToken(id: id);
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
