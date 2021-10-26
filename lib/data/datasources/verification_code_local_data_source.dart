import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class VerificationCodeLocalDataSource {
  Future<VerificationCode> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<VerificationCode>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<VerificationCode?> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<VerificationCode?> updateVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<bool> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: VerificationCodeLocalDataSource)
class VerificationCodeLocalDataSourceImpl
    implements VerificationCodeLocalDataSource {
  final Database _database;
  final String _table = 'VerificationCode';

  VerificationCodeLocalDataSourceImpl(this._database);

  @override
  Future<VerificationCode> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      data.addAll({'code': StringUtils.generateNumber()});
      final result = await _database.create(
          context: context, table: _table, data: data, attributes: paths);
      return VerificationCode(
          id: result['id'],
          code: result['code'],
          email: result['email'],
          deviceId: result['deviceId'],
          type: parseVerificationCodeTypeEnum(result['type']),
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
  Future<List<VerificationCode>> listVerificationCode({
    required PostgreSQLExecutionContext context,
    required List<Attribute> paths,
    required Map<String, dynamic> data,
  }) async {
    try {
      List<VerificationCode> response = [];
      final result = await _database.list(
          context: context,
          table: _table,
          attributes: paths,
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var e in result) {
        response.add(VerificationCode(
            id: e[_table]['id'],
            code: e[_table]['code'],
            email: e[_table]['email'],
            type: parseVerificationCodeTypeEnum(e[_table]['type']),
            deviceId: e[_table]['deviceId'],
            createTime: (e[_table]['createTime'] != null)
                ? e[_table]['createTime'].toString()
                : null,
            updateTime: (e[_table]['updateTime'] != null)
                ? e[_table]['updateTime'].toString()
                : null));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VerificationCode?> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return VerificationCode(
            id: result[_table]['id'],
            code: result[_table]['code'],
            email: result[_table]['email'],
            type: parseVerificationCodeTypeEnum(result[_table]['type']),
            deviceId: result[_table]['deviceId'],
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
  Future<bool> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      return await _database.delete(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VerificationCode?> updateVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      final result = await _database.update(
          context: context,
          table: _table,
          data: data,
          where: [WhereNormalAttributeEqual(key: 'id', value: data['id'])],
          attributes: paths);
      if (result != null) {
        return VerificationCode(
            id: result['id'],
            code: result['code'],
            email: result['email'],
            type: parseVerificationCodeTypeEnum(result['type']),
            deviceId: result['deviceId'],
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
}
