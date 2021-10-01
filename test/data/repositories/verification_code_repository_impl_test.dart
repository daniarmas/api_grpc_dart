import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
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

@GenerateMocks([
  VerificationCodeLocalDataSource,
  UserLocalDataSource,
  BannedUserLocalDataSource,
  BannedDeviceLocalDataSource,
  Emailer,
  Database
])
void main() {
  late MockEmailer mockEmailer;
  late EnvironmentApp environment;
  late MockVerificationCodeLocalDataSource mockVerificationCodeLocalDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockBannedDeviceLocalDataSource mockBannedDeviceLocalDataSource;
  late MockBannedUserLocalDataSource mockBannedUserLocalDataSource;
  late VerificationCodeRepositoryImpl verificationCodeRepositoryImpl;
  late PostgreSQLConnection connection;
  late VerificationCode verificationCode = VerificationCode(
      code: '432567',
      deviceId: '1',
      id: 'ashdk13721y3179kshad',
      email: 'prueba1@corre.cup',
      createTime: DateTime.now().toString(),
      updateTime: DateTime.now().toString(),
      type: VerificationCodeType.SIGN_IN);
  late PostgreSQLExecutionContext ctx;
  late HeadersMetadata metadata;

  setUpAll(() async {
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
    mockEmailer = MockEmailer();
    mockVerificationCodeLocalDataSource = MockVerificationCodeLocalDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockBannedUserLocalDataSource = MockBannedUserLocalDataSource();
    mockBannedDeviceLocalDataSource = MockBannedDeviceLocalDataSource();
    verificationCodeRepositoryImpl = VerificationCodeRepositoryImpl(
        emailer: mockEmailer,
        bannedUserLocalDataSource: mockBannedUserLocalDataSource,
        bannedDeviceLocalDataSource: mockBannedDeviceLocalDataSource,
        verificationCodeLocalDataSource: mockVerificationCodeLocalDataSource,
        userLocalDataSource: mockUserLocalDataSource);
  });

  tearDown(() async {
    await connection.close();
  });

  group('testing createVerificationCode', () {
    test(
        'Return data successfully when there is verification codes generated before and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          legalAge: true,
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      // BannedDevice device = BannedDevice(
      //     id: '1',
      //     deviceId: '1',
      //     createTime: '1',
      //     updateTime: '1',
      //     description: '1',
      //     deviceFk: '1',
      //     moderatorAuthorizationTokenFk: '1');
      late Either<GrpcError, VerificationCode> result;
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => []);
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => [
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN),
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN)
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
        data: anyNamed('data'),
        context: anyNamed('context'),
      )).thenAnswer((_) async => true);
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
      when(mockEmailer.sendVerificationCodeMail(
              code: anyNamed('code'),
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time'),
              verificationCodeType: anyNamed('verificationCodeType')))
          .thenAnswer((_) async => null);
      // side effects
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockVerificationCodeLocalDataSource
          .createVerificationCode(data: map, context: ctx, paths: []));
      verify(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Right(verificationCode));
    });

    test(
        'Return data successfully when there is no verification codes generated before and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          legalAge: true,
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      late Either<GrpcError, VerificationCode> result;
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => []);
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
      when(mockEmailer.sendVerificationCodeMail(
              code: anyNamed('code'),
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time'),
              verificationCodeType: anyNamed('verificationCodeType')))
          .thenAnswer((_) async => null);
      // side effects
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockVerificationCodeLocalDataSource
          .createVerificationCode(data: map, context: ctx, paths: []));
      verify(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Right(verificationCode));
    });

    test('Return GrpcError.invalidArgument when email value is not valid',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel',
        'type': VerificationCodeType.SIGN_IN
      };
      // side effects
      late Either<GrpcError, VerificationCode> result;
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verifyNever(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.invalidArgument('Input `email` invalid')));
    });

    test(
        'Return GrpcError.invalidArgument when type is VerificationCodeType.UNSPECIFIED',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED
      };
      // side effects
      late Either<GrpcError, VerificationCode> result;
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verifyNever(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.invalidArgument('Input `type` invalid')));
    });

    // // here

    test(
        'Return GrpcError.internal when getBannedUser throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test(
        'Return GrpcError.internal when getBannedDevice throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test(
        'Return GrpcError.internal when createVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockVerificationCodeLocalDataSource.createVerificationCode(
          data: anyNamed('data')));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    // here

    test(
        'Return GrpcError.internal when listVerificationCodeReturnIds throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          legalAge: true,
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer(((_) async => user));
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: map, context: ctx));
      verifyNever(mockVerificationCodeLocalDataSource
          .createVerificationCode(data: map, context: ctx, paths: []));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test(
        'Return GrpcError.internal when deleteVerificationCodeBeforeCreateVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          legalAge: true,
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer(((_) async => user));
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => [
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN),
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN)
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
        data: anyNamed('data'),
        context: anyNamed('context'),
      )).thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: map, context: ctx));
      verifyNever(mockVerificationCodeLocalDataSource
          .createVerificationCode(data: map, context: ctx, paths: []));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });

    test(
        'Return GrpcError.internal when createVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      Map<String, dynamic> map = {
        'deviceId': '1',
        'email': 'daniel@estudiantes.uci.cu',
        'type': VerificationCodeType.SIGN_IN
      };
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          legalAge: true,
          createTime: '1',
          photo: '1',
          permissions: null,
          photoUrl: '1',
          updateTime: '1',
          userAddress: null);
      late Either<GrpcError, VerificationCode> result;
      // side effects
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockUserLocalDataSource.getUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer(((_) async => user));
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => [
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN),
                VerificationCode(
                    code: '1',
                    deviceId: '1',
                    email: '1',
                    id: '1',
                    type: VerificationCodeType.SIGN_IN)
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
        data: anyNamed('data'),
        context: anyNamed('context'),
      )).thenAnswer((_) async => true);
      when(mockVerificationCodeLocalDataSource.createVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(DatabaseConnectionNotOpenException());
      result = await verificationCodeRepositoryImpl.createVerificationCode(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockBannedUserLocalDataSource.getBannedUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockBannedDeviceLocalDataSource.getBannedDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.getUser(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: map, context: ctx));
      verify(mockVerificationCodeLocalDataSource
          .createVerificationCode(data: map, context: ctx, paths: []));
      verifyNever(mockEmailer.sendVerificationCodeMail(
          code: anyNamed('code'),
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time'),
          verificationCodeType: anyNamed('verificationCodeType')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing listVerificationCode', () {
    test(
        'Return a empty list of data successfully when not exists verification codes',
        () async {
      // setup
      List<VerificationCode> listOfVerificationCode = [];
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenAnswer((_) async => listOfVerificationCode);
      // side effects
      final result = await verificationCodeRepositoryImpl.listVerificationCode(
          context: ctx, paths: [], data: {}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          context: anyNamed('context'),
          paths: anyNamed('paths'),
          data: anyNamed('data')));
      expect(result, Right(listOfVerificationCode));
    });
    test(
        'Return GrpcError.internal when listVerificationCode throw any Exception',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(Exception());
      // side effects
      final result = await verificationCodeRepositoryImpl.listVerificationCode(
          context: ctx, paths: [], data: {}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          context: anyNamed('context'),
          paths: anyNamed('paths'),
          data: anyNamed('data')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'Return GrpcError.internal when listVerificationCode throw DatabaseTableNotExistsException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(DatabaseTableNotExistsException());
      // side effects
      final result = await verificationCodeRepositoryImpl.listVerificationCode(
          context: ctx, paths: [], data: {}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          context: anyNamed('context'),
          paths: anyNamed('paths'),
          data: anyNamed('data')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'Return GrpcError.internal when listVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.listVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(DatabaseConnectionNotOpenException());
      // side effects
      final result = await verificationCodeRepositoryImpl.listVerificationCode(
          context: ctx, paths: [], data: {}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.listVerificationCode(
          context: anyNamed('context'),
          paths: anyNamed('paths'),
          data: anyNamed('data')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing getVerificationCode', () {
    test(
        'Return data successfully when everything is ok and exists a verificationCode with the provided id',
        () async {
      // setup
      VerificationCode verificationCode = VerificationCode(
          code: '1',
          deviceId: '1',
          email: '1',
          id: '1',
          type: VerificationCodeType.SIGN_IN);
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
      // side effects
      final result = await verificationCodeRepositoryImpl.getVerificationCode(
          data: {'id': '1'}, context: ctx, paths: [], metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: {'id': '1'}, context: ctx, paths: []));
      expect(result, Right(verificationCode));
    });
    test(
        'Return GrpcError.notFound when everything is ok and dosnt exists a verificationCode with the provided id',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(GrpcError.notFound('Not found'));
      // side effects
      final result = await verificationCodeRepositoryImpl.getVerificationCode(
          data: {'id': '1'}, context: ctx, paths: [], metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: {'id': '1'}, context: ctx, paths: []));
      expect(result, Left(GrpcError.notFound('Not found')));
    });
    test(
        'Return GrpcError.internal when getVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(DatabaseConnectionNotOpenException());
      // side effects
      final result = await verificationCodeRepositoryImpl.getVerificationCode(
          context: ctx, paths: [], data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .getVerificationCode(context: ctx, paths: [], data: {'id': '1'}));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'Return GrpcError.internal when getVerificationCode throw DatabaseTableNotExistsException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(DatabaseTableNotExistsException());
      // side effects
      final result = await verificationCodeRepositoryImpl.getVerificationCode(
          context: ctx, paths: [], data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .getVerificationCode(context: ctx, paths: [], data: {'id': '1'}));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test('Return GrpcError.internal when getVerificationCode throw Exception',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              context: anyNamed('context'),
              paths: anyNamed('paths'),
              data: anyNamed('data')))
          .thenThrow(Exception());
      // side effects
      final result = await verificationCodeRepositoryImpl.getVerificationCode(
          context: ctx, paths: [], data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .getVerificationCode(context: ctx, paths: [], data: {'id': '1'}));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing deleteVerificationCode', () {
    test(
        'Delete data successfully when everything is ok and exists a deleteVerificationCode with the provided id',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      // side effects
      final result = await verificationCodeRepositoryImpl
          .deleteVerificationCode(
              data: {'id': '1'}, context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCode(data: {'id': '1'}, context: ctx));
      expect(result, Right(null));
    });
    test(
        'Return GrpcError.notFound when everything is ok and dosnt exists a deleteVerificationCode with the provided id',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => false);
      // side effects
      final result = await verificationCodeRepositoryImpl
          .deleteVerificationCode(
              data: {'id': '1'}, context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      expect(result, Left(GrpcError.notFound('Not Found')));
    });
    test(
        'Return GrpcError.internal when deleteVerificationCode throw DatabaseConnectionNotOpenException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              context: anyNamed('context'), data: anyNamed('data')))
          .thenThrow(DatabaseConnectionNotOpenException());
      // side effects
      final result =
          await verificationCodeRepositoryImpl.deleteVerificationCode(
              context: ctx, data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          context: anyNamed('context'), data: anyNamed('data')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'Return GrpcError.internal when deleteVerificationCode throw DatabaseTableNotExistsException',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              context: anyNamed('context'), data: anyNamed('data')))
          .thenThrow(DatabaseTableNotExistsException());
      // side effects
      final result =
          await verificationCodeRepositoryImpl.deleteVerificationCode(
              context: ctx, data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCode(context: ctx, data: {'id': '1'}));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'Return GrpcError.internal when deleteVerificationCode throw Exception',
        () async {
      // setup
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              context: anyNamed('context'), data: anyNamed('data')))
          .thenThrow(Exception());
      // side effects
      final result =
          await verificationCodeRepositoryImpl.deleteVerificationCode(
              context: ctx, data: {'id': '1'}, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource
          .deleteVerificationCode(context: ctx, data: {'id': '1'}));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
