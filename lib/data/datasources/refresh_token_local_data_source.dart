import 'package:api_grpc_dart/core/utils/parse_enums.dart';
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
        id: result['id'] ?? '',
        expirationTime: result['expirationTime'] ?? '',
        refreshToken: result['refreshToken'] ?? '',
        userFk: result['userFk'] ?? '',
        valid: result['valid'] ?? '',
      );
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
            id: result['RefreshToken']['id'] ?? '',
            userFk: result['RefreshToken']['userFk'] ?? '',
            expirationTime: result['RefreshToken']['expirationTime'] ?? '',
            refreshToken: result['RefreshToken']['refreshToken'] ?? '',
            valid: result['RefreshToken']['valid'] ?? null);
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
