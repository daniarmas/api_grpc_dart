import 'package:postgres_dao/and.dart';
import 'package:postgres_dao/attribute.dart';
import 'package:postgres_dao/inner_attribute.dart';
import 'package:postgres_dao/normal_attribute.dart';
import 'package:postgres_dao/or.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where_attribute.dart';
import 'package:postgres_dao/where_normal_attribute_higher.dart';
import 'package:postgres_dao/where_normal_attribute_in.dart';
import 'package:postgres_dao/where_normal_attribute_not_in.dart';
import 'package:postgres_dao/where_search.dart';

import 'where.dart';
import 'where_normal_attribute.dart';

String constructSqlQuerySearch({
  required String table,
  required List<Where> where,
  List<Attribute>? attributes,
  List<String>? agregationAttributes,
  InnerJoin? innerJoin,
  int? limit,
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
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value}';
              } else if (where[y] is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (where[y] is WhereNormalAttributeIn &&
                  item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString +=
                    ' AND "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' AND "$table".$item';
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
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
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
              } else if (where[y] is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else {
                whereString += '${item.key} = \'${item.value}\'';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\'';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += ' OR "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value}';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' OR "$table".$item';
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
          if (item is WhereNormalAttributeEqual) {
            whereString += '"$table".${item.key} = \'${item.value}\'';
          } else if (item is WhereNormalAttributeNotEqual) {
            whereString += '"$table".${item.key} != \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeHigher) {
            whereString += '"$table".$item';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += '"$table".${item.key} ${item.value}';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += '${item.key} = \'${item.value}\'';
          }
        }
      } else {
        whereString += ' AND ';
        if (where[i] is And) {
          var and = where[i] as And;
          for (var y = 0; y < and.attributes.length; y++) {
            var item = and.attributes[y];
            if (y == 0) {
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' AND "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString +=
                    ' AND "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' AND "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
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
              if (item is WhereNormalAttributeEqual) {
                whereString += '"$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += '"$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value == '') {
              } else if (item is WhereNormalAttributeHigher) {
                whereString += '"$table".$item';
              } else if (item is WhereNormalAttributeIn && item.value != '') {
                whereString += '"$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeIn && item.value == '') {
              } else {
                whereString += '${item.key} = \'${item.value}\' ';
              }
            } else {
              if (item is WhereNormalAttributeEqual) {
                whereString += ' OR "$table".${item.key} = \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotEqual) {
                whereString += ' OR "$table".${item.key} != \'${item.value}\' ';
              } else if (item is WhereNormalAttributeNotIn &&
                  item.value != '') {
                whereString += ' OR "$table".${item.key} ${item.value} ';
              } else if (item is WhereNormalAttributeHigher) {
                whereString += ' OR "$table".$item';
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
          if (item is WhereNormalAttributeEqual) {
            whereString += ' "$table".${item.key} = \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotEqual) {
            whereString += ' "$table".${item.key} != \'${item.value}\' ';
          } else if (item is WhereNormalAttributeNotIn && item.value != '') {
            whereString += ' "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeHigher) {
            whereString += '"$table".$item';
          } else if (item is WhereNormalAttributeNotIn && item.value == '') {
          } else if (item is WhereNormalAttributeIn && item.value != '') {
            whereString += ' "$table".${item.key} ${item.value} ';
          } else if (item is WhereNormalAttributeIn && item.value == '') {
          } else {
            whereString += ' ${item.key} = \'${item.value}\' ';
          }
        }
      }
    }
    whereResult = 'WHERE $whereString';
  }
  // InnerJoin
  String innerJoinResult = (innerJoin != null) ? '$innerJoin' : '';
  // OrderBy
  String orderByAscResult =
      orderByAsc != null ? 'ORDER BY $orderByAsc ASC ' : '';
  // Limit
  String limitResult = limit != null ? 'LIMIT $limit;' : '';
  return 'SELECT $attributesResult '
      'FROM "$table" '
      '$innerJoinResult'
      '$whereResult'
      '$orderByAscResult'
      '$limitResult ';
}
