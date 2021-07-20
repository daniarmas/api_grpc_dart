import 'package:postgres_dao/normal_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';

import 'where_attribute.dart';
import 'where_normal_attribute.dart';

String constructSqlQuery({
  required String table,
  List<String>? attributes,
  List<String>? agregationAttributes,
  int? limit,
  List<WhereAttribute>? where,
  String? orderByAsc,
}) {
  // Attributes
  String attributesResult = '*';
  if (attributes != null && attributes.isNotEmpty) {
    attributesResult = '';
    for (int i = 0; i < attributes.length; i++) {
      if (i == attributes.length - 1) {
        (attributes[i] is NormalAttribute)
            ? attributesResult += '"$table"."${attributes[i]}"'
            : attributesResult += '"$table"."${attributes[i]}"';
      } else {
        (attributes[i] is NormalAttribute)
            ? attributesResult += '"$table"."${attributes[i]}",'
            : attributesResult += '"$table"."${attributes[i]}",';
      }
    }
  }
  // AgregationAttributes
  String agregationAttributesResult = '';
  if (agregationAttributes != null && agregationAttributes.isNotEmpty) {
    for (int i = 0; i < agregationAttributes.length; i++) {
      if (i == agregationAttributes.length - 1) {
        agregationAttributesResult += agregationAttributes[i];
      } else {
        agregationAttributesResult += '${agregationAttributes[i]},';
      }
    }
    attributesResult += ', $agregationAttributesResult';
  }
  // Where
  String whereResult = '';
  if (where != null && where.isNotEmpty) {
    String whereString = '';
    for (int i = 0; i < where.length; i++) {
      if (i == where.length - 1) {
        if (where[i] is WhereNormalAttribute) {
          whereString +=
              ' AND "$table".${where[i].key} = \'${where[i].value}\' ';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value != '') {
          whereString +=
              ' AND "$table".${where[i].key} ${where[i].value} ';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value == '') {
        } else {
          whereString += ' AND ${where[i].key} = \'${where[i].value}\' ';
        }
      } else if (i == 0) {
        if (where[i] is WhereNormalAttribute) {
          whereString +=
              '"$table".${where[i].key} = \'${where[i].value}\'';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value != '') {
          whereString += '"$table".${where[i].key} ${where[i].value}';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value == '') {
        } else {
          whereString += '${where[i].key} = \'${where[i].value}\'';
        }
      } else {
        if (where[i] is WhereNormalAttribute) {
          whereString +=
              ' AND "$table".${where[i].key} = \'${where[i].value}\'';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value != '') {
          whereString +=
              ' AND "$table".${where[i].key} ${where[i].value}';
        } else if (where[i] is WhereNormalAttributeNotIn &&
            where[i].value == '') {
        } else {
          whereString += ' AND ${where[i].key} = \'${where[i].value}\'';
        }
      }
    }
    whereResult = 'WHERE $whereString';
  }
  // OrderBy
  String orderByAscResult =
      orderByAsc != null ? 'ORDER BY  $orderByAsc ASC ' : '';
  // Limit
  String limitResult = limit != null ? 'LIMIT $limit;' : '';
  return 'SELECT $attributesResult '
      'FROM "$table" '
      '$whereResult'
      '$orderByAscResult'
      '$limitResult';
}
