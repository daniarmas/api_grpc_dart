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
import 'package:api_grpc_dart/data/datasources/item_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/item_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'item_repository_impl_test.mocks.dart';

@GenerateMocks([ItemLocalDataSource, Database])
void main() {
  late EnvironmentApp environment;
  late MockItemLocalDataSource mockItemLocalDataSource;
  late MockDatabase mockDatabase;
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
    mockItemLocalDataSource = MockItemLocalDataSource();
    mockDatabase = MockDatabase();
    itemRepositoryImpl = ItemRepositoryImpl(
      database: mockDatabase,
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
        )
      ];
      // side effects
      when(mockItemLocalDataSource.listItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.listItem(
          context: ctx,
          data: {
            'businessFk': '1',
          },
          metadata: metadata,
          paths: []);
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
      when(mockItemLocalDataSource.listItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfItem);
      final result = await itemRepositoryImpl.listItem(
          context: ctx,
          data: {'businessFk': '1'},
          metadata: metadata,
          paths: []);
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
          context: ctx,
          data: {'businessFk': '1'},
          metadata: metadata,
          paths: []);
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
      );
      // side effects
      when(mockItemLocalDataSource.getItem(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => item);
      final result = await itemRepositoryImpl.getItem(
          context: ctx,
          data: {
            'id': '1',
            'location': Point(latitude: 123.3, longitude: 123.3),
          },
          metadata: metadata,
          paths: []);
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
          context: ctx,
          data: {
            'id': '1',
            'location': Point(latitude: 21312.3, longitude: 21312.3)
          },
          metadata: metadata,
          paths: []);
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
  // group('testing searchItem', () {
  //   test(
  //       'Return data sucessfull when is the first request and the actual muncipality have data',
  //       () async {
  //     // setup
  //     List<SearchItem> listOfItem = [
  //       SearchItem(
  //         id: '1',
  //         status: ItemStatusType.AVAILABLE,
  //         name: 'Item',
  //         price: 20.00,
  //         cursor: 1,
  //       ),
  //     ];
  //     SearchItemResponse searchItemResponse = SearchItemResponse(
  //         items: listOfItem,
  //         nextPage: 1,
  //         searchMunicipalityType: SearchMunicipalityType.NO_MORE);
  //     // side effects
  //     when(
  //       mockDatabase.list(
  //           context: anyNamed('context'),
  //           table: anyNamed('table'),
  //           attributes: anyNamed('attributes'),
  //           agregationMethods: anyNamed('agregationMethods'),
  //           where: anyNamed('where')),
  //     ).thenAnswer((_) async => [
  //           {
  //             'Business': {
  //               'id': '1',
  //               'name': 'name',
  //             },
  //             '': {'isInRange': true}
  //           }
  //         ]);
  //     when(mockDatabase.search(
  //       context: ctx,
  //       table: anyNamed('table'),
  //       attributes: anyNamed('attributes'),
  //       limit: anyNamed('limit'),
  //       where: anyNamed('where'),
  //     )).thenAnswer((_) async => [
  //           {
  //             'Item': {
  //               'id': '1',
  //               'name': 'Item',
  //               'price': 20.00,
  //               'status': 'AVAILABLE',
  //               'highQualityPhoto': 'items/photo.jpg',
  //               'lowQualityPhoto': 'items/photo.jpg',
  //               'blurHash': 'blurHash',
  //               'businessFk': '1',
  //               'cursor': 1
  //             }
  //           }
  //         ]);
  //     final result = await itemRepositoryImpl.searchItem(
  //         context: ctx,
  //         data: {
  //           'name': 'cuadro',
  //           'location': Point(
  //               latitude: 23.041667330791395, longitude: -81.20924681449843),
  //           'provinceFk': 'da7cc85b-fb6c-4d46-b07c-0915a16a3461',
  //           'municipalityFk': 'a33e7289-fff9-44fd-b04a-d66bfe7227b4',
  //           'searchMunicipalityType': 'MORE',
  //           'nextPage': 0
  //         },
  //         metadata: metadata,
  //         paths: []);
  //     // expectations
  //     verify(mockDatabase.list(
  //         context: anyNamed('context'),
  //         table: anyNamed('table'),
  //         attributes: anyNamed('attributes'),
  //         agregationMethods: anyNamed('agregationMethods'),
  //         where: anyNamed('where')));
  //     verify(mockDatabase.search(
  //       context: ctx,
  //       table: anyNamed('table'),
  //       attributes: anyNamed('attributes'),
  //       limit: anyNamed('limit'),
  //       where: anyNamed('where'),
  //     ));
  //     expect(result, Right(searchItemResponse));
  //   });
  //   test(
  //       'Return data sucessfull when is the first request and the actual municipality dont have data but the other municipalities yes',
  //       () async {
  //     // setup
  //     List<SearchItem> listOfItem = [
  //       SearchItem(
  //         id: '1',
  //         status: ItemStatusType.AVAILABLE,
  //         name: 'Item',
  //         price: 20.00,
  //         cursor: 1,
  //       ),
  //     ];
  //     SearchItemResponse searchItemResponse = SearchItemResponse(
  //         items: listOfItem,
  //         nextPage: 1,
  //         searchMunicipalityType: SearchMunicipalityType.NO_MORE);
  //     // side effects
  //     when(
  //       mockDatabase.list(
  //           context: anyNamed('context'),
  //           table: anyNamed('table'),
  //           attributes: anyNamed('attributes'),
  //           agregationMethods: anyNamed('agregationMethods'),
  //           where: anyNamed('where')),
  //     ).thenAnswer((_) async => [
  //           {
  //             'Business': {
  //               'id': '1',
  //               'name': 'name',
  //             },
  //             '': {'isInRange': true}
  //           }
  //         ]);
  //     when(mockDatabase.search(
  //       context: ctx,
  //       table: anyNamed('table'),
  //       attributes: anyNamed('attributes'),
  //       limit: anyNamed('limit'),
  //       where: anyNamed('where'),
  //     )).thenAnswer((_) async => []);
  //     when(
  //       mockDatabase.list(
  //           context: anyNamed('context'),
  //           table: anyNamed('table'),
  //           attributes: anyNamed('attributes'),
  //           agregationMethods: anyNamed('agregationMethods'),
  //           where: anyNamed('where')),
  //     ).thenAnswer((_) async => [
  //           {
  //             'Business': {
  //               'id': '2',
  //               'name': 'name',
  //             },
  //             '': {'isInRange': true}
  //           }
  //         ]);
  //     when(
  //       mockDatabase.search(
  //         context: ctx,
  //         table: anyNamed('table'),
  //         attributes: anyNamed('attributes'),
  //         limit: anyNamed('limit'),
  //         where: anyNamed('where'),
  //       ),
  //     ).thenAnswer((_) async => [
  //           {
  //             'Item': {
  //               'id': '1',
  //               'name': 'Item',
  //               'price': 20.00,
  //               'status': 'AVAILABLE',
  //               'highQualityPhoto': 'items/photo.jpg',
  //               'lowQualityPhoto': 'items/photo.jpg',
  //               'blurHash': 'blurHash',
  //               'businessFk': '1',
  //               'cursor': 1
  //             }
  //           }
  //         ]);
  //     final result = await itemRepositoryImpl.searchItem(
  //         context: ctx,
  //         data: {
  //           'name': 'cuadro',
  //           'location': Point(
  //               latitude: 23.041667330791395, longitude: -81.20924681449843),
  //           'provinceFk': 'da7cc85b-fb6c-4d46-b07c-0915a16a3461',
  //           'municipalityFk': 'a33e7289-fff9-44fd-b04a-d66bfe7227b4',
  //           'searchMunicipalityType': 'MORE',
  //           'nextPage': 0
  //         },
  //         metadata: metadata,
  //         paths: []);
  //     // expectations
  //     verify(mockDatabase.list(
  //         context: anyNamed('context'),
  //         table: anyNamed('table'),
  //         attributes: anyNamed('attributes'),
  //         agregationMethods: anyNamed('agregationMethods'),
  //         where: anyNamed('where')));
  //     verify(mockDatabase.search(
  //       context: ctx,
  //       table: anyNamed('table'),
  //       attributes: anyNamed('attributes'),
  //       limit: anyNamed('limit'),
  //       where: anyNamed('where'),
  //     ));
  //     expect(result, Right(searchItemResponse));
  //   });
  // });
}
