import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/grpc/main.pb.dart';

// ignore: one_member_abstracts
abstract class BusinessRepository {
  Future<Either<Failure, List<Business>>> listBusiness();
}
