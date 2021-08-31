import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BannedDeviceRepository {
  Future<Either<GrpcError, BannedDevice>> createBannedDevice(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<BannedDevice>>> listBannedDevice();
  Future<Either<GrpcError, BannedDevice>> getBannedDevice({required String id});
  Future<Either<GrpcError, void>> deleteBannedDevice({required String id});
}
