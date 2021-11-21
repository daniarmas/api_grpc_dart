// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/cart_item_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/cart_item_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'item_repository_impl_test.mocks.dart';

@GenerateMocks([CartItemLocalDataSource, Database])
void main() {
  late EnvironmentApp environment;
  // late MockCartItemLocalDataSource mockCartItemLocalDataSource;
  late MockDatabase mockDatabase;
  late CartItemRepositoryImpl cartItemRepositoryImpl;
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext ctx;
  late HeadersMetadata metadata;
  test('cart item repository impl ...', () async {
    // TODO: Implement test
  });
}