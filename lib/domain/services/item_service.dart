import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class ItemService extends ItemServiceBase {
  Database database = GetIt.I<Database>();

  @override
  Future<GetItemResponse> getItem(
      ServiceCall call, GetItemRequest request) async {
    try {
      late GetItemResponse response;
      ItemRepository itemRepository = GetIt.I<ItemRepository>();
      late Either<GrpcError, Item> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await itemRepository.getItem(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: getPaths(request.fieldMask.paths),
            context: context);
      });
      result.fold((left) => {throw left},
          (right) => {response = GetItemResponse(item: right)});
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
  Future<ListItemResponse> listItem(
      ServiceCall call, ListItemRequest request) async {
    try {
      late ListItemResponse response;
      ItemRepository itemRepository = GetIt.I<ItemRepository>();
      late Either<GrpcError, List<Item>> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await itemRepository.listItem(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: getPaths(request.fieldMask.paths),
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response =
                    ListItemResponse(items: right, nextPage: right.last.name)
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
  Future<SearchItemResponse> searchItem(
      ServiceCall call, SearchItemRequest request) async {
    try {
      late SearchItemResponse response;
      ItemRepository itemRepository = GetIt.I<ItemRepository>();
      late Either<GrpcError, SearchItemResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await itemRepository.searchItem(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: getPaths(request.fieldMask.paths),
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold((left) => {throw left}, (right) => {response = right});
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
