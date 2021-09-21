import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class AuthorizationTokenLocalDataSource {
  Future<AuthorizationToken> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<List<AuthorizationToken>> listAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});
  Future<AuthorizationToken>? getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  void deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: AuthorizationTokenLocalDataSource)
class AuthorizationTokenLocalDataSourceImpl
    implements AuthorizationTokenLocalDataSource {
  final Database _database;

  AuthorizationTokenLocalDataSourceImpl(this._database);

  @override
  Future<AuthorizationToken> createAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context,
          table: 'AuthorizationToken',
          data: data,
          attributes: paths);
      return AuthorizationToken(
        id: result['id'],
        authorizationToken: result['authorizationToken'],
        refreshTokenFk: result['refreshTokenFk'],
        app: parseAppTypeEnum(result['app']),
        appVersion: result['appVersion'],
        deviceFk: result['deviceFk'],
        userFk: result['userFk'],
        valid: result['valid'],
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<AuthorizationToken>> listAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      List<AuthorizationToken> response = [];
      final result = await _database.list(
          context: context,
          table: 'AuthorizationToken',
          attributes: [
            'id',
            'authorizationToken',
            'refreshTokenFk',
            'app',
            'appVersion',
            'deviceFk',
            'userFk',
            'valid'
          ],
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var e in result) {
        response.add(AuthorizationToken(
            id: e['AuthorizationToken']['id'],
            authorizationToken: e['AuthorizationToken']['authorizationToken'],
            refreshTokenFk: e['AuthorizationToken']['refreshTokenFk'],
            appVersion: e['AuthorizationToken']['appVersion'],
            app: parseAppTypeEnum(e['AuthorizationToken']['app']),
            userFk: e['AuthorizationToken']['userFk'],
            valid: e['AuthorizationToken']['valid'],
            deviceFk: e['AuthorizationToken']['deviceFk']));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AuthorizationToken>? getAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
        context: context,
        table: 'AuthorizationToken',
        where: getWhereNormalAttributeList(data),
        attributes: [
          'id',
          'authorizationToken',
          'refreshTokenFk',
          'app',
          'appVersion',
          'deviceFk',
          'userFk',
          'valid'
        ],
      );
      if (result != null) {
        return AuthorizationToken(
            id: result['AuthorizationToken']['id'],
            authorizationToken: result['AuthorizationToken']
                ['authorizationToken'],
            refreshTokenFk: result['AuthorizationToken']['refreshTokenFk'],
            appVersion: result['AuthorizationToken']['appVersion'],
            app: parseAppTypeEnum(result['AuthorizationToken']['app']),
            userFk: result['AuthorizationToken']['userFk'],
            valid: result['AuthorizationToken']['valid'],
            deviceFk: result['AuthorizationToken']['deviceFk']);
      }
      return Future.value(null);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAuthorizationToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      _database.delete(
          context: context,
          table: 'AuthorizationToken',
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }

  AuthorizationToken_AppType parseAppTypeEnum(String value) {
    if (value == 'APP') {
      return AuthorizationToken_AppType.APP;
    } else if (value == 'BUSINESS_APP') {
      return AuthorizationToken_AppType.BUSINESS_APP;
    } else {
      return AuthorizationToken_AppType.UNSPECIFIED;
    }
  }
}
