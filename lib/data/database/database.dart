import 'package:postgres/postgres.dart';
import 'package:postgres_dao/where.dart';

abstract class Database {
  Future<bool> connect();
  void close();

  Future<PostgreSQLConnection> getConnection();

  /// Listing registries...
  Future<List<Map<String, dynamic>>> list(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<String> attributes,
      required List<Where> where,
      List<String>? agregationMethods,
      int? limit,
      String? orderByAsc});

  Future<Map<String, dynamic>> get(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<String> attributes,
      required List<Where> where,
      List<String>? agregationMethods});

  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<String> attributes});

  Future<Map<String, dynamic>> update(dynamic object);

  Future<void> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where});
}
