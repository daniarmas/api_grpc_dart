import 'package:postgres/postgres.dart';
import 'package:postgres_dao/attribute.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where.dart';

abstract class Database {
  Future<bool> connect();
  void close();

  Future<PostgreSQLConnection> getConnection();

  Future<List<Map<String, dynamic>>> list(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<String> attributes,
      required List<Where> where,
      InnerJoin? innerJoin,
      List<String>? agregationMethods,
      int? limit,
      String? orderByAsc});

  Future<List<Map<String, dynamic>>> search({
    required PostgreSQLExecutionContext context,
    required String table,
    required List<Where> where,
    List<Attribute>? attributes,
    InnerJoin? innerJoin,
    int? limit,
    String? orderByAsc,
    List<String>? agregationMethods,
  });

  Future<Map<String, dynamic>?> get(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<String> attributes,
      required List<Where> where,
      InnerJoin? innerJoin,
      List<String>? agregationMethods});

  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<String> attributes});

  Future<Map<String, dynamic>?> update(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Where> where,
      required List<String> attributes});

  Future<bool> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where});
}
