import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class UserRepository {
  Future<Either<Failure, User>> createUser(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<User>>> listUser();
  Future<Either<Failure, User>> getUser({required String id});
  Future<Either<Failure, void>> deleteUser({required String id});
}
