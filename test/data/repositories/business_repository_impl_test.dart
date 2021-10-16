import 'dart:convert';

import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/business_repository_impl.dart';
import 'package:api_grpc_dart/data/repositories/object_storage_repository_impl.dart';
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

import 'business_repository_impl_test.mocks.dart';

@GenerateMocks([BusinessLocalDataSource])
void main() {
  late EnvironmentApp environment;
  late MockBusinessLocalDataSource mockBusinessLocalDataSource;
  late BusinessRepositoryImpl businessRepositoryImpl;
  late HeadersMetadata metadata;
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext ctx;

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
    mockBusinessLocalDataSource = MockBusinessLocalDataSource();
    businessRepositoryImpl = BusinessRepositoryImpl(
        businessLocalDataSource: mockBusinessLocalDataSource);
  });
  group('testing listBusiness', () {
    test('Return data sucessful when everything is ok and there is no nextPage',
        () async {
      // setup
      List<Business> listOfBusiness = [
        Business(
            address: '',
            businessBrandFk: '',
            coordinates: Point(latitude: 0.0, longitude: 0.0),
            deliveryPrice: 0.0,
            description: '',
            distance: 0.0,
            email: '',
            homeDelivery: true,
            id: '',
            isOpen: true,
            leadDayTime: 1,
            leadHoursTime: 1,
            leadMinutesTime: 1,
            municipalityFk: '',
            name: '',
            phone: '',
            photo: '',
            photoUrl: '',
            polygon: [
              Polygon(coordinates: [0.0, 0.0])
            ],
            provinceFk: '',
            toPickUp: true),
      ];
      ListBusinessResponse listBusinessResponse =
          ListBusinessResponse(businesses: listOfBusiness, nextPage: '');
      // side effects
      when(mockBusinessLocalDataSource.listBusiness(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => listOfBusiness);
      final result = await businessRepositoryImpl.listBusiness(
          context: ctx,
          data: {
            'location': Point(
                latitude: 23.05953089322666, longitude: -81.2358539731568),
          },
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockBusinessLocalDataSource.listBusiness(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(listBusinessResponse));
    });
    // test('Return data sucessful when everything is ok and there is nextPage',
    //     () async {
    //   // setup
    //   var name = 'name';
    //   List<Business> listOfBusiness = [
    //     Business(
    //         address: 'address',
    //         businessBrandFk: 'businessBrandFk',
    //         coordinates: Point(latitude: 0.0, longitude: 0.0),
    //         deliveryPrice: 0.0,
    //         description: 'description',
    //         distance: 0.0,
    //         email: 'email',
    //         homeDelivery: true,
    //         id: 'id',
    //         isOpen: true,
    //         leadDayTime: 1,
    //         leadHoursTime: 1,
    //         leadMinutesTime: 1,
    //         municipalityFk: 'municipalityFk',
    //         name: name,
    //         phone: 'phone',
    //         photo: 'photo',
    //         photoUrl: 'photoUrl',
    //         polygon: [
    //           Polygon(coordinates: [0.0, 0.0])
    //         ],
    //         provinceFk: 'provinceFk',
    //         toPickUp: true),
    //     Business(
    //         address: 'address',
    //         businessBrandFk: 'businessBrandFk',
    //         coordinates: Point(latitude: 0.0, longitude: 0.0),
    //         deliveryPrice: 0.0,
    //         description: 'description',
    //         distance: 0.0,
    //         email: 'email',
    //         homeDelivery: true,
    //         id: 'id',
    //         isOpen: true,
    //         leadDayTime: 1,
    //         leadHoursTime: 1,
    //         leadMinutesTime: 1,
    //         municipalityFk: 'municipalityFk',
    //         name: name,
    //         phone: 'phone',
    //         photo: 'photo',
    //         photoUrl: 'photoUrl',
    //         polygon: [
    //           Polygon(coordinates: [0.0, 0.0])
    //         ],
    //         provinceFk: 'provinceFk',
    //         toPickUp: true),
    //   ];
    //   ListBusinessResponse listBusinessResponse = ListBusinessResponse(
    //       businesses: listOfBusiness,
    //       nextPage: base64.encode(utf8.encode(name)));
    //   // side effects
    //   when(mockBusinessLocalDataSource.listBusiness(
    //           context: anyNamed('context'),
    //           data: anyNamed('data'),
    //           paths: anyNamed('paths')))
    //       .thenAnswer((_) async => listOfBusiness);
    //   final result = await businessRepositoryImpl.listBusiness(
    //       context: ctx,
    //       data: {
    //         'location': Point(
    //             latitude: 23.05953089322666, longitude: -81.2358539731568),
    //         'nextPage': name,
    //       },
    //       paths: [],
    //       metadata: metadata);
    //   // expectations
    //   verify(mockBusinessLocalDataSource.listBusiness(
    //       context: anyNamed('context'),
    //       data: anyNamed('data'),
    //       paths: anyNamed('paths')));
    //   expect(result, Right(listBusinessResponse));
    // });
  });
}
