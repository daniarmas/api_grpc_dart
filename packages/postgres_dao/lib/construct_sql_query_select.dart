import 'package:postgres_dao/and.dart';
import 'package:postgres_dao/normal_attribute.dart';
import 'package:postgres_dao/or.dart';
import 'package:postgres_dao/where_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_in.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';

import 'where.dart';
import 'where_normal_attribute.dart';

String constructSqlQuerySelect({
  required String table,
  List<String>? attributes,
  List<String>? agregationAttributes,
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
      if (i == 0) {
        if (where[i] is And) {
          var and = where[i] as And;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttribute) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttribute) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' AND ${item.key} = \'${item.value}\'';
              }
            }
          }
        } else if (where[i] is Or) {
          var and = where[i] as Or;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttribute) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttribute) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' OR ${item.key} = \'${item.value}\'';
              }
            }
          }
        } else {
          var item = where[i] as WhereAttribute;
          if (item is WhereNormalAttribute) {
            whereString += '"$table".${item.key} = \'${item.value}\'';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += '${item.key} = \'${item.value}\'';
          }
        }
      } else {
        // whereString += ' AND ';
        if (where[i] is And) {
          var and = where[i] as And;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttribute) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttribute) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' AND ${item.key} = \'${item.value}\' ';
              }
            }
          }
        } else if (where[i] is Or) {
          var and = where[i] as Or;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttribute) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttribute) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += ' OR ${item.key} = \'${item.value}\' ';
              }
            }
          }
        } else {
          var item = where[i] as WhereAttribute;
          if (item is WhereNormalAttribute) {
            whereString += ' AND "$table".${item.key} = \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += ' AND "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += ' AND "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += ' AND ${item.key} = \'${item.value}\' ';
          }
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
      '$limitResult ';
}
