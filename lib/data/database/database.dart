import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

abstract class Database {
  Future<bool> connect();
  void close();

  Future<PostgreSQLConnection> getConnection();

  Future<List<Map<String, dynamic>>> list(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Attribute> attributes,
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
      required List<Attribute> attributes,
      required List<Where> where,
      InnerJoin? innerJoin,
      List<String>? agregationMethods});

  Future<Map<String, dynamic>> create(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Attribute> attributes});

  Future<Map<String, dynamic>?> update(
      {required PostgreSQLExecutionContext context,
      required String table,
      required Map<String, dynamic> data,
      required List<Where> where,
      required List<Attribute> attributes});

  Future<bool> delete(
      {required PostgreSQLExecutionContext context,
      required String table,
      required List<Where> where});
}
