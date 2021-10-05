import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';

import '../../protos/protos/main.pb.dart';

abstract class RefreshTokenLocalDataSource {
  Future<RefreshToken> createRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<RefreshToken>> listRefreshToken(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<RefreshToken?> getRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<void> deleteRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: RefreshTokenLocalDataSource)
class RefreshTokenLocalDataSourceImpl implements RefreshTokenLocalDataSource {
  final Database _database;

  RefreshTokenLocalDataSourceImpl(this._database);

  @override
  Future<RefreshToken> createRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context,
          table: 'RefreshToken',
          data: data,
          attributes: paths);
      return RefreshToken(
          id: result['id'],
          expirationTime: result['expirationTime'].toString(),
          refreshToken: result['refreshToken'],
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
  Future<List<RefreshToken>> listRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    throw UnimplementedError();
  }

  @override
  Future<RefreshToken?> getRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
        context: context,
        table: 'RefreshToken',
        where: getWhereNormalAttributeList(data),
        attributes: paths,
      );
      if (result != null) {
        return RefreshToken(
            id: result['id'],
            userFk: result['userFk'],
            expirationTime: (result['expirationTime'] != null)
                ? result['expirationTime'].toString()
                : null,
            refreshToken: result['refreshToken'],
            valid: result['valid'],
            createTime: (result['createTime'] != null)
                ? result['createTime'].toString()
                : null,
            updateTime: (result['updateTime'] != null)
                ? result['updateTime'].toString()
                : null);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await _database.delete(
          context: context,
          table: 'RefreshToken',
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }
}
