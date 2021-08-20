import 'package:postgres_dao/where.dart';

abstract class Database {
  Future<bool> connect();

  /// Listing registries...
  Future<List<Map<String, dynamic>>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<Where>? where,
      String? orderByAsc});

  Future<Map<String, dynamic>> get(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      List<Where>? where});

  Future<Map<String, dynamic>> create(
      {required String table, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> update(dynamic object);

  void delete(String id);
}
