// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/order_local_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/order_repository.dart';
import '../../protos/protos/main.pb.dart' as grpc_model;
import '../../protos/protos/main.pb.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource orderLocalDataSource;
  final AuthorizationTokenLocalDataSource authorizationTokenLocalDataSource;
  final JsonWebToken jsonWebToken;

  OrderRepositoryImpl({
    required this.orderLocalDataSource,
    required this.jsonWebToken,
    required this.authorizationTokenLocalDataSource,
  });

  @override
  Future<Either<GrpcError, grpc_model.Order>> getOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<GrpcError, ListOrderResponse>> listOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<Attribute> paths}) async {
    try {
      final userId =
          jsonWebToken.verify(metadata.authorization!, 'AuthorizationToken');
      final authorizationToken = await authorizationTokenLocalDataSource
          .getAuthorizationToken(context: context, data: {
        'id': userId['authorizationTokenFk'],
      }, paths: [
        NormalAttribute(name: 'userFk'),
      ]);
      if (authorizationToken == null) {
        throw GrpcError.unauthenticated('Unauthenticated');
      }
      data.addAll({'userFk': authorizationToken.userFk});
      final response = await orderLocalDataSource.listOrder(
          paths: paths, context: context, data: data);
      if (response.length >= 5) {
        response.removeLast();
      }
      return Right(ListOrderResponse(
          orders: response,
          nextPage: (response.isNotEmpty) ? response.last.createTime : ''));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
