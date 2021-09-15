import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
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
      return await _connection.connect();
    } catch (error) {
      rethrow;
    }
  }

  @override
  void close() async {
    try {
      _connection.close();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> create(
      {required String table,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    return await _connection.create(table: table, data: data, paths: paths);
  }

  @override
  Future<void> delete(
      {required String table,
      required List<Where> where,
      List<String>? attributes}) async {
    try {
      await _connection.delete(table: table, where: where);
    } catch (error) {
      if (error.toString() ==
          'Attempting to execute query, but connection is not open.') {
        throw DatabaseConnectionNotOpenException();
      } else if (error
          .toString()
          .contains('relation "$table" does not exist')) {
        throw DatabaseTableNotExistsException();
      } else if (error.toString().contains('NOT_FOUND')) {
        throw NotFoundException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      List<Where>? where}) async {
    try {
      return await _connection.get(
          where: where,
          table: table,
          attributes: attributes,
          agregationMethods: agregationMethods);
    } catch (error) {
      if (error.toString() ==
          'Attempting to execute query, but connection is not open.') {
        throw DatabaseConnectionNotOpenException();
      } else if (error
          .toString()
          .contains('relation "$table" does not exist')) {
        throw DatabaseTableNotExistsException();
      } else if (error.toString().contains('NOT_FOUND')) {
        throw GrpcError.notFound('Not found');
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<List<Map<String, dynamic>>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<Where>? where,
      String? orderByAsc}) async {
    try {
      return await _connection.list(
          limit: limit,
          where: where,
          table: table,
          attributes: attributes,
          agregationAttributes: agregationMethods,
          orderByAsc: orderByAsc);
    } catch (error) {
      if (error.toString().contains(
          'Attempting to execute query, but connection is not open.')) {
        throw DatabaseConnectionNotOpenException();
      } else if (error
          .toString()
          .contains('relation "$table" does not exist')) {
        throw DatabaseTableNotExistsException();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
