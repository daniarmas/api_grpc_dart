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
import 'package:api_grpc_dart/data/datasources/cart_item_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/cart_item_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import './cart_item_repository_impl_test.mocks.dart';

@GenerateMocks([
  CartItemLocalDataSource,
  Database,
  AuthorizationTokenLocalDataSource,
  JsonWebToken,
])
void main() {
  late EnvironmentApp environment;
  late MockCartItemLocalDataSource mockCartItemLocalDataSource;
  late MockDatabase mockDatabase;
  late MockJsonWebToken mockJsonWebToken;
  late MockAuthorizationTokenLocalDataSource
      mockAuthorizationTokenLocalDataSource;
  late CartItemRepositoryImpl cartItemRepositoryImpl;
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
        platform: PlatformType.Android,
        systemVersion: '1',
        appVersion: '1',
        networkType: 'wifi',
        systemLanguage: 'en',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: AppType.App,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    mockDatabase = MockDatabase();
    mockJsonWebToken = MockJsonWebToken();
    mockAuthorizationTokenLocalDataSource =
        MockAuthorizationTokenLocalDataSource();
    mockCartItemLocalDataSource = MockCartItemLocalDataSource();
    cartItemRepositoryImpl = CartItemRepositoryImpl(
      database: mockDatabase,
      cartItemLocalDataSource: mockCartItemLocalDataSource,
      authorizationTokenLocalDataSource: mockAuthorizationTokenLocalDataSource,
      jsonWebToken: mockJsonWebToken,
    );
  });

  group('testing listCartItem', () {
    test('Return data sucessfull when everything is ok', () async {
      // setup
      Map<String, dynamic> data = {
        'nextPage': '2',
      };
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '1',
        app: AppType.App,
        appVersion: '1',
        createTime: '1',
        deviceFk: '1',
        refreshTokenFk: '1',
        updateTime: '1',
        userFk: '1',
        valid: true,
      );
      List<Item> listOfCartItem = [
        Item(
          id: '1',
          availability: 1,
          businessFk: 'businessFk',
          businessItemCategoryFk: 'businessItemCategoryFk',
          description: 'description',
          status: ItemStatusType.Available,
          name: 'name',
          photos: [
            ItemPhoto(
                createTime: 'createTime',
                highQualityPhoto: 'highQualityPhoto',
                id: 'id',
                itemFk: 'itemFk',
                lowQualityPhoto: 'lowQualityPhoto',
                updateTime: 'updateTime')
          ],
          price: 20.0,
          createTime: '1',
          updateTime: '1',
        ),
        Item(
          id: '1',
          availability: 1,
          businessFk: 'businessFk',
          businessItemCategoryFk: 'businessItemCategoryFk',
          description: 'description',
          status: ItemStatusType.Available,
          name: 'name',
          photos: [
            ItemPhoto(
                createTime: 'createTime',
                highQualityPhoto: 'highQualityPhoto',
                id: 'id',
                itemFk: 'itemFk',
                lowQualityPhoto: 'lowQualityPhoto',
                updateTime: 'updateTime')
          ],
          price: 20.0,
          createTime: '1',
          updateTime: '1',
        ),
      ];
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization!, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': metadata.authorization!,
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => authorizationToken);
      when(mockCartItemLocalDataSource.listCartItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfCartItem);
      final result = await cartItemRepositoryImpl.listCartItem(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization!, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockCartItemLocalDataSource.listCartItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfCartItem));
    });
    test(
        'Return GrpcError.unauthenticated when the AuthorizationToken not exists',
        () async {
      // setup
      Map<String, dynamic> data = {
        'nextPage': '2',
      };
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization!, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': metadata.authorization!,
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => null);
      final result = await cartItemRepositoryImpl.listCartItem(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization!, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockCartItemLocalDataSource.listCartItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test(
        'Return GrpcError.unauthenticated when the authorizationToken has expired',
        () async {
      // setup
      Map<String, dynamic> data = {
        'nextPage': '2',
      };
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization!, 'AuthorizationToken'))
          .thenThrow(GrpcError.unauthenticated('AuthorizationToken expired'));
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => null);
      final result = await cartItemRepositoryImpl.listCartItem(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization!, 'AuthorizationToken'));
      verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockCartItemLocalDataSource.listCartItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result,
          Left(GrpcError.unauthenticated('AuthorizationToken expired')));
    });
    test('Return GrpcError.internal when the code throw a Exception', () async {
      // setup
      Map<String, dynamic> data = {
        'nextPage': '2',
      };
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '1',
        app: AppType.App,
        appVersion: '1',
        createTime: '1',
        deviceFk: '1',
        refreshTokenFk: '1',
        updateTime: '1',
        userFk: '1',
        valid: true,
      );
      // side effects
      when(mockJsonWebToken.verify(
              metadata.authorization!, 'AuthorizationToken'))
          .thenAnswer((_) => {
                'authorizationTokenFk': metadata.authorization!,
              });
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => authorizationToken);
      when(mockCartItemLocalDataSource.listCartItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await cartItemRepositoryImpl.listCartItem(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(
          metadata.authorization!, 'AuthorizationToken'));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockCartItemLocalDataSource.listCartItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
