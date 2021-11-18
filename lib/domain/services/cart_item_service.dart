// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import '../../protos/protos/main.pbgrpc.dart';

class CartItemService extends CartItemServiceBase {
  @override
  Future<ListCartItemResponse> listCartItem(
      ServiceCall call, ListCartItemRequest request) {
    // TODO: implement listCartItem
    throw UnimplementedError();
  }
}
