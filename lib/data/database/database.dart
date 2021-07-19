abstract class Database {
  Future<bool> connect();

  /// Listing registries...
  Future<List<dynamic>> list(
      {required String table,
      List<Attribute>? attributes,
      int? limit,
      List<WhereAttribute>? whereAnd,
      String? orderByAsc});
  dynamic get();
  dynamic create(dynamic object);
  dynamic update(dynamic object);
  void delete(String id);
}

abstract class WhereAttribute {
  final String key;
  final dynamic value;

  WhereAttribute({required this.key, required this.value});
}

class WhereNormalAttribute extends WhereAttribute {
  WhereNormalAttribute(
      {required String key, required dynamic value, required String table})
      : super(key: '"$table"."$key"', value: value);
}

class WhereAgregationAttribute extends WhereAttribute {
  WhereAgregationAttribute({required String key, required dynamic value})
      : super(key: key, value: value);
}

abstract class Attribute {
  final String name;
  final dynamic table;

  Attribute({required this.name, required this.table});
}

class NormalAttribute extends Attribute {
  NormalAttribute({required String name, required String table})
      : super(name: '"$table"."$name"', table: table);
}

class AgregationAttribute extends Attribute {
  AgregationAttribute({required String name, required String table})
      : super(name: name, table: table);
}
