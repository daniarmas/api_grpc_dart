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
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/device_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/kubernetes_data_source.dart';
import 'package:api_grpc_dart/data/datasources/refresh_token_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/session_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:api_grpc_dart/data/email/emailer.dart';
import 'package:api_grpc_dart/data/repositories/authentication_repository_impl.dart';
import 'package:api_grpc_dart/environment.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import './authentication_repository_impl_test.mocks.dart';

@GenerateMocks([
  VerificationCodeLocalDataSource,
  UserLocalDataSource,
  DeviceLocalDataSource,
  JsonWebToken,
  BannedUserLocalDataSource,
  BannedDeviceLocalDataSource,
  AuthorizationTokenLocalDataSource,
  SessionLocalDataSource,
  Emailer,
  KubernetesDataSource,
  RefreshTokenLocalDataSource
])
void main() {
  late MockEmailer mockEmailer;
  late MockJsonWebToken mockJsonWebToken;
  late MockKubernetesDataSource mockKubernetesDataSource;
  late EnvironmentApp environment;
  late MockVerificationCodeLocalDataSource mockVerificationCodeLocalDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockDeviceLocalDataSource mockDeviceLocalDataSource;
  late MockBannedDeviceLocalDataSource mockBannedDeviceLocalDataSource;
  late MockBannedUserLocalDataSource mockBannedUserLocalDataSource;
  late MockSessionLocalDataSource mockSessionLocalDataSource;
  late MockAuthorizationTokenLocalDataSource
      mockAuthorizationTokenLocalDataSource;
  late MockRefreshTokenLocalDataSource mockRefreshTokenLocalDataSource;
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext ctx;
  late HeadersMetadata metadata;
  late AuthenticationImpl authenticationImpl;
  late JsonWebToken jsonWebToken;

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
        authorization: '1',
        refreshToken: '1',
        platform: PlatformType.Android,
        networkType: 'wifi',
        systemLanguage: 'en',
        systemVersion: '1',
        appVersion: '1',
        ipv4: '192.168.1.3',
        ipv6: 'asdksajdhaskjdjklasdhjk',
        app: AppType.App,
        deviceId: '1',
        model: '1',
        firebaseCloudMessagingId: '1');
    jsonWebToken = GetIt.I<JsonWebToken>();
    mockEmailer = MockEmailer();
    mockJsonWebToken = MockJsonWebToken();
    mockKubernetesDataSource = MockKubernetesDataSource();
    mockVerificationCodeLocalDataSource = MockVerificationCodeLocalDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockBannedUserLocalDataSource = MockBannedUserLocalDataSource();
    mockBannedDeviceLocalDataSource = MockBannedDeviceLocalDataSource();
    mockRefreshTokenLocalDataSource = MockRefreshTokenLocalDataSource();
    mockAuthorizationTokenLocalDataSource =
        MockAuthorizationTokenLocalDataSource();
    mockDeviceLocalDataSource = MockDeviceLocalDataSource();
    mockSessionLocalDataSource = MockSessionLocalDataSource();
    authenticationImpl = AuthenticationImpl(
        sessionLocalDataSource: mockSessionLocalDataSource,
        jsonWebToken: mockJsonWebToken,
        kubernetesDataSource: mockKubernetesDataSource,
        emailer: mockEmailer,
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
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockEmailer.sendSignInMail(
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time')))
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
      verify(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockEmailer.sendSignInMail(
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time')))
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
      verify(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockEmailer.sendSignInMail(
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time')))
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
      verify(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignInResponse> result;
      SignInResponse response = SignInResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockEmailer.sendSignInMail(
              device: anyNamed('device'),
              ip: anyNamed('ip'),
              recipient: anyNamed('recipient'),
              time: anyNamed('time')))
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
      verify(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
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
              type: VerificationCodeType.SignIn,
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
      expect(result, Left(GrpcError.invalidArgument('User banned')));
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
              type: VerificationCodeType.SignIn,
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
      expect(result, Left(GrpcError.invalidArgument('Device banned')));
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
              type: VerificationCodeType.SignIn,
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
      verifyNever(mockEmailer.sendSignInMail(
          device: anyNamed('device'),
          ip: anyNamed('ip'),
          recipient: anyNamed('recipient'),
          time: anyNamed('time')));
      expect(result, Left(GrpcError.invalidArgument('User not found')));
    });
  });

  group('testing checkSession', () {
    group('when receive the tokens', () {
      test('Return data successfully everything is ok', () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        AuthorizationToken authorizationToken = AuthorizationToken(
            id: '1',
            app: AppType.App,
            appVersion: '1',
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
            updateTime: '1',
            userFk: '1',
            valid: true);
        User user = User(
            id: '1',
            email: 'prueba1@app.nat.cu',
            fullName: '1',
            isLegalAge: true,
            createTime: '1',
            permissions: null,
            updateTime: '1',
            userAddress: null);
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'authorizationTokenFk': '1'});
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'refreshTokenFk': '1'});
        when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => authorizationToken);
        when(mockRefreshTokenLocalDataSource.getRefreshToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => refreshToken);
        when(mockUserLocalDataSource.getUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => user);
        when(mockBannedUserLocalDataSource.getBannedUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockKubernetesDataSource.listNodes())
            .thenAnswer((_) async => ['192.168.1.3']);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(2);
        verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockKubernetesDataSource.listNodes());
        expect(
            result, Right(CheckSessionResponse(ipAddresses: ['192.168.1.3'])));
      });
      test(
          'Return GrpcError.unauthenticated() when send tokens and the device dosnt exists',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(
            map['authorizationToken'], 'AuthorizationToken'));
        verifyNever(mockJsonWebToken.verify(any, 'RefreshToken'));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
      });
      test(
          'Return GrpcError.unauthenticated() when sends tokens and the device is banned',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        BannedDevice bannedDevice = BannedDevice(
            createTime: '',
            description: '',
            deviceFk: '',
            deviceId: '',
            id: '',
            moderatorAuthorizationTokenFk: '',
            updateTime: '');
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => bannedDevice);
        final result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(
            map['authorizationToken'], 'AuthorizationToken'));
        verifyNever(mockJsonWebToken.verify(any, 'RefreshToken'));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.invalidArgument('Device Banned')));
      });
      test(
          'Return GrpcError.unauthenticated() when send tokens and the AuthorizationToken is expired',
          () async {
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenThrow(GrpcError.unauthenticated('AuthorizationToken expired'));
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(1);
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result,
            Left(GrpcError.unauthenticated('AuthorizationToken expired')));
      });
      test(
          'Return GrpcError.unauthenticated() when send tokens and AuthorizationToken and RefreshToken not exists in the DB',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'authorizationTokenFk': '1'});
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'refreshTokenFk': '1'});
        when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockRefreshTokenLocalDataSource.getRefreshToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(2);
        verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
      });
      test(
          'Return GrpcError.unauthenticated() when send tokens and the user dosnt exist in the DB',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        AuthorizationToken authorizationToken = AuthorizationToken(
            id: '1',
            app: AppType.App,
            appVersion: '1',
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
            updateTime: '1',
            userFk: '1',
            valid: true);
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'authorizationTokenFk': '1'});
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'refreshTokenFk': '1'});
        when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => authorizationToken);
        when(mockRefreshTokenLocalDataSource.getRefreshToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => refreshToken);
        when(mockUserLocalDataSource.getUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(2);
        verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
      });
      test(
          'Return GrpcError.unauthenticated() when send tokens and the user is banned',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        AuthorizationToken authorizationToken = AuthorizationToken(
            id: '1',
            app: AppType.App,
            appVersion: '1',
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
            updateTime: '1',
            userFk: '1',
            valid: true);
        User user = User(
            id: '1',
            email: 'prueba1@app.nat.cu',
            fullName: '1',
            isLegalAge: true,
            createTime: '1',
            permissions: null,
            updateTime: '1',
            userAddress: null);
        BannedUser bannedUser = BannedUser(
            id: '1',
            email: '1',
            createTime: '1',
            description: '1',
            moderatorAuthorizationTokenFk: '1',
            updateTime: '1',
            userFk: '1');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'authorizationTokenFk': '1'});
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'refreshTokenFk': '1'});
        when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => authorizationToken);
        when(mockRefreshTokenLocalDataSource.getRefreshToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => refreshToken);
        when(mockUserLocalDataSource.getUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => user);
        when(mockBannedUserLocalDataSource.getBannedUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => bannedUser);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(2);
        verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.invalidArgument('User Banned')));
      });
      test(
          'Return GrpcError.internal() when send tokens and the kubernetes api throw an Exception',
          () async {
        // setup
        Map<String, dynamic> map = {
          'refreshToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZWZyZXNoVG9rZW5GayI6IjQ0ZTljYTY1LWNmYTEtNDQxNi05YmYzLTIzNTAzYjQ4NTU0NiIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjM0MDQ4MjI5fQ.WAtPFn26-HGaxw6_u2lXRJ0DqT5jYEPIYzyrJ4cqeAg',
          'authorizationToken':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemF0aW9uVG9rZW5GayI6IjEzNDZhOTA4LWMzNTQtNGE2YS05MzE2LWU3MWE1NzA3ZDNhNyIsImlhdCI6MTYzMzQ0MzQyOSwiZXhwIjoxNjMzNTI5ODI5fQ.u-YfChzWsCaxGLEQSyXyFG0TNK2DtJAWelDtyQVMWyY'
        };
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        AuthorizationToken authorizationToken = AuthorizationToken(
            id: '1',
            app: AppType.App,
            appVersion: '1',
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
            updateTime: '1',
            userFk: '1',
            valid: true);
        User user = User(
            id: '1',
            email: 'prueba1@app.nat.cu',
            fullName: '1',
            isLegalAge: true,
            createTime: '1',
            permissions: null,
            updateTime: '1',
            userAddress: null);
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'authorizationTokenFk': '1'});
        when(mockJsonWebToken.verify(any, any))
            .thenAnswer((_) => {'refreshTokenFk': '1'});
        when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => authorizationToken);
        when(mockRefreshTokenLocalDataSource.getRefreshToken(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => refreshToken);
        when(mockUserLocalDataSource.getUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => user);
        when(mockBannedUserLocalDataSource.getBannedUser(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockKubernetesDataSource.listNodes()).thenThrow(Exception());
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockJsonWebToken.verify(any, any)).called(2);
        verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.internal('Internal server error')));
      });
    });
    group('when not receive tokens', () {
      test(
          'Return data successfully when everything is ok and the device exists',
          () async {
        // setup
        Map<String, dynamic> map = {};
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockKubernetesDataSource.listNodes())
            .thenAnswer((_) async => ['192.168.1.3']);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(any, any));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockKubernetesDataSource.listNodes());
        expect(
            result, Right(CheckSessionResponse(ipAddresses: ['192.168.1.3'])));
      });
      test(
          'Return data successfully when everything is ok and the device not exists',
          () async {
        // setup
        Map<String, dynamic> map = {};
        late Either<GrpcError, CheckSessionResponse> result;
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockKubernetesDataSource.listNodes())
            .thenAnswer((_) async => ['192.168.1.3']);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(any, any));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockKubernetesDataSource.listNodes());
        expect(
            result, Right(CheckSessionResponse(ipAddresses: ['192.168.1.3'])));
      });
      test(
          'Return GrpcError.invalidArgument("Device Banned" when the device is banned)',
          () async {
        // setup
        Map<String, dynamic> map = {};
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        BannedDevice bannedDevice = BannedDevice(
            createTime: '',
            description: '',
            deviceFk: '',
            deviceId: '',
            id: '',
            moderatorAuthorizationTokenFk: '',
            updateTime: '');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => bannedDevice);
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(any, any));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.invalidArgument('Device Banned')));
      });
      test(
          'Return GrpcError.internal() when the Kubernetes Api throw an Exception',
          () async {
        // setup
        Map<String, dynamic> map = {};
        late Either<GrpcError, CheckSessionResponse> result;
        Device device = Device(
            id: '1',
            createTime: '1',
            deviceId: '1',
            firebaseCloudMessagingId: '1',
            model: '1',
            platform: PlatformType.Android,
            systemVersion: '1',
            updateTime: '1');
        // side effects
        when(mockDeviceLocalDataSource.getDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockDeviceLocalDataSource.updateDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                where: anyNamed('where'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => device);
        when(mockBannedDeviceLocalDataSource.getBannedDevice(
                data: anyNamed('data'),
                context: anyNamed('context'),
                paths: anyNamed('paths')))
            .thenAnswer((_) async => null);
        when(mockKubernetesDataSource.listNodes()).thenThrow(Exception());
        result = await authenticationImpl.checkSession(
            data: map, context: ctx, metadata: metadata);
        // expectations
        verify(mockDeviceLocalDataSource.getDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockDeviceLocalDataSource.updateDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            where: anyNamed('where'),
            paths: anyNamed('paths')));
        verify(mockBannedDeviceLocalDataSource.getBannedDevice(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockJsonWebToken.verify(any, any));
        verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockUserLocalDataSource.getUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verifyNever(mockBannedUserLocalDataSource.getBannedUser(
            data: anyNamed('data'),
            context: anyNamed('context'),
            paths: anyNamed('paths')));
        verify(mockKubernetesDataSource.listNodes());
        expect(result, Left(GrpcError.internal('Internal server error')));
      });
    });
  });
  group('testing signUp', () {
    test(
        'Return data successfully when this is the first signUp of the user and the device is not register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'prueba4@correo.cup',
        'alias': 'pepito04',
        'fullName': 'Pepito Gonzales',
        'birthday': '2020-06-06',
        'code': '389686'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignUpResponse> result;
      SignUpResponse response = SignUpResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
          .thenAnswer((_) async => null);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockUserLocalDataSource.createUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      result = await authenticationImpl.signUp(
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
      verify(mockUserLocalDataSource.createUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
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
        'Return data successfully when this is the first signUp of the user and the device is register in the system and everything is ok',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'prueba4@correo.cup',
        'alias': 'pepito04',
        'fullName': 'Pepito Gonzales',
        'birthday': '2020-06-06',
        'code': '389686'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignUpResponse> result;
      SignUpResponse response = SignUpResponse(
          authorizationToken: '1', refreshToken: '1', user: user);
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
          .thenAnswer((_) async => null);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
              data: anyNamed('data'),
              context: anyNamed('context'),
              where: anyNamed('where'),
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
      when(mockUserLocalDataSource.createUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
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
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      result = await authenticationImpl.signUp(
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
          data: anyNamed('data'),
          where: anyNamed('where'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockUserLocalDataSource.createUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
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
    test('Return GrpcError.invalidArgument() when exist a user with the email',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'prueba4@correo.cup',
        'alias': 'pepito04',
        'fullName': 'Pepito Gonzales',
        'birthday': '2020-06-06',
        'code': '389686'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '1',
          app: AppType.App,
          appVersion: '1',
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
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignUpResponse> result;
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockUserLocalDataSource.createUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      result = await authenticationImpl.signUp(
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
      verifyNever(mockUserLocalDataSource.createUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')));
      expect(result, Left(GrpcError.invalidArgument('User exists')));
    });
    test('Return GrpcError.internal() when the code throw a Exception',
        () async {
      // setup
      Map<String, dynamic> map = {
        'email': 'prueba4@correo.cup',
        'alias': 'pepito04',
        'fullName': 'Pepito Gonzales',
        'birthday': '2020-06-06',
        'code': '389686'
      };
      Device device = Device(
          id: '1',
          createTime: '1',
          deviceId: '1',
          firebaseCloudMessagingId: '1',
          model: '1',
          platform: PlatformType.Android,
          systemVersion: '1',
          updateTime: '1');
      RefreshToken refreshToken = RefreshToken(
          id: '1',
          createTime: '1',
          expirationTime: '1',
          updateTime: '1',
          userFk: '1',
          valid: true);
      User user = User(
          id: '1',
          email: 'prueba1@app.nat.cu',
          fullName: '1',
          isLegalAge: true,
          createTime: '1',
          permissions: null,
          updateTime: '1',
          userAddress: null);
      VerificationCode verificationCode = VerificationCode(
          id: '1',
          code: '123456',
          createTime: '1',
          deviceId: '1',
          email: 'prueba2@app.nat.cu',
          type: VerificationCodeType.SignIn,
          updateTime: '1');
      late Either<GrpcError, SignUpResponse> result;
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
          .thenAnswer((_) async => null);
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
                    type: VerificationCodeType.SignIn,
                    updateTime: '1'),
                VerificationCode(
                    id: '1',
                    code: '123456',
                    createTime: '1',
                    deviceId: '1',
                    email: 'prueba2@app.nat.cu',
                    type: VerificationCodeType.SignIn,
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
      when(mockUserLocalDataSource.createUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              data: anyNamed('data'),
              context: anyNamed('context'),
              paths: anyNamed('paths')))
          .thenThrow(Exception());
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      result = await authenticationImpl.signUp(
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
      verify(mockUserLocalDataSource.createUser(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
          data: anyNamed('data'),
          context: anyNamed('context'),
          paths: anyNamed('paths')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing refreshToken', () {
    test('Return data sucessfull when exist a device', () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      RefreshToken refreshToken = RefreshToken(
          id: '',
          createTime: '',
          deviceFk: '',
          expirationTime: '',
          updateTime: '',
          userFk: '',
          valid: true);
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '',
        createTime: '',
        deviceFk: '',
        updateTime: '',
        userFk: '',
        valid: true,
        app: AppType.App,
        appVersion: '',
        refreshTokenFk: '',
      );
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      User user = User(
          alias: '',
          isLegalAge: true,
          createTime: '',
          email: '',
          fullName: '',
          highQualityPhoto: '',
          highQualityPhotoBlurHash: '',
          id: '',
          lowQualityPhoto: '',
          lowQualityPhotoBlurHash: null,
          permissions: null,
          thumbnail: '',
          thumbnailBlurHash: '',
          updateTime: '',
          userAddress: null);
      RefreshTokenResponse response =
          RefreshTokenResponse(authorizationToken: '1', refreshToken: '1');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockUserLocalDataSource.getUser(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              context: anyNamed('context'), data: anyNamed('data')))
          .thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockDeviceLocalDataSource.updateDevice(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths'),
              where: anyNamed('where')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockRefreshTokenLocalDataSource.deleteRefreshToken(
            context: anyNamed('context'), data: anyNamed('data')),
      );
      verify(
        mockDeviceLocalDataSource.getDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockDeviceLocalDataSource.updateDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths'),
            where: anyNamed('where')),
      );
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(
        mockRefreshTokenLocalDataSource.createRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')),
      );
      verify(
        mockJsonWebToken.generateAuthorizationToken(
            payload: anyNamed('payload')),
      );
      expect(result, Right(response));
    });
    test('Return data sucessfull when not exist a device', () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      RefreshToken refreshToken = RefreshToken(
          id: '',
          createTime: '',
          deviceFk: '',
          expirationTime: '',
          updateTime: '',
          userFk: '',
          valid: true);
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '',
        createTime: '',
        deviceFk: '',
        updateTime: '',
        userFk: '',
        valid: true,
        app: AppType.App,
        appVersion: '',
        refreshTokenFk: '',
      );
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      User user = User(
          alias: '',
          isLegalAge: true,
          createTime: '',
          email: '',
          fullName: '',
          highQualityPhoto: '',
          highQualityPhotoBlurHash: '',
          id: '',
          lowQualityPhoto: '',
          lowQualityPhotoBlurHash: null,
          permissions: null,
          thumbnail: '',
          thumbnailBlurHash: '',
          updateTime: '',
          userAddress: null);
      RefreshTokenResponse response =
          RefreshTokenResponse(authorizationToken: '1', refreshToken: '1');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => refreshToken);
      when(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              context: anyNamed('context'), data: anyNamed('data')))
          .thenAnswer((_) async => true);
      when(
        mockDeviceLocalDataSource.getDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => null);
      when(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
              payload: anyNamed('payload')))
          .thenAnswer((_) => '1');
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockRefreshTokenLocalDataSource.deleteRefreshToken(
            context: anyNamed('context'), data: anyNamed('data')),
      );
      verify(
        mockDeviceLocalDataSource.getDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockDeviceLocalDataSource.updateDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths'),
            where: anyNamed('where')),
      );
      verify(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(
        mockRefreshTokenLocalDataSource.createRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')),
      );
      verify(
        mockJsonWebToken.generateAuthorizationToken(
            payload: anyNamed('payload')),
      );
      expect(result, Right(response));
    });
    test(
        'Return GrpcError.invalidArgument when the client not send the refreshToken',
        () async {
      // setup
      // side effects
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verifyNever(mockJsonWebToken.verify(any, any));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      ));
      verifyNever(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
        where: anyNamed('where'),
      ));
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      ));
      verifyNever(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      ));
      expect(result,
          Left(GrpcError.invalidArgument('Input `refreshToken` invalid')));
    });
    test('Return GrpcError.unauthenticated when not exists the refreshToken',
        () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => null);
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockRefreshTokenLocalDataSource.deleteRefreshToken(
            context: anyNamed('context'), data: anyNamed('data')),
      );
      verifyNever(
        mockDeviceLocalDataSource.getDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockDeviceLocalDataSource.updateDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths'),
            where: anyNamed('where')),
      );
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(
        mockRefreshTokenLocalDataSource.createRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')),
      );
      verifyNever(
        mockJsonWebToken.generateAuthorizationToken(
            payload: anyNamed('payload')),
      );
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test('Return GrpcError.unauthenticated when not exists the user', () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      RefreshToken refreshToken = RefreshToken(
          id: '',
          createTime: '',
          deviceFk: '',
          expirationTime: '',
          updateTime: '',
          userFk: '',
          valid: true);
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => refreshToken);
      when(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      ).thenAnswer((_) async => null);
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(
        mockRefreshTokenLocalDataSource.getRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verify(
        mockUserLocalDataSource.getUser(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockRefreshTokenLocalDataSource.deleteRefreshToken(
            context: anyNamed('context'), data: anyNamed('data')),
      );
      verifyNever(
        mockDeviceLocalDataSource.getDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockDeviceLocalDataSource.updateDevice(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths'),
            where: anyNamed('where')),
      );
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(
        mockRefreshTokenLocalDataSource.createRefreshToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
            context: anyNamed('context'),
            data: anyNamed('data'),
            paths: anyNamed('paths')),
      );
      verifyNever(
        mockJsonWebToken.generateRefreshToken(payload: anyNamed('payload')),
      );
      verifyNever(
        mockJsonWebToken.generateAuthorizationToken(
            payload: anyNamed('payload')),
      );
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test(
        'Return data sucessfull and create a device when not exist a device before',
        () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      RefreshToken refreshToken = RefreshToken(
          id: '',
          createTime: '',
          deviceFk: '',
          expirationTime: '',
          updateTime: '',
          userFk: '',
          valid: true);
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '',
        createTime: '',
        deviceFk: '',
        updateTime: '',
        userFk: '',
        valid: true,
        app: AppType.App,
        appVersion: '',
        refreshTokenFk: '',
      );
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      User user = User(
          alias: '',
          isLegalAge: true,
          createTime: '',
          email: '',
          fullName: '',
          highQualityPhoto: '',
          highQualityPhotoBlurHash: '',
          id: '',
          lowQualityPhoto: '',
          lowQualityPhotoBlurHash: null,
          permissions: null,
          thumbnail: '',
          thumbnailBlurHash: '',
          updateTime: '',
          userAddress: null);
      RefreshTokenResponse response =
          RefreshTokenResponse(authorizationToken: '1', refreshToken: '1');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => null);
      when(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => authorizationToken);
      when(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      )).thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      )).thenAnswer((_) => '1');
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      ));
      verify(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
        where: anyNamed('where'),
      ));
      verify(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      ));
      verify(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      ));
      expect(result, Right(response));
    });
    test(
        'Return data sucessfull and update the device info when exist a device before',
        () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      Map<String, dynamic> verifyRefreshTokenPayload = {
        'refreshTokenFk': 'any'
      };
      RefreshToken refreshToken = RefreshToken(
          id: '',
          createTime: '',
          deviceFk: '',
          expirationTime: '',
          updateTime: '',
          userFk: '',
          valid: true);
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '',
        createTime: '',
        deviceFk: '',
        updateTime: '',
        userFk: '',
        valid: true,
        app: AppType.App,
        appVersion: '',
        refreshTokenFk: '',
      );
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      User user = User(
          alias: '',
          isLegalAge: true,
          createTime: '',
          email: '',
          fullName: '',
          highQualityPhoto: '',
          highQualityPhotoBlurHash: '',
          id: '',
          lowQualityPhoto: '',
          lowQualityPhotoBlurHash: null,
          permissions: null,
          thumbnail: '',
          thumbnailBlurHash: '',
          updateTime: '',
          userAddress: null);
      RefreshTokenResponse response =
          RefreshTokenResponse(authorizationToken: '1', refreshToken: '1');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => verifyRefreshTokenPayload);
      when(mockRefreshTokenLocalDataSource.getRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => refreshToken);
      when(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => user);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => true);
      when(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => device);
      when(mockDeviceLocalDataSource.updateDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
        where: anyNamed('where'),
      )).thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => refreshToken);
      when(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => authorizationToken);
      when(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      )).thenAnswer((_) => '1');
      when(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      )).thenAnswer((_) => '1');
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockRefreshTokenLocalDataSource.getRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      ));
      verify(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockDeviceLocalDataSource.updateDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
        where: anyNamed('where'),
      ));
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      ));
      verify(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      ));
      expect(result, Right(response));
    });
    test('Return GrpcError.internal when the code throw a Exception', () async {
      // setup
      Map<String, dynamic> data = {
        'refreshToken':
            jsonWebToken.generateRefreshToken(payload: {'refreshTokenFk': '1'}),
      };
      // side effects
      when(mockJsonWebToken.verify(any, any)).thenThrow(Exception());
      final result = await authenticationImpl.refreshToken(
          context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verifyNever(mockRefreshTokenLocalDataSource.getRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockUserLocalDataSource.getUser(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
      ));
      verifyNever(mockDeviceLocalDataSource.getDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockDeviceLocalDataSource.updateDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
        where: anyNamed('where'),
      ));
      verifyNever(mockDeviceLocalDataSource.createDevice(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockRefreshTokenLocalDataSource.createRefreshToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(
          mockAuthorizationTokenLocalDataSource.createAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockJsonWebToken.generateRefreshToken(
        payload: anyNamed('payload'),
      ));
      verifyNever(mockJsonWebToken.generateAuthorizationToken(
        payload: anyNamed('payload'),
      ));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
  group('testing signOut', () {
    test('SignOut sucessfull when all == true', () async {
      // setup
      Map<String, dynamic> data = {'all': true};
      Map<String, dynamic> jsonWebTokenVerify = {'authorizationTokenFk': ''};
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '',
          app: AppType.App,
          appVersion: '',
          createTime: '',
          deviceFk: '',
          refreshTokenFk: '',
          updateTime: '',
          userFk: '',
          valid: true);
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockDeviceLocalDataSource.getDevice(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              where: anyNamed('where')))
          .thenAnswer((_) async => true);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.getDevice(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Right(null));
    });
    test(
        'Return GrpcError.unauthenticated() when all == true and the authorizationToken not exists',
        () async {
      // setup
      Map<String, dynamic> data = {'all': true};
      Map<String, dynamic> jsonWebTokenVerify = {'authorizationTokenFk': ''};
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockDeviceLocalDataSource.getDevice(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test(
        'Return GrpcError.unauthenticated() when all == true and the device not exists',
        () async {
      // setup
      Map<String, dynamic> data = {'all': true};
      Map<String, dynamic> jsonWebTokenVerify = {'authorizationTokenFk': ''};
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '',
          app: AppType.App,
          appVersion: '',
          createTime: '',
          deviceFk: '',
          refreshTokenFk: '',
          updateTime: '',
          userFk: '',
          valid: true);
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockDeviceLocalDataSource.getDevice(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.getDevice(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test(
        'SignOut sucessfull when everything is fine and all == false and authorizationTokenFk == null',
        () async {
      // setup
      Map<String, dynamic> data = {
        'all': false,
        'authorizationTokenFk': '',
      };
      Map<String, dynamic> jsonWebTokenVerify = {
        'authorizationTokenFk': '',
      };
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '',
          app: AppType.App,
          appVersion: '',
          createTime: '',
          deviceFk: '',
          refreshTokenFk: '',
          updateTime: '',
          userFk: '',
          valid: true);
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              where: anyNamed('where')))
          .thenAnswer((_) async => true);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Right(null));
    });
    test(
        'Return GrpcError.unauthenticated when authorizationToken dosnt exists and all == false and authorizationTokenFk == null',
        () async {
      // setup
      Map<String, dynamic> data = {
        'all': false,
        'authorizationTokenFk': '',
      };
      Map<String, dynamic> jsonWebTokenVerify = {
        'authorizationTokenFk': '',
      };
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => null);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test(
        'Return GrpcError.internal when the code throw a Exception dosnt exists and all == false and authorizationTokenFk == null',
        () async {
      // setup
      Map<String, dynamic> data = {
        'all': false,
        'authorizationTokenFk': '',
      };
      // side effects
      when(mockJsonWebToken.verify(any, any)).thenThrow(Exception());
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verifyNever(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
    test(
        'SignOut sucessfull when all == false and authorizationTokenFk != null',
        () async {
      // setup
      Map<String, dynamic> data = {
        'all': true,
        'authorizationTokenFk': '1',
      };
      Map<String, dynamic> jsonWebTokenVerify = {
        'authorizationTokenFk': '',
      };
      AuthorizationToken authorizationToken = AuthorizationToken(
          id: '',
          app: AppType.App,
          appVersion: '',
          createTime: '',
          deviceFk: '',
          refreshTokenFk: '',
          updateTime: '',
          userFk: '',
          valid: true);
      Device device = Device(
          id: '',
          createTime: '',
          deviceId: '',
          firebaseCloudMessagingId: '',
          model: '',
          platform: PlatformType.Android,
          systemVersion: '',
          updateTime: '');
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => authorizationToken);
      when(mockDeviceLocalDataSource.getDevice(
              context: anyNamed('context'),
              data: anyNamed('data'),
              paths: anyNamed('paths')))
          .thenAnswer((_) async => device);
      when(mockRefreshTokenLocalDataSource.deleteRefreshToken(
              context: anyNamed('context'),
              data: anyNamed('data'),
              where: anyNamed('where')))
          .thenAnswer((_) async => true);
      final result = await authenticationImpl
          .signOut(context: ctx, data: data, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockDeviceLocalDataSource.getDevice(
          context: anyNamed('context'),
          data: anyNamed('data'),
          paths: anyNamed('paths')));
      verify(mockRefreshTokenLocalDataSource.deleteRefreshToken(
          context: anyNamed('context'),
          data: anyNamed('data'),
          where: anyNamed('where')));
      expect(result, Right(null));
    });
  });
  group('testing listSession', () {
    test('Return data sucessfull when everything is fine', () async {
      // setup
      Map<String, dynamic> jsonWebTokenVerify = {
        'authorizationTokenFk': '',
      };
      AuthorizationToken authorizationToken = AuthorizationToken(
        id: '',
        app: AppType.App,
        appVersion: '',
        createTime: '',
        deviceFk: '',
        refreshTokenFk: '',
        updateTime: '',
        userFk: '',
        valid: true,
      );
      List<Session> listOfSession = [
        Session(
            id: '',
            actual: true,
            app: AppType.App,
            appVersion: '',
            model: '',
            platform: PlatformType.Android,
            systemVersion: ''),
        Session(
            id: '',
            actual: true,
            app: AppType.App,
            appVersion: '',
            model: '',
            platform: PlatformType.Android,
            systemVersion: ''),
      ];
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => authorizationToken);
      when(mockSessionLocalDataSource.listSession(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => listOfSession);
      final result = await authenticationImpl.listSession(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verify(mockSessionLocalDataSource.listSession(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(result, Right(ListSessionResponse(sessions: listOfSession)));
    });
    test(
        'Return GrpcError.unauthenticated when the authorizationToken not exists',
        () async {
      // setup
      Map<String, dynamic> jsonWebTokenVerify = {
        'authorizationTokenFk': '',
      };
      // side effects
      when(mockJsonWebToken.verify(any, any))
          .thenAnswer((_) => jsonWebTokenVerify);
      when(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      )).thenAnswer((_) async => null);
      final result = await authenticationImpl.listSession(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verify(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockSessionLocalDataSource.listSession(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(result, Left(GrpcError.unauthenticated('Unauthenticated')));
    });
    test('Return GrpcError.internal when the code throw an Exception',
        () async {
      // setup
      // side effects
      when(mockJsonWebToken.verify(any, any)).thenThrow(Exception());
      final result = await authenticationImpl.listSession(
          context: ctx, data: {}, metadata: metadata, paths: []);
      // expectations
      verify(mockJsonWebToken.verify(any, any));
      verifyNever(mockAuthorizationTokenLocalDataSource.getAuthorizationToken(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      verifyNever(mockSessionLocalDataSource.listSession(
        context: anyNamed('context'),
        data: anyNamed('data'),
        paths: anyNamed('paths'),
      ));
      expect(result, Left(GrpcError.internal('Internal server error')));
    });
  });
}
