import 'package:postgres_dao/postgres_dao.dart';

import 'where.dart';

String constructSqlQueryDelete({
  required String table,
  List<Where>? where,
}) {
  // Where
  String whereResult = '';
  whereResult = parseWhere(table: table, where: where);
  return 'DELETE '
      'FROM "$table" '
      '$whereResult'
      'RETURNING "$table"."id"';
}
