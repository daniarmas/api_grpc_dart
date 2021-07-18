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
      List<String>? attributes,
      int? limit,
      List<WhereAttribute>? where}) async {
    String query = constructSqlQuery(
        limit: limit, where: where, table: table, attributes: attributes);
    print(query);
    return _connection.mappedResultsQuery(query);
  }

  String constructSqlQuery({
    required String table,
    List<String>? attributes,
    int? limit,
    List<WhereAttribute>? where,
  }) {
    String whereResult = '';
    String attributesResult = '*';
    String limitResult = limit != null ? 'LIMIT $limit;' : '';
    if (where != null && where.isNotEmpty) {
      String whereString = '';
      for (int i = 0; i < where.length; i++) {
        if (i == where.length - 1) {
          whereString += '"$table".${where[i].key} = \'${where[i].value}\' ';
        } else {
          whereString += '"$table".${where[i].key} = \'${where[i].value}\' AND ';
        }
      }
      whereResult = 'WHERE $whereString';
    }
    if (attributes != null && attributes.isNotEmpty) {
      attributesResult = '';
      for (int i = 0; i < attributes.length; i++) {
        if (i == attributes.length - 1) {
          attributesResult += '${attributes[i]} ';
        } else {
          attributesResult += '${attributes[i]}, ';
        }
      }
    }
    return 'SELECT $attributesResult '
        'FROM "$table" '
        '$whereResult'
        '$limitResult';
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
