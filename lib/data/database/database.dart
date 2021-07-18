abstract class Database {
  Future<bool> connect();
  Future<List<dynamic>> list({required String table, List<String>? attributes});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}
