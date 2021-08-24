import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeRepository {
  Future<Either<Failure, VerificationCode>> createVerificationCode(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<VerificationCode>>> listVerificationCode();
  Future<Either<Failure, VerificationCode>> getVerificationCode(
      {required String id});
  Future<Either<Failure, void>> deleteVerificationCode({required String id});
}
