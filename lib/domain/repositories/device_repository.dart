import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class DeviceRepository {
  Future<Either<Failure, Device>> createDevice(
      {required Map<String, dynamic> data});
  Future<Either<Failure, Iterable<Device>>> listDevice();
  Future<Either<Failure, Device>> getDevice({required String id});
  Future<Either<Failure, void>> deleteDevice({required String id});
}
