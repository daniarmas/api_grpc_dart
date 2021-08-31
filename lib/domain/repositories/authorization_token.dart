import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class AuthorizationTokenRepository {
  Future<Either<Failure, AuthorizationToken>> createAuthorizationToken(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<AuthorizationToken>>>
      listAuthorizationToken();
  Future<Either<Failure, AuthorizationToken>> getAuthorizationToken(
      {required String id});
  Future<Either<Failure, void>> deleteAuthorizationToken({required String id});
}
