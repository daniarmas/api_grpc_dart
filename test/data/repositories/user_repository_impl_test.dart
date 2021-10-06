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

@GenerateMocks([UserLocalDataSource, Database])
void main() {
  late EnvironmentApp environment;
  late MockUserLocalDataSource mockUserLocalDataSource;
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
  });

  tearDown(() async {
    await connection.close();
  });

  group('testing getUser', () {
    test(
        'Return data successfully when everything is ok',
        () async {
      // setup

      // side effects

      // expectations
    });
  });
}
