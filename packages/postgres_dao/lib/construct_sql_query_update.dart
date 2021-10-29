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
