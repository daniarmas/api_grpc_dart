// Package imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/parse.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import '../../protos/protos/main.pb.dart';

abstract class OrderLocalDataSource {
  Future<List<Order>> listOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<Order?> getOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
}

@Injectable(as: OrderLocalDataSource)
class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final Database _database;
  final String _table = 'Order';

  OrderLocalDataSourceImpl(this._database);

  @override
  Future<Order?> getOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> listOrder(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths}) async {
    try {
      List<Where> where = [
        WhereNormalAttributeEqual(key: 'userFk', value: data['userFk']),
      ];
      if (data['nextPage'] != null) {
        where.add(WhereNormalAttributeHigher(
            key: 'createTime', value: data['nextPage']));
      }
      List<Attribute> listPath = [];
      listPath.addAll(paths);
      late List<Map<String, dynamic>> result;
      result = await _database.list(
          context: context,
          table: _table,
          attributes: paths,
          agregationMethods: [
            'ST_X("Order"."coordinates") AS longitude',
            'ST_Y("Order"."coordinates") AS latitude',
          ],
          orderByAsc: 'createTime',
          where: where,
          limit: 5);
      List<Order> response = [];
      for (var item in result) {
        response.add(Order(
            id: item[_table]['id'],
            businessFk: item[_table]['businessFk'],
            appVersion: item[_table]['appVersion'],
            buildingNumber: item[_table]['buildingNumber'],
            coordinates: Point(
              latitude: item['']['latitude'],
              longitude: item['']['longitude'],
            ),
            deliveryDate: (item[_table]['deliveryDate'] != null)
                ? item[_table]['deliveryDate'].toString()
                : null,
            deliveryType: parseDeliveryTypeEnum(item[_table]['deliveryType']),
            deviceFk: item[_table]['deviceFk'],
            houseNumber: item[_table]['houseNumber'],
            residenceType:
                parseResidenceTypeEnum(item[_table]['residenceType']),
            status: parseOrderStatusTypeEnum(item[_table]['status']),
            userFk: item[_table]['userFk'],
            price: item[_table]['price'],
            createTime: (item[_table]['createTime'] != null)
                ? item[_table]['createTime'].toString()
                : null,
            updateTime: (item[_table]['updateTime'] != null)
                ? item[_table]['updateTime'].toString()
                : null));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
