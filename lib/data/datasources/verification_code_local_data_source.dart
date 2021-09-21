import 'package:api_grpc_dart/core/utils/parse_enums.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class VerificationCodeLocalDataSource {
  Future<VerificationCode> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<VerificationCode>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<VerificationCode?> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<void> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: VerificationCodeLocalDataSource)
class VerificationCodeLocalDataSourceImpl
    implements VerificationCodeLocalDataSource {
  final Database _database;

  VerificationCodeLocalDataSourceImpl(this._database);

  @override
  Future<VerificationCode> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      data.addAll({'code': StringUtils.generateNumber()});
      final result = await _database.create(
          context: context,
          table: 'VerificationCode',
          data: data,
          attributes: paths);
      return VerificationCode(
          id: result['id'],
          code: result['code'],
          email: result['email'],
          deviceId: result['deviceId'],
          type: parseVerificationCodeTypeEnum(result['type']));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<VerificationCode>> listVerificationCode({
    required PostgreSQLExecutionContext context,
    required List<String> paths,
    required Map<String, dynamic> data,
  }) async {
    try {
      List<VerificationCode> response = [];
      final result = await _database.list(
          context: context,
          table: 'VerificationCode',
          attributes: paths,
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var e in result) {
        response.add(VerificationCode(
            id: e['VerificationCode']['id'],
            code: e['VerificationCode']['code'],
            email: e['VerificationCode']['email'],
            type: parseVerificationCodeTypeEnum(e['VerificationCode']['type']),
            deviceId: e['VerificationCode']['deviceId']));
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
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'VerificationCode',
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return VerificationCode(
            id: result['VerificationCode']['id'],
            code: result['VerificationCode']['code'],
            email: result['VerificationCode']['email'],
            type: parseVerificationCodeTypeEnum(
                result['VerificationCode']['type']),
            deviceId: result['VerificationCode']['deviceId']);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await _database.delete(
          context: context,
          table: 'VerificationCode',
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }
}
