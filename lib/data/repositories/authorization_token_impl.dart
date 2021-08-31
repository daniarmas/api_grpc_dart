import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/authorization_token.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: AuthorizationTokenRepository)
class AuthorizationTokenRepositoryImpl implements AuthorizationTokenRepository {
  final AuthorizationTokenLocalDataSource localDataSource;

  AuthorizationTokenRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, AuthorizationToken>> createAuthorizationToken(
      {required Map<String, dynamic> data}) async {
    try {
      final response =
          await localDataSource.createAuthorizationToken(data: data);
      return Right(response);
    } catch (error) {
      var sad = error;
      return Left(ServerFailure());
    }
    // }
    // on InternalException {
    //   return Left(ServerFailure());
    // }
  }

  @override
  Future<Either<Failure, Iterable<AuthorizationToken>>>
      listAuthorizationToken() async {
    try {
      final response = await localDataSource.listAuthorizationToken();
      return Right(response);
    } on InternalException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthorizationToken>> getAuthorizationToken(
      {required String id}) async {
    try {
      final response = await localDataSource.getAuthorizationToken(id: id);
      return Right(response);
    } on NotFoundException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAuthorizationToken(
      {required String id}) async {
    try {
      localDataSource.deleteAuthorizationToken(id: id);
      return Right(null);
    } on NotFoundException {
      return Left(ServerFailure());
    }
  }
}
