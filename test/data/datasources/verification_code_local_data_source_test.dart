import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

import '../../../lib/protos/protos/main.pb.dart';
import 'verification_code_local_data_source_test.mocks.dart';

@GenerateMocks([
  Database,
])
void main() {
  late PostgreSQLConnection connection;
  late PostgreSQLExecutionContext context;
  late MockDatabase mockDatabase;
  late VerificationCodeLocalDataSourceImpl verificationCodeLocalDataSourceImpl;

  setUp(() async {
    mockDatabase = MockDatabase();
    verificationCodeLocalDataSourceImpl =
        VerificationCodeLocalDataSourceImpl(mockDatabase);
    connection = PostgreSQLConnection('192.168.1.3', 5432, 'postgres',
        username: 'postgres', password: 'postgres');
    await connection.open();
    await connection.transaction((ctx) async {
      context = ctx;
    });
  });

  tearDown(() async {
    await connection.close();
  });

  group('testing createVerificationCode', () {
    test('Return data successfully when everything is ok', () async {
      // setup
      Map<String, dynamic> inputData = {
        'deviceId': '1',
        'email': '1',
        'type': 'SIGN_IN'
      };
      Map<String, dynamic> responseData = {
        'id': '1',
        'deviceId': '1',
        'email': '1',
        'type': 'SIGN_IN',
        'code': '1'
      };
      VerificationCode verificationCode = VerificationCode(
          code: '1',
          deviceId: '1',
          email: '1',
          id: '1',
          type: VerificationCodeType.SIGN_IN);
      when(mockDatabase.create(
          context: anyNamed('context'),
          table: anyNamed('table'),
          data: anyNamed('data'),
          paths: [])).thenAnswer((_) async => responseData);
      // side effects
      final response = await verificationCodeLocalDataSourceImpl
          .createVerificationCode(context: context, data: inputData, paths: []);
      // expectations
      verify(mockDatabase.create(
          context: context,
          table: 'VerificationCode',
          data: inputData,
          paths: []));
      expect(response, verificationCode);
    });
  });
}
