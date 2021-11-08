import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/core/utils/username_generator.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/user_repository_impl.dart';
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

import './user_repository_impl_test.mocks.dart';

@GenerateMocks([
  UserLocalDataSource,
  VerificationCodeLocalDataSource,
  Database,
  UsernameGenerator
])
void main() {
  late EnvironmentApp environment;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockUsernameGenerator mockUsernameGenerator;
  late MockVerificationCodeLocalDataSource mockVerificationCodeLocalDataSource;
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
        networkType: 'wifi',
        systemLanguage: 'en',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: AppType.APP,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockUsernameGenerator = MockUsernameGenerator();
    mockVerificationCodeLocalDataSource = MockVerificationCodeLocalDataSource();
    userRepositoryImpl = UserRepositoryImpl(
        verificationCodeLocalDataSource: mockVerificationCodeLocalDataSource,
        userLocalDataSource: mockUserLocalDataSource,
        generator: mockUsernameGenerator);
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
          isLegalAge: true,
          createTime: '1',
          permissions: null,
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

  group('testing userAliasGenerator', () {
    test('Return isValid true when not exists a user with that alias',
        () async {
      // setup
      final date = DateTime.now();
      // side effects
      when(mockUserLocalDataSource.getUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      final result = await userRepositoryImpl.userExistsStream(
          context: ctx,
          data: {'alias': 'prueba', 'birthday': date.toString()},
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(UserExistsStreamResponse(isValid: true)));
    });
    test('Return isValid false when exists a user with that alias', () async {
      // setup
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      final date = DateTime.now();
      // side effects
      when(mockUserLocalDataSource.getUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      final result = await userRepositoryImpl.userExistsStream(
          context: ctx,
          data: {'alias': 'prueba', 'birthday': date.toString()},
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Right(UserExistsStreamResponse(isValid: false)));
    });
    test(
        'Return GrpcError.invalidArgument when the alias in only numbers, and that is invalid',
        () async {
      // setup
      final date = DateTime.now();
      // side effects
      final result = await userRepositoryImpl.userExistsStream(
          context: ctx,
          data: {'alias': '123213', 'birthday': date.toString()},
          metadata: metadata);
      // expectations
      verifyNever(mockUserLocalDataSource.getUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `alias` invalid')));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      final date = DateTime.now();
      // side effects
      when(mockUserLocalDataSource.getUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      final result = await userRepositoryImpl.userExistsStream(
          context: ctx,
          data: {'alias': 'prueba', 'birthday': date.toString()},
          metadata: metadata);
      // expectations
      verify(mockUserLocalDataSource.getUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });

  group('testing updateUser', () {
    test('Return GrpcError.invalidArgument when the client not send the id',
        () async {
      // setup
      Map<String, dynamic> data = {};
      // side effects
      final result = await userRepositoryImpl
          .updateUser(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource.getVerificationCode(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
        context: anyNamed('context'),
        data: anyNamed('data'),
      ));
      verifyNever(mockUserLocalDataSource.updateUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(result, Left(GrpcError.invalidArgument('Input `id` invalid')));
    });
    group('test when edit the email', () {
      test(
          'Return GrpcError.invalidArgument when the client send the email but is invalid',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'email': 'email',
        };
        // side effects
        final result = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verifyNever(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(
            result, Left(GrpcError.invalidArgument('Input `email` invalid')));
      });
      test(
          'Return GrpcError.invalidArgument when the client send the email and is valid but not send the code',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'email': 'email@email.com',
        };
        // side effects
        final result = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verifyNever(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(result, Left(GrpcError.invalidArgument('Input `code` invalid')));
      });
      test(
          'Return GrpcError.invalidArgument when the client send the email and the code, but the code is invalid',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'email': 'email@email.com',
          'code': '123',
        };
        // side effects
        final result = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verifyNever(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(result, Left(GrpcError.invalidArgument('Input `code` invalid')));
      });
    });
    group('test when edit the alias', () {
      test(
          'Return GrpcError.invalidArgument when the client send the alias but is invalid',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'alias': '.as',
        };
        // side effects
        final result = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verifyNever(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(
            result, Left(GrpcError.invalidArgument('Input `alias` invalid')));
      });
    });
    group('test when the user edit their profile photo', () {
      test(
          'Return GrpcError.invalidArgument when the client send only the thumnail but not send the rest of the info',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'thumbnail': 'thumbnail',
        };
        // side effects
        final result = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verifyNever(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(
            result, Left(GrpcError.invalidArgument('Invalid argument photo')));
      });
    });
    group('test when the client is trying to edit the rest of the info', () {
      test('Return GrpcError.internal when the code throw a Exception',
          () async {
        // setup
        Map<String, dynamic> data = {
          'id': 'id',
          'fullname': 'fullname',
        };
        User user = User(
          id: '',
          alias: '',
          createTime: '',
          email: '',
          fullName: '',
          highQualityPhoto: '',
          highQualityPhotoBlurHash: '',
          isLegalAge: true,
          lowQualityPhoto: '',
          lowQualityPhotoBlurHash: '',
          permissions: null,
          thumbnail: '',
          thumbnailBlurHash: '',
          updateTime: '',
          userAddress: null,
        );
        // side effects
        when(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        )).thenAnswer((_) async => user);
        final response = await userRepositoryImpl.updateUser(
            context: ctx, data: data, metadata: metadata, paths: []);
        // expectations
        verify(mockUserLocalDataSource.updateUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths'),
        ));
        expect(response, Right(UpdateUserResponse(user: user)));
      });
    });
  });
}
