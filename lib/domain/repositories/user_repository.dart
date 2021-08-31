import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class UserRepository {
  Future<Either<GrpcError, User>> createUser(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<User>>> listUser();
  Future<Either<GrpcError, User>> getUser({required String id});
  Future<Either<GrpcError, void>> deleteUser({required String id});
}
