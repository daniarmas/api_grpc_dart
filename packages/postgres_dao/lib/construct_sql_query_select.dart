import 'package:postgres_dao/and.dart';
import 'package:postgres_dao/normal_attribute.dart';
import 'package:postgres_dao/or.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_higher.dart';
import 'package:postgres_dao/where_normal_attribute_in.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';

import 'where.dart';
import 'where_normal_attribute.dart';

String constructSqlQuerySelect({
  required String table,
  List<Attribute>? attributes,
  List<String>? agregationAttributes,
  InnerJoin? innerJoin,
  int? limit,
  List<Where>? where,
  String? orderByAsc,
}) {
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
        } else if (attributes[i] is CaseAttribute) {
          var caseAttribute = attributes[i] as CaseAttribute;
          attributesResult += '$caseAttribute';
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
        } else if (attributes[i] is CaseAttribute) {
          var caseAttribute = attributes[i] as CaseAttribute;
          attributesResult += '$caseAttribute,';
        } else {
          attributesResult += '"$table".${attributes[i].name},';
        }
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
  whereResult = parseWhere(table: table, where: where);
  // InnerJoin
  String innerJoinResult = (innerJoin != null) ? '$innerJoin' : '';
  // OrderBy
  String orderByAscResult =
      orderByAsc != null ? 'ORDER BY "$orderByAsc" ASC ' : '';
  // Limit
  String limitResult = limit != null ? 'LIMIT $limit;' : '';
  return 'SELECT $attributesResult '
      'FROM "$table" '
      '$innerJoinResult'
      '$whereResult'
      '$orderByAscResult'
      '$limitResult ';
}
