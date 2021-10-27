import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class AuthorizationTokenLocalDataSource {
  Future<AuthorizationToken> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<AuthorizationToken>> listAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required List<Attribute> paths,
      required Map<String, dynamic> data});

  Future<AuthorizationToken?> getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
  Future<void> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: AuthorizationTokenLocalDataSource)
class AuthorizationTokenLocalDataSourceImpl
    implements AuthorizationTokenLocalDataSource {
  final Database _database;
  final String _table = 'AuthorizationToken';

  AuthorizationTokenLocalDataSourceImpl(this._database);

  @override
  Future<AuthorizationToken> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context, table: _table, data: data, attributes: paths);
      return AuthorizationToken(
          id: result['id'],
          authorizationToken: result['authorizationToken'],
          refreshTokenFk: result['refreshTokenFk'],
          app: parseAppTypeEnum(result['app']),
          appVersion: result['appVersion'],
          deviceFk: result['deviceFk'],
          userFk: result['userFk'],
          valid: result['valid'],
          createTime: (result['createTime'] != null)
              ? result['createTime'].toString()
              : null,
          updateTime: (result['updateTime'] != null)
              ? result['updateTime'].toString()
              : null);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<AuthorizationToken>> listAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthorizationToken?> getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      final result = await _database.get(
        context: context,
        table: _table,
        where: getWhereNormalAttributeList(data),
        attributes: paths,
      );
      if (result != null) {
        return AuthorizationToken(
            id: result[_table]['id'],
            authorizationToken: result[_table]['authorizationToken'],
            refreshTokenFk: result[_table]['refreshTokenFk'],
            appVersion: result[_table]['appVersion'],
            app: parseAppTypeEnum(result[_table]['app']),
            userFk: result[_table]['userFk'],
            valid: result[_table]['valid'],
            deviceFk: result[_table]['deviceFk'],
            createTime: (result[_table]['createTime'] != null)
                ? result[_table]['createTime'].toString()
                : null,
            updateTime: (result[_table]['updateTime'] != null)
                ? result[_table]['updateTime'].toString()
                : null);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await _database.delete(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }
}
