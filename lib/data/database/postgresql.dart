import 'package:postgres/postgres.dart';

import '../../environment.dart';
import '../../injection_container.dart' as sl;
import 'database.dart';

class PostgresqlDatabase implements Database {
  static final Environment _environment = sl.serviceLocator();
  static final _connection = PostgreSQLConnection(_environment.databaseHost,
      _environment.databasePort, _environment.databaseDatabase,
      username: _environment.databaseUsername,
      password: _environment.databasePassword);

  @override
  Future<bool> connect() async {
    try {
      await _connection.open().then((value) async {
        print('🚀 Database Server is on...');
      });
      return Future.value(true);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  dynamic create(dynamic object) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void delete(String id) {
    // TODO: implement delete
  }

  @override
  dynamic get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> list(
      {required String table,
      List<Attribute>? attributes,
      int? limit,
      List<WhereAttribute>? whereAnd,
      String? orderByAsc}) async {
    String query = constructSqlQuery(
        limit: limit,
        whereAnd: whereAnd,
        table: table,
        attributes: attributes,
        orderByAsc: orderByAsc);
    print(query);
    return _connection.mappedResultsQuery(query);
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }

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
}
