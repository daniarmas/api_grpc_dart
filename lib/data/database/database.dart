abstract class Database {
  Future<bool> connect();
  Future<List<dynamic>> list(
      {required String table,
      List<String>? attributes,
      int? limit,
      List<WhereAttribute>? where});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}

class WhereAttribute {
  final String key;
  final dynamic value;

  WhereAttribute({required this.key, required this.value});
}
