import 'package:postgres_dao/where.dart';

abstract class Database {
  Future<bool> connect();

  /// Listing registries...
  Future<List<dynamic>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<Where>? where,
      String? orderByAsc});

  Future<dynamic> get();

  Future<Map<String, dynamic>> create(
      {required String table, required Map<String, dynamic> data});

  Future<dynamic> update(dynamic object);

  void delete(String id);
}
