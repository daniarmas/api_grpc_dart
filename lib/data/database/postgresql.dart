import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where.dart';

import '../../environment.dart';
import 'database.dart';

@Injectable(as: Database)
class PostgresqlDatabase implements Database {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
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
  void close() async {
    try {
      _connection.close();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Map<String, dynamic>> create(
      {required String table, required Map<String, dynamic> data}) {
    return _connection.create(table: table, data: data);
  }

  @override
  void delete({required String table, required List<Where> where}) {
    _connection.delete(table: table, where: where);
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      List<Where>? where}) {
    return _connection.get(
        where: where,
        table: table,
        attributes: attributes,
        agregationMethods: agregationMethods);
  }

  @override
  Future<List<Map<String, dynamic>>> list(
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
  Future<Map<String, dynamic>> update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
