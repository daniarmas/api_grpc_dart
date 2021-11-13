import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/domain/repositories/object_storage_repository.dart';
import 'package:api_grpc_dart/protos/protos/main.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../environment.dart';

class OrderService extends OrderServiceBase {
  @override
  Future<ListOrderResponse> listOrder(
      ServiceCall call, ListOrderRequest request) {
    // TODO: implement listOrder
    throw UnimplementedError();
  }
}
