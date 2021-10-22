import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/item_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/item_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

import 'item_repository_impl_test.mocks.dart';

@GenerateMocks([ItemLocalDataSource])
void main() {
  late EnvironmentApp environment;
  late MockItemLocalDataSource mockItemLocalDataSource;
  late ItemRepositoryImpl itemRepositoryImpl;
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
        accesstoken: '1',
        platform: PlatformType.ANDROID,
        systemVersion: '1',
        appVersion: '1',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: AppType.APP,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    mockItemLocalDataSource = MockItemLocalDataSource();
    itemRepositoryImpl = ItemRepositoryImpl(
      itemLocalDataSource: mockItemLocalDataSource,
    );
  });

  group('testing listItem', () {
    test('Return data sucessful when everything is ok and there is no nextPage',
        () async {
      // setup
      List<Item> listOfItem = [
        Item(
          id: '1',
          availability: 1,
          businessFk: 'businessFk',
          businessItemCategoryFk: 'businessItemCategoryFk',
          description: 'description',
          status: ItemStatusType.AVAILABLE,
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
        )
      ];
      // side effects
      when(mockItemLocalDataSource.listItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.listItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.listItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfItem));
    });
    test('Return data sucessful when everything is ok and there is nextPage',
        () async {
      // setup
      List<Item> listOfItem = [
        Item(
          id: '1',
          availability: 1,
          businessFk: 'businessFk',
          businessItemCategoryFk: 'businessItemCategoryFk',
          description: 'description',
          status: ItemStatusType.AVAILABLE,
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
          status: ItemStatusType.AVAILABLE,
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
          status: ItemStatusType.AVAILABLE,
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
          status: ItemStatusType.AVAILABLE,
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
          status: ItemStatusType.AVAILABLE,
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
          status: ItemStatusType.AVAILABLE,
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
      when(mockItemLocalDataSource.listItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.listItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.listItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfItem));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      // side effects
      when(mockItemLocalDataSource.listItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await itemRepositoryImpl.listItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.listItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing getItem', () {
    test('Return data sucessful when everything is ok', () async {
      // setup
      var item = Item(
        id: '1',
        availability: 1,
        businessFk: 'businessFk',
        businessItemCategoryFk: 'businessItemCategoryFk',
        description: 'description',
        status: ItemStatusType.AVAILABLE,
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
      );
      // side effects
      when(mockItemLocalDataSource.getItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => item);
      final result = await itemRepositoryImpl.getItem(
          context: ctx, data: {'id': '1'}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.getItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(item));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      // side effects
      when(mockItemLocalDataSource.getItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await itemRepositoryImpl.getItem(
          context: ctx, data: {'id': '1'}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.getItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test('Return GrpcError.invalidArgument when the id is invalid', () async {
      // setup
      // side effects
      final result = await itemRepositoryImpl.getItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verifyNever(mockItemLocalDataSource.getItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `id` invalid')));
    });
  });
  group('testing searchItem', () {
    test('Return data sucessfull when is the first request and have nextPage',
        () async {
      // setup
      List<SearchItem> listOfItem = [
        SearchItem(
          id: '1',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '2',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '3',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '4',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '5',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '6',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
      ];
      // side effects
      when(mockItemLocalDataSource.searchItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.searchItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.searchItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfItem));
    });
    test(
        'Return data sucessfull when is the first request and dont have nextPage',
        () async {
      // setup
      List<SearchItem> listOfItem = [
        SearchItem(
          id: '1',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '2',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
        SearchItem(
          id: '3',
          businessFk: 'businessFk',
          status: ItemStatusType.AVAILABLE,
          name: 'name',
          price: 20.0,
        ),
      ];
      // side effects
      when(mockItemLocalDataSource.searchItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.searchItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.searchItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfItem));
    });
    test('Return data sucessfull when is the first request and dont have data',
        () async {
      // setup
      List<SearchItem> listOfItem = [];
      // side effects
      when(mockItemLocalDataSource.searchItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.searchItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.searchItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listOfItem));
    });
    test('Return GrpcError.internal when the code throw a Exception', () async {
      // setup
      // side effects
      when(mockItemLocalDataSource.searchItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await itemRepositoryImpl.searchItem(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockItemLocalDataSource.searchItem(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
