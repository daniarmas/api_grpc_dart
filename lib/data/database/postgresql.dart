import 'package:api_grpc_dart/core/error/exception.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/attribute.dart';
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
  Future<PostgreSQLConnection> getConnection() {
    try {
      return _connection.getConnection();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Attribute> attributes}) async {
    data.addAll({
      'createTime': DateTime.now().toUtc(),
      'updateTime': DateTime.now().toUtc()
    });
    return await _connection.create(
        table: table, data: data, attributes: attributes, context: context);
  }

  @override
  Future<bool> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where}) async {
    try {
      await _connection.delete(table: table, where: where, context: context);
      return true;
    } catch (error) {
      if (error.toString() ==
          'Attempting to execute query, but connection is not open.') {
        throw DatabaseConnectionNotOpenException();
      } else if (error
          .toString()
          .contains('relation "$table" does not exist')) {
        throw DatabaseTableNotExistsException();
      } else if (error.toString().contains('NOT_FOUND')) {
        return false;
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>?> get(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Attribute> attributes,
      required List<Where> where,
      InnerJoin? innerJoin,
      List<String>? agregationMethods}) async {
    try {
      final response = await _connection.get(
          context: context,
          where: where,
          table: table,
          innerJoin: innerJoin,
          attributes: attributes,
          agregationMethods: agregationMethods);
      return response;
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
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where,
      required List<Attribute> attributes,
      InnerJoin? innerJoin,
      List<String>? agregationMethods,
      int? limit,
      String? orderByAsc}) async {
    try {
      return await _connection.list(
          context: context,
          limit: (limit != null) ? limit + 1 : limit,
          where: where,
          table: table,
          attributes: attributes,
          agregationAttributes: agregationMethods,
          innerJoin: innerJoin,
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
  Future<Map<String, dynamic>?> update(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Where> where,
      required List<Attribute> attributes}) async {
    try {
      data.remove('id');
      if (data.isEmpty) {
        throw GrpcError.invalidArgument('You must send at least one parameter');
      }
      final response = await _connection.update(
          context: context,
          where: where,
          table: table,
          attributes: attributes,
          data: data);
      return response;
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
  Future<List<Map<String, dynamic>>> search(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where,
      List<Attribute>? attributes,
      InnerJoin? innerJoin,
      List<String>? agregationMethods,
      int? limit,
      String? orderByAsc}) async {
    try {
      return await _connection.search(
          context: context,
          limit: (limit != null) ? limit + 1 : limit,
          where: where,
          table: table,
          attributes: attributes,
          innerJoin: innerJoin,
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
}
