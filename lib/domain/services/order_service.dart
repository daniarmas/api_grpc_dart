// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/order_repository.dart';
import 'package:api_grpc_dart/protos/protos/main.pbgrpc.dart' as grpc_model;
import 'package:api_grpc_dart/protos/protos/main.pbgrpc.dart';

class OrderService extends OrderServiceBase {
  Database database = GetIt.I<Database>();

  @override
  Future<ListOrderResponse> listOrder(
      ServiceCall call, ListOrderRequest request) async {
    try {
      late ListOrderResponse response;
      OrderRepository orderRepository = GetIt.I<OrderRepository>();
      late Either<GrpcError, grpc_model.ListOrderResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await orderRepository.listOrder(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: getPaths(request.fieldMask.paths),
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response = right,
              });
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<grpc_model.GetOrderResponse> getOrder(
      ServiceCall call, grpc_model.GetOrderRequest request) async {
    try {
      late GetOrderResponse response;
      OrderRepository orderRepository = GetIt.I<OrderRepository>();
      late Either<GrpcError, grpc_model.Order> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await orderRepository.getOrder(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: getPaths(request.fieldMask.paths),
            context: context);
      });
      result.fold((left) => {throw left},
          (right) => {response = GetOrderResponse(order: right)});
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }
}
