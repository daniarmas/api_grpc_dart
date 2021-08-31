import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class RefreshTokenRepository {
  Future<Either<Failure, RefreshToken>> createRefreshToken(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<RefreshToken>>> listRefreshToken();
  Future<Either<Failure, RefreshToken>> getRefreshToken({required String id});
  Future<Either<Failure, void>> deleteRefreshToken({required String id});
}
