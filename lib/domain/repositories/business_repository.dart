import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BusinessRepository {
  Future<Either<GrpcError, Iterable<Business>>> listBusiness(
      LatLng latLng, List<String> notIds);
}
