import 'attribute.dart';
import 'where_attribute.dart';
import 'where_normal_attribute.dart';

String constructSqlQuery({
  required String table,
  List<Attribute>? attributes,
  int? limit,
  List<WhereAttribute>? whereAnd,
  String? orderByAsc,
}) {
  // Attributes
  String attributesResult = '*';
  if (attributes != null && attributes.isNotEmpty) {
    attributesResult = '';
    for (int i = 0; i < attributes.length; i++) {
      if (i == attributes.length - 1) {
        attributesResult += '${attributes[i].name} ';
      } else {
        attributesResult += '${attributes[i].name}, ';
      }
    }
  }
  // Where
  String whereResult = '';
  if (whereAnd != null && whereAnd.isNotEmpty) {
    String whereString = '';
    for (int i = 0; i < whereAnd.length; i++) {
      if (i == whereAnd.length - 1) {
        (whereAnd[i] is WhereNormalAttribute)
            ? whereString += '${whereAnd[i].key} = \'${whereAnd[i].value}\' '
            : whereString += '${whereAnd[i].key} = \'${whereAnd[i].value}\' ';
      } else {
        (whereAnd[i] is WhereNormalAttribute)
            ? whereString +=
                '${whereAnd[i].key} = \'${whereAnd[i].value}\' AND '
            : whereString +=
                '${whereAnd[i].key} = \'${whereAnd[i].value}\' AND ';
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
