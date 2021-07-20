import 'package:postgres_dao/attribute.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where_attribute.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

import '../../environment.dart';
import '../../injection_container.dart' as sl;
import 'database.dart';

class PostgresqlDatabase implements Database {
  static final Environment _environment = sl.serviceLocator();
  static final _connection = PostgresqlDao(
      host: _environment.databaseHost,
      port: _environment.databasePort,
      database: _environment.databaseDatabase,
      username: _environment.databaseUsername,
      password: _environment.databasePassword);

  @override
  Future<bool> connect() async {
    try {
      return _connection.connect();
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
      List<String>? attributes,
      List<String>? agregationMethods,
      int? limit,
      List<WhereAttribute>? where,
      String? orderByAsc}) async {
    return _connection.list(
        limit: limit,
        where: where,
        table: table,
        attributes: attributes,
        agregationAttributes: agregationMethods,
        orderByAsc: orderByAsc);
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
