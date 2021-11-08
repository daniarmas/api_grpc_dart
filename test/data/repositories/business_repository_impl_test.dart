import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/business_repository_impl.dart';
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
        networkType: 'wifi',
        systemLanguage: 'en',
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
    // test('Return data sucessful when everything is ok and there is no nextPage',
    //     () async {
    //   // setup
    //   List<Business> listOfBusiness = [
    //     Business(
    //         address: '',
    //         businessBrandFk: '',
    //         coordinates: Point(latitude: 0.0, longitude: 0.0),
    //         deliveryPrice: 0.0,
    //         description: '',
    //         distance: 0.0,
    //         email: '',
    //         homeDelivery: true,
    //         id: '',
    //         cursor: 2,
    //         isOpen: true,
    //         leadDayTime: 1,
    //         leadHoursTime: 1,
    //         leadMinutesTime: 1,
    //         municipalityFk: '',
    //         name: '',
    //         phone: '',
    //         polygon: [
    //           Polygon(coordinates: [0.0, 0.0])
    //         ],
    //         provinceFk: '',
    //         toPickUp: true),
    //   ];
    //   FeedResponse listBusinessResponse =
    //       FeedResponse(businesses: listOfBusiness, nextPage: 0);
    //   // side effects
    //   when(mockBusinessLocalDataSource.feed(
    //           context: anyNamed('context'),
    //           data: anyNamed('data'),
    //           paths: anyNamed('paths')))
    //       .thenAnswer((_) async => FeedResponse(businesses: listOfBusiness));
    //   final Either<GrpcError, FeedResponse> result =
    //       await businessRepositoryImpl.feed(
    //           context: ctx,
    //           data: {
    //             'location': Point(
    //                 latitude: 23.05953089322666, longitude: -81.2358539731568),
    //             'nextPage': 0,
    //             'municipalityFk': '1',
    //             'provinceFk': '1',
    //             'searchMunicipalityType': SearchMunicipalityType.MORE,
    //           },
    //           paths: [],
    //           metadata: metadata);
    //   // expectations
    //   verify(mockBusinessLocalDataSource.feed(
    //       context: anyNamed('context'),
    //       data: anyNamed('data'),
    //       paths: anyNamed('paths')));
    //   expect(result, Right(listBusinessResponse));
    // });
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

  group('testing getBusiness', () {
    test('Return data sucessful when everything is ok', () async {
      // setup
      Business business = Business(
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
          polygon: [
            Polygon(coordinates: [0.0, 0.0])
          ],
          provinceFk: '',
          toPickUp: true);
      GetBusinessResponse getBusinessResponse =
          GetBusinessResponse(business: business);
      // side effects
      when(mockBusinessLocalDataSource.getBusiness(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => business);
      final result = await businessRepositoryImpl.getBusiness(
          context: ctx,
          data: {
            'id': 'id',
          },
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockBusinessLocalDataSource.getBusiness(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(getBusinessResponse));
    });
    test('Return GrpcError.invalidArgument when the client not send id',
        () async {
      // setup
      // side effects
      final result = await businessRepositoryImpl.getBusiness(
          context: ctx,
          data: {
            'id': '',
          },
          paths: [],
          metadata: metadata);
      // expectations
      verifyNever(mockBusinessLocalDataSource.getBusiness(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `id` invalid')));
    });
    test('Return GrpcError.notFound when everything not exists', () async {
      // setup
      // side effects
      when(mockBusinessLocalDataSource.getBusiness(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      final result = await businessRepositoryImpl.getBusiness(
          context: ctx,
          data: {
            'id': 'id',
          },
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockBusinessLocalDataSource.getBusiness(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.notFound('Not found')));
    });
    test('Return GrpcError.internal when the code throw a Exception', () async {
      // setup
      // side effects
      when(mockBusinessLocalDataSource.getBusiness(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await businessRepositoryImpl.getBusiness(
          context: ctx,
          data: {
            'id': 'id',
          },
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockBusinessLocalDataSource.getBusiness(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
