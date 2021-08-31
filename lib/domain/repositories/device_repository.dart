import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class DeviceRepository {
  Future<Either<GrpcError, Device>> createDevice(
      {required Map<String, dynamic> data});
  Future<Either<GrpcError, Iterable<Device>>> listDevice();
  Future<Either<GrpcError, Device>> getDevice({required String id});
  Future<Either<GrpcError, void>> deleteDevice({required String id});
}
