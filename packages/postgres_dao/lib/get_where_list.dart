import 'package:postgres_dao/where.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

List<Where> getWhereNormalAttributeList(Map<String, dynamic> data) {
  List<Where> where = [];
  Iterable<String> keys = data.keys;
  Iterable<dynamic> values = data.values;
  for (var i = 0; i < keys.length; i++) {
    where.add(WhereNormalAttribute(
        key: keys.elementAt(i), value: values.elementAt(i)));
  }
  return where;
}
