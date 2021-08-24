import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeLocalDataSource {
  Future<VerificationCode> createVerificationCode(
      {required Map<String, dynamic> data});

  Future<List<VerificationCode>> listVerificationCode();

  Future<VerificationCode> getVerificationCode({required String id});
  void deleteVerificationCode({required String id});
}

@Injectable(as: VerificationCodeLocalDataSource)
class VerificationCodeLocalDataSourceImpl
    implements VerificationCodeLocalDataSource {
  final Database _database;

  VerificationCodeLocalDataSourceImpl(this._database);

  @override
  Future<VerificationCode> createVerificationCode(
      {required Map<String, dynamic> data}) async {
    final result =
        await _database.create(table: 'VerificationCode', data: data);
    return VerificationCode(
        id: result['id'],
        code: result['code'],
        deviceId: result['deviceId'],
        type: parseVerificationCodeTypeEnum(result['type']));
  }

  @override
  Future<List<VerificationCode>> listVerificationCode() async {
    List<VerificationCode> response = [];
    final result = await _database.list(
        table: 'VerificationCode',
        attributes: [
          'id',
          'code',
          'type',
          'deviceId',
        ],
        limit: 100);
    for (var e in result) {
      response.add(VerificationCode(
          id: e['VerificationCode']['id'],
          code: e['VerificationCode']['code'],
          type: parseVerificationCodeTypeEnum(e['VerificationCode']['type']),
          deviceId: e['VerificationCode']['deviceId']));
    }
    return response;
  }

  @override
  Future<VerificationCode> getVerificationCode({required String id}) async {
    try {
      final result = await _database.get(table: 'VerificationCode', where: [
        WhereNormalAttribute(key: 'id', value: id),
      ], attributes: [
        'id',
        'code',
        'type',
        'deviceId',
      ]);
      return VerificationCode(
          id: result['VerificationCode']['id'],
          code: result['VerificationCode']['code'],
          type:
              parseVerificationCodeTypeEnum(result['VerificationCode']['type']),
          deviceId: result['VerificationCode']['deviceId']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteVerificationCode({required String id}) async {
    _database.delete(
        table: 'VerificationCode',
        where: [WhereNormalAttribute(key: 'id', value: id)]);
  }
}

VerificationCodeType parseVerificationCodeTypeEnum(String value) {
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
