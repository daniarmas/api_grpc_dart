import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BusinessRepository {
  Future<Either<GrpcError, Iterable<Business>>> listBusiness(
      {required PostgreSQLExecutionContext context,
      required LatLng latLng,
      required List<String> notIds});
}
