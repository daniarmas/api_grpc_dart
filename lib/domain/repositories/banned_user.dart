import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BannedUserRepository {
  Future<Either<Failure, BannedUser>> createBannedUser(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<BannedUser>>> listBannedUser();
  Future<Either<Failure, BannedUser>> getBannedUser({required String id});
  Future<Either<Failure, void>> deleteBannedUser({required String id});
}
