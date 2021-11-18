// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/order_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/order_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart' as grpc_model;
import './order_repository_impl_test.mocks.dart';

@GenerateMocks([
  JsonWebToken,
  AuthorizationTokenLocalDataSource,
  OrderLocalDataSource,
  Database,
])
void main() {
  late EnvironmentApp environment;
  late MockOrderLocalDataSource mockOrderLocalDataSource;
  late MockAuthorizationTokenLocalDataSource
      mockAuthorizationTokenLocalDataSource;
  late MockDatabase mockDatabase;
  late MockJsonWebToken mockJsonWebToken;
  late OrderRepositoryImpl orderRepositoryImpl;
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext ctx;
  late HeadersMetadata metadata;

  setUpAll(() {
    configureDependencies();
    environment = GetIt.I<EnvironmentApp>();
  });

  setUp(() async {
    connection = PostgreSQLConnection(environment.databaseHost,
        environment.databasePort, environment.databaseDatabase,
        username: environment.databaseUsername,
        password: environment.databasePassword);
    await connection.open();
    await connection.transaction((context) async {
      ctx = context;
    });
    metadata = HeadersMetadata(
        authorization: '1',
        systemVersionSdk: '1',
        accesstoken: '1',
        platform: grpc_model.PlatformType.Android,
        systemVersion: '1',
        appVersion: '1',
        networkType: 'wifi',
        systemLanguage: 'en',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: grpc_model.AppType.App,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    mockOrderLocalDataSource = MockOrderLocalDataSource();
    mockDatabase = MockDatabase();
    mockAuthorizationTokenLocalDataSource =
        MockAuthorizationTokenLocalDataSource();
    mockJsonWebToken = MockJsonWebToken();
    orderRepositoryImpl = OrderRepositoryImpl(
      orderLocalDataSource: mockOrderLocalDataSource,
      jsonWebToken: mockJsonWebToken,
      authorizationTokenLocalDataSource: mockAuthorizationTokenLocalDataSource,
    );
  });

  group('testing ListOrder', () {
    test('Return sucessfull data when everything is ok', () async {
      // setup
      Map<String, dynamic> data = {};
      List<grpc_model.Order> listOfOrders = [
        grpc_model.Order(
          id: '1',
          appVersion: '1',
          buildingNumber: '1',
          businessFk: '1',
          coordinates: grpc_model.Point(latitude: 0.0, longitude: 0.0),
          createTime: '1',
          deliveryDate: '1',
          deliveryType: grpc_model.DeliveryType.HomeDelivery,
          deviceFk: '1',
          houseNumber: '1',
          price: 123.3,
          residenceType: grpc_model.ResidenceType.Apartment,
          status: grpc_model.OrderStatusType.Approved,
          updateTime: '1',
          userFk: '1',
        ),
        grpc_model.Order(
          id: '1',
          appVersion: '1',
          buildingNumber: '1',
          businessFk: '1',
          coordinates: grpc_model.Point(latitude: 0.0, longitude: 0.0),
          createTime: '1',
          deliveryDate: '1',
          deliveryType: grpc_model.DeliveryType.HomeDelivery,
          deviceFk: '1',
          houseNumber: '1',
          price: 123.3,
          residenceType: grpc_model.ResidenceType.Apartment,
          status: grpc_model.OrderStatusType.Approved,
          updateTime: '1',
          userFk: '1',
        ),
      ];
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': '1',
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => grpc_model.AuthorizationToken(
            id: '1',
            app: grpc_model.AppType.App,
            appVersion: '1',
            createTime: '1',
            deviceFk: '1',
            refreshTokenFk: '1',
            updateTime: '1',
            userFk: '1',
            valid: true,
          ));
      when(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => [
            grpc_model.Order(
              id: '1',
              appVersion: '1',
              buildingNumber: '1',
              businessFk: '1',
              coordinates: grpc_model.Point(latitude: 0.0, longitude: 0.0),
              createTime: '1',
              deliveryDate: '1',
              deliveryType: grpc_model.DeliveryType.HomeDelivery,
              deviceFk: '1',
              houseNumber: '1',
              price: 123.3,
              residenceType: grpc_model.ResidenceType.Apartment,
              status: grpc_model.OrderStatusType.Approved,
              updateTime: '1',
              userFk: '1',
            ),
            grpc_model.Order(
              id: '1',
              appVersion: '1',
              buildingNumber: '1',
              businessFk: '1',
              coordinates: grpc_model.Point(latitude: 0.0, longitude: 0.0),
              createTime: '1',
              deliveryDate: '1',
              deliveryType: grpc_model.DeliveryType.HomeDelivery,
              deviceFk: '1',
              houseNumber: '1',
              price: 123.3,
              residenceType: grpc_model.ResidenceType.Apartment,
              status: grpc_model.OrderStatusType.Approved,
              updateTime: '1',
              userFk: '1',
            ),
          ]);
      final response = await orderRepositoryImpl
          .listOrder(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(
          response,
          Right(grpc_model.ListOrderResponse(
              orders: listOfOrders, nextPage: '1')));
    });
    test('Return GrpcError.unauthenticated when the token has expired',
        () async {
      // setup
      Map<String, dynamic> data = {};
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization, 'AuthorizationToken'))
          .thenThrow(GrpcError.unauthenticated('AuthorizationToken expired'));
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => grpc_model.AuthorizationToken(
            id: '1',
            app: grpc_model.AppType.App,
            appVersion: '1',
            createTime: '1',
            deviceFk: '1',
            refreshTokenFk: '1',
            updateTime: '1',
            userFk: '1',
            valid: true,
          ));
      final response = await orderRepositoryImpl
          .listOrder(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization, 'AuthorizationToken'));
      verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(
        response,
        Left(GrpcError.unauthenticated('AuthorizationToken expired')),
      );
    });
    test(
        'Return GrpcError.unauthenticated when the token has not exist in the database',
        () async {
      // setup
      Map<String, dynamic> data = {};
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': '1',
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => null);
      final response = await orderRepositoryImpl
          .listOrder(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(
        response,
        Left(GrpcError.unauthenticated('Unauthenticated')),
      );
    });
    test('Return GrpcError.internal when the code throw a Exception', () async {
      // setup
      Map<String, dynamic> data = {};
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': '1',
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => grpc_model.AuthorizationToken(
            id: '1',
            app: grpc_model.AppType.App,
            appVersion: '1',
            createTime: '1',
            deviceFk: '1',
            refreshTokenFk: '1',
            updateTime: '1',
            userFk: '1',
            valid: true,
          ));
      when(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenThrow(Exception());
      final response = await orderRepositoryImpl
          .listOrder(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockOrderLocalDataSource.listOrder(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(
        response,
        Left(GrpcError.internal('Internal server error')),
      );
    });
  });
}
