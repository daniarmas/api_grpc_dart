import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where.dart';

import '../../environment.dart';
import '../../injection_container.dart' as sl;
import 'database.dart';

class PostgresqlDatabase implements Database {
  static final Environment _environment = sl.serviceLocator();
  static final _connection = PostgresqlDao(
      host: _environment.databaseHost,
      port: _environment.databasePort,
      database: _environment.databaseDatabase,
      username: _environment.databaseUsername,
      password: _environment.databasePassword);

  @override
  Future<bool> connect() async {
    try {
      return _connection.connect();
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
  Future<List<dynamic>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<Where>? where,
      String? orderByAsc}) async {
    return _connection.list(
        limit: limit,
        where: where,
        table: table,
        attributes: attributes,
        agregationAttributes: agregationMethods,
        orderByAsc: orderByAsc);
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
