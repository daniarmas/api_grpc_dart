import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import '../../environment.dart';
import 'database.dart';

class PostgresqlDatabase implements Database {
  static final _environment = GetIt.I<Environment>();
  static final _connection = PostgreSQLConnection(_environment.databaseHost,
      _environment.databasePort, _environment.databaseDatabase,
      username: _environment.databaseUsername,
      password: _environment.databasePassword);

  Future<bool> connect() async {
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
        'SELECT "$table"."id", "Business"."name" FROM "$table"');
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
