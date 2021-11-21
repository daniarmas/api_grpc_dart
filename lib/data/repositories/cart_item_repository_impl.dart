// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/cart_item_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/cart_item_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/cart_item_repository.dart';
import 'package:api_grpc_dart/domain/repositories/cart_item_repository.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: CartItemRepository)
class CartItemRepositoryImpl implements CartItemRepository {
  final AuthorizationTokenLocalDataSource authorizationTokenLocalDataSource;
  final CartItemLocalDataSource cartItemLocalDataSource;
  final JsonWebToken jsonWebToken;
  final Database database;

  CartItemRepositoryImpl({
    required this.cartItemLocalDataSource,
    required this.database,
    required this.jsonWebToken,
    required this.authorizationTokenLocalDataSource,
  });

  @override
  Future<Either<GrpcError, Item>> getCartItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      if (data['id'] == null || data['id'] == '') {
        return Left(GrpcError.invalidArgument('Input `id` invalid'));
      } else {
        final authorizationTokenPayload =
            jsonWebToken.verify(metadata.authorization!, 'AuthorizationToken');
        final authorizationToken = await authorizationTokenLocalDataSource
            .getAuthorizationToken(context: context, data: {
          'id': authorizationTokenPayload['authorizationTokenFk']
        }, paths: [
          NormalAttribute(name: 'userFk'),
        ]);
        if (authorizationToken == null) {
          return Left(GrpcError.unauthenticated('Unauthenticated'));
        }
        final response = await cartItemLocalDataSource.getCartItem(data: {
          'id': data['id'],
          'userFk': authorizationToken.userFk,
        }, paths: paths, context: context);
        if (response != null) {
          return Right(response);
        }
        return Left(GrpcError.notFound('Not found'));
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }

  @override
  Future<Either<GrpcError, List<Item>>> listCartItem(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      final authorizationTokenPayload =
          jsonWebToken.verify(metadata.authorization!, 'AuthorizationToken');
      final authorizationToken = await authorizationTokenLocalDataSource
          .getAuthorizationToken(context: context, data: {
        'id': authorizationTokenPayload['authorizationTokenFk']
      }, paths: [
        NormalAttribute(name: 'userFk'),
      ]);
      if (authorizationToken == null) {
        return Left(GrpcError.unauthenticated('Unauthenticated'));
      }
      final response = await cartItemLocalDataSource
          .listCartItem(paths: paths, context: context, data: {
        'userFk': authorizationToken.userFk,
        'nextPage': data['nextPage'],
      });
      if (response.length <= 5) {
        return Right(response);
      } else {
        response.removeLast();
        return Right(response);
      }
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
