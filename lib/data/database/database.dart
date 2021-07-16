abstract class Database {
  Future<bool> connect();
  Future<Iterable<dynamic>> list({required String table});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}
