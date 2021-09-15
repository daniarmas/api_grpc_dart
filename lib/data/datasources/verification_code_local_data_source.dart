import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

import '../../protos/protos/main.pb.dart';
import '../../core/utils/string_utils.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeLocalDataSource {
  Future<VerificationCode> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<VerificationCode>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required List<String> paths});
  Future<List<VerificationCode>> listVerificationCodeReturnIds(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});

  Future<VerificationCode> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required String id,
      required List<String> paths});
  Future<void> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
  Future<bool> deleteVerificationCodeBeforeCreateVerificationCode(
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
          paths: paths);
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
  Future<List<VerificationCode>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required List<String> paths}) async {
    try {
      List<VerificationCode> response = [];
      final result = await _database.list(
          context: context,
          table: 'VerificationCode',
          attributes: paths,
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
  Future<List<VerificationCode>> listVerificationCodeReturnIds(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      List<VerificationCode> response = [];
      final result = await _database.list(
          context: context,
          table: 'VerificationCode',
          attributes: [
            'id',
          ],
          where: [
            WhereNormalAttribute(key: 'type', value: data['type']),
            WhereNormalAttribute(key: 'deviceId', value: data['deviceId'])
          ],
          limit: 100);
      for (var e in result) {
        response.add(VerificationCode(id: e['VerificationCode']['id']));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VerificationCode> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required String id,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'VerificationCode',
          where: [
            WhereNormalAttribute(key: 'id', value: id),
          ],
          attributes: paths);
      return VerificationCode(
          id: result['VerificationCode']['id'],
          code: result['VerificationCode']['code'],
          email: result['VerificationCode']['email'],
          type:
              parseVerificationCodeTypeEnum(result['VerificationCode']['type']),
          deviceId: result['VerificationCode']['deviceId']);
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
          where: [WhereNormalAttribute(key: 'id', value: data['id'])]);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteVerificationCodeBeforeCreateVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await _database
          .delete(context: context, table: 'VerificationCode', where: [
        WhereNormalAttribute(key: 'type', value: data['type']),
        WhereNormalAttribute(key: 'deviceId', value: data['deviceId'])
      ]);
      return true;
    } catch (error) {
      rethrow;
    }
  }
}

VerificationCodeType parseVerificationCodeTypeEnum(String? value) {
  if (value == 'CHANGE_USER_EMAIL') {
    return VerificationCodeType.CHANGE_USER_EMAIL;
  } else if (value == 'SIGN_IN') {
    return VerificationCodeType.SIGN_IN;
  } else if (value == 'SIGN_UP') {
    return VerificationCodeType.SIGN_UP;
  } else {
    return VerificationCodeType.UNSPECIFIED;
  }
}
