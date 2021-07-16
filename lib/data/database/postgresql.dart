import 'package:api_grpc_dart/data/database/database.dart';
import 'package:postgres/postgres.dart';

class PostgresqlDatabase implements Database {
  static final _connection = PostgreSQLConnection(
      '192.168.0.2', 54322, 'database',
      username: 'postgres', password: 'postgres');

  Future<bool> setUp() async {
    try {
      await _connection.open().then((value) async {
        print('🚀 Database Server is on...');
      });
      return Future.value(true);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  dynamic create(dynamic object) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void delete(String id) {
    // TODO: implement delete
  }

  @override
  dynamic get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Iterable<dynamic>> list({required String table}) async {
    return _connection.mappedResultsQuery(
        'SELECT "Business"."id", "Business"."name" FROM "Business"');
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
