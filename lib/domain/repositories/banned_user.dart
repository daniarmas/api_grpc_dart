import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BannedUserRepository {
  Future<Either<GrpcError, BannedUser>> createBannedUser(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<BannedUser>>> listBannedUser();
  Future<Either<GrpcError, BannedUser>> getBannedUser({required String id});
  Future<Either<GrpcError, void>> deleteBannedUser({required String id});
}
