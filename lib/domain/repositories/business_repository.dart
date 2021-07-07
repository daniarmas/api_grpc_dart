import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BusinessRepository {
  Future<Either<Failure, List<Business>>> listBusiness();
}
