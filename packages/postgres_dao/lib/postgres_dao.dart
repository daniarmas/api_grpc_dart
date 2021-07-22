import 'package:postgres/postgres.dart';
import 'package:postgres_dao/construct_sql_query_insert.dart';

import 'construct_sql_query_select.dart';
import 'where.dart';

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

  Future<Map<String, dynamic>> create(
      {required String table, required Map<String, dynamic> data}) async {
    String query = constructSqlQueryInsert(table: table, data: data);
    final response = await _connection.mappedResultsQuery(query);
    return Future.value(response[0][table]);
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
      List<Where>? where,
      String? orderByAsc}) async {
    String? query = constructSqlQuerySelect(
        limit: limit,
        where: where,
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
