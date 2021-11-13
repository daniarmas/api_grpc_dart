// Package imports:
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class SessionLocalDataSource {
  Future<List<Session>> listSession(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
}

@Injectable(as: SessionLocalDataSource)
class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final Database _database;
  final String _table = 'AuthorizationToken';

  SessionLocalDataSourceImpl(this._database);

  @override
  Future<List<Session>> listSession(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      List<Session> response = [];
      var authorizationTokenFk = data['authorizationTokenFk'];
      data.removeWhere((key, value) => key == 'authorizationTokenFk');
      final result = await _database.list(
        context: context,
        table: _table,
        attributes: [
          NormalAttribute(name: 'id'),
          NormalAttribute(name: 'app'),
          NormalAttribute(name: 'appVersion'),
          NormalAttribute(name: 'deviceFk'),
          InnerAttribute(name: 'platform', innerTable: 'Device'),
          InnerAttribute(name: 'systemVersion', innerTable: 'Device'),
          InnerAttribute(name: 'model', innerTable: 'Device'),
          CaseAttribute(
              table: _table,
              whens: [
                CaseWhen(
                    attribute: NormalAttribute(name: 'id'),
                    attributeValue: authorizationTokenFk,
                    assignValue: 'true'),
              ],
              elseValue: 'false',
              name: 'actual')
        ],
        where: getWhereNormalAttributeList(data),
        innerJoin: InnerJoin(
            table: _table,
            tableValue: 'deviceFk',
            relationValue: 'id',
            relationTable: 'Device'),
      );
      for (var e in result) {
        response.add(Session(
          id: e[_table]['id'],
          app: parseAppTypeEnum(e[_table]['app']),
          appVersion: e[_table]['appVersion'],
          model: e['Device']['model'],
          platform: parsePlatformTypeEnum(e['Device']['platform']),
          systemVersion: e['Device']['systemVersion'],
          actual: (e['']['actual'] == 'true') ? true : false,
        ));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
