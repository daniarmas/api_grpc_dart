abstract class Database {
  Future<Iterable<dynamic>> list({required String table});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}
