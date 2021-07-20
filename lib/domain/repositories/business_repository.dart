import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BusinessRepository {
  Future<Either<Failure, Iterable<Business>>> listBusiness(
      LatLng latLng, List<String> notIds);
}
