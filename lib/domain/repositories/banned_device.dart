import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class BannedDeviceRepository {
  Future<Either<Failure, BannedDevice>> createBannedDevice(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<BannedDevice>>> listBannedDevice();
  Future<Either<Failure, BannedDevice>> getBannedDevice({required String id});
  Future<Either<Failure, void>> deleteBannedDevice({required String id});
}
