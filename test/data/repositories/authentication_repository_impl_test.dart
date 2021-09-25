import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/refresh_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/authentication_repository_impl.dart';
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

import './authentication_repository_impl_test.mocks.dart';

@GenerateMocks([
  VerificationCodeLocalDataSource,
  UserLocalDataSource,
  DeviceLocalDataSource,
  BannedUserLocalDataSource,
  BannedDeviceLocalDataSource,
  AuthorizationTokenLocalDataSource,
  RefreshTokenLocalDataSource
])
void main() {
  late EnvironmentApp environment;
  late MockVerificationCodeLocalDataSource mockVerificationCodeLocalDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockDeviceLocalDataSource mockDeviceLocalDataSource;
  late MockBannedDeviceLocalDataSource mockBannedDeviceLocalDataSource;
  late MockBannedUserLocalDataSource mockBannedUserLocalDataSource;
  late MockAuthorizationTokenLocalDataSource
      mockAuthorizationTokenLocalDataSource;
  late MockRefreshTokenLocalDataSource mockRefreshTokenLocalDataSource;
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext ctx;
  late HeadersMetadata metadata;
  late AuthenticationImpl authenticationImpl;

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
    mockVerificationCodeLocalDataSource = MockVerificationCodeLocalDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockBannedUserLocalDataSource = MockBannedUserLocalDataSource();
    mockBannedDeviceLocalDataSource = MockBannedDeviceLocalDataSource();
    mockRefreshTokenLocalDataSource = MockRefreshTokenLocalDataSource();
    mockAuthorizationTokenLocalDataSource =
        MockAuthorizationTokenLocalDataSource();
    mockDeviceLocalDataSource = MockDeviceLocalDataSource();
    authenticationImpl = AuthenticationImpl(
        deviceLocalDataSource: mockDeviceLocalDataSource,
        authorizationTokenLocalDataSource:
            mockAuthorizationTokenLocalDataSource,
        refreshTokenLocalDataSource: mockRefreshTokenLocalDataSource,
        bannedUserLocalDataSource: mockBannedUserLocalDataSource,
        bannedDeviceLocalDataSource: mockBannedDeviceLocalDataSource,
        userLocalDataSource: mockUserLocalDataSource,
        verificationCodeLocalDataSource: mockVerificationCodeLocalDataSource);
  });

  tearDown(() async {
    await connection.close();
  });

  group('testing signIn', () {
    test(
        'Return data successfully when this is the first signIn of the user and the device is not register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.ANDROID,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.APP,
          appVersion: '1',
          authorizationToken: '1',
          createTime: '1',
          deviceFk: '1',
          refreshTokenFk: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
      RefreshToken refreshToken = RefreshToken(
          id: '1',
          createTime: '1',
          expirationTime: '1',
          refreshToken: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
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
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SIGN_IN,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: authorizationToken.authorizationToken,
          refreshToken: refreshToken.refreshToken,
          user: user);
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
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
          .thenAnswer((_) async => [
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1')
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockDeviceLocalDataSource.createDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
      verify(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Right(response));
    });

    test(
        'Return data successfully when this is the first signIn of the user and the device is already register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.ANDROID,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.APP,
          appVersion: '1',
          authorizationToken: '1',
          createTime: '1',
          deviceFk: '1',
          refreshTokenFk: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
      RefreshToken refreshToken = RefreshToken(
          id: '1',
          createTime: '1',
          expirationTime: '1',
          refreshToken: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
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
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SIGN_IN,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: authorizationToken.authorizationToken,
          refreshToken: refreshToken.refreshToken,
          user: user);
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
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
          .thenAnswer((_) async => [
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1')
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockDeviceLocalDataSource.updateDevice(
              where: anyNamed('where'),
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
      verify(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Right(response));
    });

    test(
        'Return data successfully when this is not the first signIn of the user and the device is already register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.ANDROID,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.APP,
          appVersion: '1',
          authorizationToken: '1',
          createTime: '1',
          deviceFk: '1',
          refreshTokenFk: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
      RefreshToken refreshToken = RefreshToken(
          id: '1',
          createTime: '1',
          expirationTime: '1',
          refreshToken: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
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
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SIGN_IN,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: authorizationToken.authorizationToken,
          refreshToken: refreshToken.refreshToken,
          user: user);
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
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
          .thenAnswer((_) async => [
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1')
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockDeviceLocalDataSource.updateDevice(
              where: anyNamed('where'),
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
      verify(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Right(response));
    });

    test(
        'Return data successfully when this is not the first signIn of the user and the device is not register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.ANDROID,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.APP,
          appVersion: '1',
          authorizationToken: '1',
          createTime: '1',
          deviceFk: '1',
          refreshTokenFk: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
      RefreshToken refreshToken = RefreshToken(
          id: '1',
          createTime: '1',
          expirationTime: '1',
          refreshToken: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
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
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SIGN_IN,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: authorizationToken.authorizationToken,
          refreshToken: refreshToken.refreshToken,
          user: user);
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => verificationCode);
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
          .thenAnswer((_) async => [
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SIGN_IN,
                    updateTime: '1')
              ]);
      when(mockVerificationCodeLocalDataSource.deleteVerificationCode(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockDeviceLocalDataSource.createDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              data: anyNamed('data'), context: anyNamed('context')))
          .thenAnswer((_) async => true);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
      verify(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Right(response));
    });

    test(
        'Return GrpcError.invalidArguments when code is a number of five digits',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '12345'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `code` invalid')));
    });

    test('Return GrpcError.invalidArguments when code is a letter', () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': 'qwerty'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `code` invalid')));
    });

    test('Return GrpcError.invalidArguments when email is not valid', () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'danielestudiantes.uci.cu',
        'code': '123456'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verifyNever(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Input `email` invalid')));
    });

    test(
        'Return GrpcError.invalidArgument when not exists the verification code',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result,
          Left(GrpcError.invalidArgument('VerificationCode Not found')));
    });

    test('Return GrpcError.invalidArgument when the user is banned', () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => VerificationCode(
              id: '1',
              code: '123456',
              createTime: '1',
              deviceId: '1',
              email: 'prueba2@app.nat.cu',
              type: VerificationCodeType.SIGN_IN,
              updateTime: '1'));
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => BannedUser(
              id: '1',
              createTime: '1',
              description: '1',
              email: '1',
              moderatorAuthorizationTokenFk: '1',
              updateTime: '1',
              userFk: '1'));
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('User Banned')));
    });

    test('Return GrpcError.invalidArgument when the device is banned',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => VerificationCode(
              id: '1',
              code: '123456',
              createTime: '1',
              deviceId: '1',
              email: 'prueba2@app.nat.cu',
              type: VerificationCodeType.SIGN_IN,
              updateTime: '1'));
      when(mockBannedUserLocalDataSource.getBannedUser(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      when(mockBannedDeviceLocalDataSource.getBannedDevice(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => BannedDevice(
              id: '1',
              createTime: '1',
              description: '1',
              deviceFk: '1',
              deviceId: '1',
              moderatorAuthorizationTokenFk: '1',
              updateTime: '1'));
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('Device Banned')));
    });

    test('Return GrpcError.invalidArgument when the user not exists', () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'daniel@estudiantes.uci.cu',
        'code': '123456'
      };
      late Either<GrpcError, SignInResponse> result;
      // side effects
      when(mockVerificationCodeLocalDataSource.getVerificationCode(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => VerificationCode(
              id: '1',
              code: '123456',
              createTime: '1',
              deviceId: '1',
              email: 'prueba2@app.nat.cu',
              type: VerificationCodeType.SIGN_IN,
              updateTime: '1'));
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
          .thenAnswer((_) async => null);
      result = await authenticationImpl.signIn(
          data: map, paths: [], context: ctx, metadata: metadata);
      // expectations
      verify(mockVerificationCodeLocalDataSource.getVerificationCode(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
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
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockVerificationCodeLocalDataSource.deleteVerificationCode(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.createDevice(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
          where: anyNamed('where'),
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          data: anyNamed('data'), context: anyNamed('context')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('User Not found')));
    });
  });
}
