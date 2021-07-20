import 'package:postgres_dao/where_attribute.dart';

abstract class Database {
  Future<bool> connect();

  /// Listing registries...
  Future<List<dynamic>> list(
      {required String table,
      List<String>? attributes,
      List<String>? agregationMethods, 
      int? limit,
      List<WhereAttribute>? whereAnd,
      String? orderByAsc});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}
