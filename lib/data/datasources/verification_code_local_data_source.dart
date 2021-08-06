import 'package:api_grpc_dart/data/database/database.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class VerificationCodeLocalDataSource {
  Future<Either<Failure, VerificationCode>> createVerificationCode(
      {required Map<String, dynamic> data});

  Future<Either<Failure, Iterable<VerificationCode>>> listVerificationCode();
}

@Injectable(as: VerificationCodeLocalDataSource)
class VerificationCodeLocalDataSourceImpl
    implements VerificationCodeLocalDataSource {
  final Database _database;

  VerificationCodeLocalDataSourceImpl(this._database);

  @override
  Future<Either<Failure, VerificationCode>> createVerificationCode(
      {required Map<String, dynamic> data}) async {
    final result =
        await _database.create(table: 'VerificationCodeTest', data: data);
    return Right(VerificationCode(
        id: result['id'],
        code: result['code'],
        deviceId: result['deviceId'],
        type: parseVerificationCodeTypeEnum(result['type'])));
  }

  @override
  Future<Either<Failure, Iterable<VerificationCode>>>
      listVerificationCode() async {
    final result = await _database.list(
        table: 'VerificationCodeTest',
        attributes: [
          'id',
          'code',
          'type',
          'deviceId',
        ],
        limit: 100);
    return Right(result.map((e) {
      return VerificationCode(
          id: e['VerificationCodeTest']['id'],
          code: e['VerificationCodeTest']['code'],
          type:
              parseVerificationCodeTypeEnum(e['VerificationCodeTest']['type']),
          deviceId: e['VerificationCodeTest']['deviceId']);
    }));
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
