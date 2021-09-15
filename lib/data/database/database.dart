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
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<Where>? where,
      String? orderByAsc});

  Future<Map<String, dynamic>> get(
      {required PostgreSQLExecutionContext context,
      required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      List<Where>? where});

  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<Map<String, dynamic>> update(dynamic object);

  Future<void> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where});
}
