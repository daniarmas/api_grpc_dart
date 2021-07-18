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
    String whereString = '';
    String query = '';
    String attributesString = '';
    if (attributes != null && attributes.isNotEmpty) {
      for (int i = 0; i < attributes.length; i++) {
        if (i == attributes.length - 1) {
          attributesString += '${attributes[i]} ';
        } else {
          attributesString += '${attributes[i]}, ';
        }
      }
    } else {
      attributesString = '*';
    }
    query = 'SELECT $attributesString FROM "$table";';
    if (limit != null) {
      query = 'SELECT $attributesString FROM "$table" LIMIT $limit;';
    }
    if (where != null && where.isNotEmpty) {
      for (int i = 0; i < where.length; i++) {
        if (i == where.length - 1) {
          whereString += '"$table".${where[i].key} = \'${where[i].value}\' ';
        } else {
          whereString += '"$table".${where[i].key} = \'${where[i].value}\', ';
        }
      }
      query = que(
          lim: null,
          where: whereString,
          table: table,
          attributesString: attributes);
    }
    return _connection.mappedResultsQuery(query);
  }

  String que({
    required String table,
    List<String>? attributesString,
    int? lim,
    String? where,
  }) {
    String whereString = where != null ? 'WHERE $where' : '';
    String limit = lim != null ? 'LIMIT $lim;' : '';

    return 'SELECT $attributesString '
        'FROM "$table" '
        '$whereString'
        '$limit';
  }

  @override
  dynamic update(dynamic object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
