import 'package:api_grpc_dart/data/database/database.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeLocalDataSource {
  Future<VerificationCode> createVerificationCode(
      {required Map<String, dynamic> data});

  Future<List<VerificationCode>> listVerificationCode();
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
        await _database.create(table: 'VerificationCodeTest', data: data);
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
        table: 'VerificationCodeTest',
        attributes: [
          'id',
          'code',
          'type',
          'deviceId',
        ],
        limit: 100);
    for (var e in result) {
      response.add(VerificationCode(
          id: e['VerificationCodeTest']['id'],
          code: e['VerificationCodeTest']['code'],
          type:
              parseVerificationCodeTypeEnum(e['VerificationCodeTest']['type']),
          deviceId: e['VerificationCodeTest']['deviceId']));
    }
    return response;
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
