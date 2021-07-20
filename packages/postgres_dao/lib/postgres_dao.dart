import 'package:postgres/postgres.dart';

import 'construct_sql_query.dart';
import 'where_attribute.dart';

class PostgresqlDao {
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;
  late PostgreSQLConnection _connection;

  PostgresqlDao({
    required this.host,
    required this.port,
    required this.database,
    required this.username,
    required this.password,
  });

  Future<bool> connect() async {
    try {
      _connection = PostgreSQLConnection(host, port, database,
          username: username, password: password);
      await _connection.open().then((value) async {
        print('🚀 Database Server is on...');
      });
      return Future.value(true);
    } catch (error) {
      throw Exception(error);
    }
  }

  dynamic create(dynamic object) {
    // TODO: implement create
    throw UnimplementedError();
  }

  void delete(String id) {
    // TODO: implement delete
  }

  dynamic get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  Future<List<dynamic>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationAttributes,
      int? limit,
      List<WhereAttribute>? whereAnd,
      String? orderByAsc}) async {
    String query = constructSqlQuery(
        limit: limit,
        whereAnd: whereAnd,
        table: table,
        attributes: attributes,
        agregationAttributes: agregationAttributes,
        orderByAsc: orderByAsc);
    print(query);
    return _connection.mappedResultsQuery(query);
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
