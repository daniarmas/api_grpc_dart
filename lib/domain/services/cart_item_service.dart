// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:api_grpc_dart/domain/repositories/cart_item_repository.dart';
import '../../protos/protos/main.pbgrpc.dart';

class CartItemService extends CartItemServiceBase {
  Database database = GetIt.I<Database>();

  @override
  Future<ListCartItemResponse> listCartItem(
      ServiceCall call, ListCartItemRequest request) async {
    try {
      late ListCartItemResponse response;
      CartItemRepository cartItemRepository = GetIt.I<CartItemRepository>();
      late Either<GrpcError, List<Item>> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await cartItemRepository.listCartItem(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: getPaths(request.fieldMask.paths),
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response = ListCartItemResponse(
                    items: right,
                    nextPage: (right.isNotEmpty) ? right.last.name : '')
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
  Future<GetCartItemResponse> getCartItem(
      ServiceCall call, GetCartItemRequest request) async {
    try {
      late GetCartItemResponse response;
      CartItemRepository itemRepository = GetIt.I<CartItemRepository>();
      late Either<GrpcError, Item> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await itemRepository.getCartItem(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: getPaths(request.fieldMask.paths),
            context: context);
      });
      result.fold((left) => {throw left},
          (right) => {response = GetCartItemResponse(item: right)});
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
