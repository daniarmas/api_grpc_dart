import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class RefreshTokenRepository {
  Future<Either<GrpcError, RefreshToken>> createRefreshToken(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<RefreshToken>>> listRefreshToken();
  Future<Either<GrpcError, RefreshToken>> getRefreshToken({required String id});
  Future<Either<GrpcError, void>> deleteRefreshToken({required String id});
}
