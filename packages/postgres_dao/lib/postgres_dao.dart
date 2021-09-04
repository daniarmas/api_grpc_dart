import 'package:postgres/postgres.dart';
import 'package:postgres_dao/construct_sql_query_delete.dart';
import 'package:postgres_dao/construct_sql_query_insert.dart';

import 'construct_sql_query_select.dart';
import 'exception.dart';
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

  void close() async {
    try {
      _connection = PostgreSQLConnection(host, port, database,
          username: username, password: password);
      await _connection.close();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> create(
      {required String table, required Map<String, dynamic> data}) async {
    String query = constructSqlQueryInsert(table: table, data: data);
    print(query);
    final response = await _connection.mappedResultsQuery(query);
    return Future.value(response[0][table]);
  }

  Future<void> delete({required String table, List<Where>? where}) async {
    try {
      String query = constructSqlQueryDelete(where: where, table: table);
      print(query);
      final result = await _connection.mappedResultsQuery(query);
      if (result.isEmpty) {
        throw Exception('NOT_FOUND');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      List<Where>? where}) async {
    try {
      String? query = constructSqlQuerySelect(
          limit: 1,
          where: where,
          table: table,
          attributes: attributes,
          agregationAttributes: agregationMethods,
          orderByAsc: 'id');
      print(query);
      final response = await _connection.mappedResultsQuery(query);
      if (response.isNotEmpty) {
        return response[0];
      } else {
        throw Exception('NOT_FOUND');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> list(
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
