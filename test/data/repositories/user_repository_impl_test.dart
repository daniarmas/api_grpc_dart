import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/username_generator.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
import 'package:api_grpc_dart/data/repositories/user_repository_impl.dart';
import 'package:api_grpc_dart/data/repositories/verification_code_repository_impl.dart';
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

import './verification_code_repository_impl_test.mocks.dart';

@GenerateMocks([UserLocalDataSource, Database, UsernameGenerator])
void main() {
  late EnvironmentApp environment;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late UserRepositoryImpl userRepositoryImpl;
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
    mockUserLocalDataSource = MockUserLocalDataSource();
    userRepositoryImpl =
        UserRepositoryImpl(userLocalDataSource: mockUserLocalDataSource);
  });

  tearDown(() async {
    await connection.close();
  });

  group('testing getUser', () {
    test(
        'Return data successfully when everything is ok and exists a user with the provided id',
        () async {
      // setup
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          birthday: DateTime.now().toString(),
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      // side effects
      final result = await userRepositoryImpl.getUser(
          data: {'email': 'prueba1@app.nat.cu'},
          context: ctx,
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Right(user));
    });
    test(
        'Return data successfully when everything is ok and not exists a user with the provided id',
        () async {
      // setup
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      // side effects
      final result = await userRepositoryImpl.getUser(
          data: {'email': 'prueba1@app.nat.cu'},
          context: ctx,
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.notFound('Not found')));
    });
    test('Return GrpcError.invalidArgument() when the email is not valid',
        () async {
      // setup
      // side effects
      final result = await userRepositoryImpl.getUser(
          data: {'email': 'prueba1app.nat.cu'},
          context: ctx,
          paths: [],
          metadata: metadata);
      // expectations
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `email` invalid')));
    });
    test('Return GrpcError.invalidArgument() when the email is null', () async {
      // setup
      // side effects
      final result = await userRepositoryImpl.getUser(
          data: {}, context: ctx, paths: [], metadata: metadata);
      // expectations
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `email` invalid')));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      // side effects
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await userRepositoryImpl.getUser(
          data: {'email': 'prueba1@app.nat.cu'},
          context: ctx,
          paths: [],
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
