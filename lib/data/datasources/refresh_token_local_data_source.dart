// Package imports:
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/data/database/database.dart';
import '../../protos/protos/main.pb.dart';

abstract class RefreshTokenLocalDataSource {
  Future<RefreshToken> createRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<List<RefreshToken>> listRefreshToken(
      {required PostgreSQLExecutionContext context,
      required List<Attribute> paths,
      required Map<String, dynamic> data});

  Future<RefreshToken?> getRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<bool> deleteRefreshToken({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    List<Where>? where,
  });
}

@Injectable(as: RefreshTokenLocalDataSource)
class RefreshTokenLocalDataSourceImpl implements RefreshTokenLocalDataSource {
  final Database _database;
  final String _table = 'RefreshToken';

  RefreshTokenLocalDataSourceImpl(this._database);

  @override
  Future<RefreshToken> createRefreshToken(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      final result = await _database.create(
          context: context, table: _table, data: data, attributes: paths);
      return RefreshToken(
          id: result['id'],
          expirationTime: result['expirationTime'].toString(),
          userFk: result['userFk'],
          deviceFk: result['deviceFk'],
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
      required List<Attribute> paths}) async {
    throw UnimplementedError();
  }

  @override
  Future<RefreshToken?> getRefreshToken(
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
        return RefreshToken(
            id: result[_table]['id'],
            userFk: result[_table]['userFk'],
            deviceFk: result[_table]['deviceFk'],
            expirationTime: (result[_table]['expirationTime'] != null)
                ? result[_table]['expirationTime'].toString()
                : null,
            valid: result[_table]['valid'],
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
  Future<bool> deleteRefreshToken({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    List<Where>? where,
  }) async {
    try {
      return await _database.delete(
          context: context,
          table: _table,
          where: (where == null) ? getWhereNormalAttributeList(data) : where);
    } catch (error) {
      rethrow;
    }
  }
}
