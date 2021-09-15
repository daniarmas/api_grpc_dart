import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeRepository {
  Future<Either<GrpcError, VerificationCode>> createVerificationCode(
      {required Map<String, dynamic> data, required List<String> paths});
  Future<Either<GrpcError, Iterable<VerificationCode>>> listVerificationCode(
      {required List<String> paths});
  Future<Either<GrpcError, VerificationCode>> getVerificationCode(
      {required String id, required List<String> paths});
  Future<Either<GrpcError, void>> deleteVerificationCode({required String id});
}
