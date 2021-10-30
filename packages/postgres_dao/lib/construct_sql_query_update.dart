import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where.dart';
import 'package:postgres_dao/where_attribute.dart';
import 'package:postgres_dao/where_normal_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';

import 'and.dart';
import 'or.dart';

String constructSqlQueryUpdate(
    {required String table,
    required Map<String, dynamic> data,
    required List<Where>? where,
    List<Attribute>? attributes}) {
  String columns = '';
  Iterable<String> keys = data.keys;
  Iterable<dynamic> values = data.values;
  // Columns && Values
  for (var i = 0; i < keys.length; i++) {
    if (i == keys.length - 1) {
      columns += "\"${keys.elementAt(i)}\" = '${values.elementAt(i)}'";
    } else {
      columns += "\"${keys.elementAt(i)}\" = '${values.elementAt(i)}',";
    }
  }
  // Where
  String whereResult = '';
  whereResult = parseWhere(table: table, where: where);
  // Attributes
  String attributesResult = '*';
  if (attributes != null && attributes.isNotEmpty) {
    attributesResult = '';
    for (int i = 0; i < attributes.length; i++) {
      if (i == attributes.length - 1) {
        if (attributes[i] is NormalAttribute) {
          attributesResult += '"$table".${attributes[i].name}';
        } else if (attributes[i] is InnerAttribute) {
          var innerAttribute = attributes[i] as InnerAttribute;
          attributesResult +=
              '"${innerAttribute.innerTable}".${attributes[i].name}';
        } else {
          attributesResult += '"$table".${attributes[i].name}';
        }
      } else {
        if (attributes[i] is NormalAttribute) {
          attributesResult += '"$table".${attributes[i].name},';
        } else if (attributes[i] is InnerAttribute) {
          var innerAttribute = attributes[i] as InnerAttribute;
          attributesResult +=
              '"${innerAttribute.innerTable}".${attributes[i].name},';
        } else {
          attributesResult += '"$table".${attributes[i].name},';
        }
      }
    }
  }
  return 'UPDATE "$table" '
      'SET $columns '
      '$whereResult '
      'RETURNING $attributesResult;';
}
