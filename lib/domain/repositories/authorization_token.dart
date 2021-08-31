import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class AuthorizationTokenRepository {
  Future<Either<GrpcError, AuthorizationToken>> createAuthorizationToken(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<AuthorizationToken>>>
      listAuthorizationToken();
  Future<Either<GrpcError, AuthorizationToken>> getAuthorizationToken(
      {required String id});
  Future<Either<GrpcError, void>> deleteAuthorizationToken(
      {required String id});
}
