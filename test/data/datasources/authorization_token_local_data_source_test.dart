import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart';
import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/protos/protos/main.pb.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

import './authorization_token_local_data_source_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  late AuthorizationTokenLocalDataSourceImpl localDataSource;
  late MockDatabase mockDatabase;
  late Database database;
  late PostgreSQLConnection connection;

  setUp(() async {
    configureDependencies();
    mockDatabase = MockDatabase();
    localDataSource = AuthorizationTokenLocalDataSourceImpl(mockDatabase);
    database = GetIt.I<Database>();
    connection = await database.getConnection();
  });

  List<Map<String, Map<String, Object>>> databaseResult = [
    {
      'AuthorizationToken': {
        'id': '5c8d9f3a-c5cb-488d-a7f6-da88800fed85',
        'authorizationToken': 'Kadis Cardenas',
        'refreshTokenFk': 'No pierdas la oportunidad de darle a la...',
        'deviceFk': 'asdasjldsad',
        'userFk': '4241231231',
        'valid': true,
        'app': 'APP',
        'appVersion':
            'http://192.168.0.2:9001/business-avatar/138707853_399772044633247_7513581601211252771_n.jpg',
      }
    }
  ];

  List<AuthorizationToken> listOfAuthorizationTokens = [
    AuthorizationToken(
      id: '5c8d9f3a-c5cb-488d-a7f6-da88800fed85',
      app: AuthorizationToken_AppType.APP,
      authorizationToken: 'Kadis Cardenas',
      refreshTokenFk: 'No pierdas la oportunidad de darle a la...',
      deviceFk: 'asdasjldsad',
      userFk: '4241231231',
      valid: true,
      appVersion:
          'http://192.168.0.2:9001/business-avatar/138707853_399772044633247_7513581601211252771_n.jpg',
    )
  ];

  group('authorization token local data source ...', () {
    test('should return data when the call to list in database is successful.',
        () async {
      // setup
      when(mockDatabase.list(
              agregationMethods: anyNamed('agregationMethods'),
              attributes: anyNamed('attributes'),
              limit: anyNamed('limit'),
              orderByAsc: anyNamed('orderByAsc'),
              table: anyNamed('table'),
              where: anyNamed('where')))
          .thenAnswer((_) async => databaseResult);
      // act
      late List<AuthorizationToken> result;
      await connection.transaction((context) async {
        result = await localDataSource.listAuthorizationToken(context: context);
      });
      // assert
      verify(mockDatabase.list(
          agregationMethods: anyNamed('agregationMethods'),
          attributes: anyNamed('attributes'),
          limit: anyNamed('limit'),
          orderByAsc: anyNamed('orderByAsc'),
          table: anyNamed('table'),
          where: anyNamed('where')));
      expect(result, listOfAuthorizationTokens);
    });
  });
}
