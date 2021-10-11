import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class BusinessLocalDataSource {
  Future<List<Business>> listBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<Business?> getBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
}

@Injectable(as: BusinessLocalDataSource)
class BusinessLocalDataSourceImpl implements BusinessLocalDataSource {
  final Database _database;
  static final String _table = 'Business';

  BusinessLocalDataSourceImpl(this._database);

  @override
  Future<Business?> getBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return Business(
          id: result['id'],
          name: result['name'],
          email: result['email'],
          address: result['address'],
          coordinates: null,
          deliveryPrice: result['deliveryPrice'],
          description: result['description'],
          homeDelivery: result['homeDelivery'],
          isOpen: result['isOpen'],
          leadDayTime: result['leadDayTime'],
          leadHoursTime: result['leadHoursTime'],
          leadMinutesTime: result['leadMinutesTime'],
          phone: result['phone'],
          photo: result['photo'],
          photoUrl: result['photoUrl'],
          polygon: null,
          provinceFk: result['provinceFk'],
          municipalityFk: result['municipalityFk'],
          businessBrandFk: result['businessBrandFk'],
          toPickUp: result['toPickUp'],
        );
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<Business>> listBusiness(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      List<Business> response = [];
      final result = await _database.list(
          context: context,
          table: _table,
          attributes: paths,
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var result in result) {
        response.add(Business(
          id: result['id'],
          name: result['name'],
          email: result['email'],
          address: result['address'],
          coordinates: null,
          deliveryPrice: result['deliveryPrice'],
          description: result['description'],
          homeDelivery: result['homeDelivery'],
          isOpen: result['isOpen'],
          leadDayTime: result['leadDayTime'],
          leadHoursTime: result['leadHoursTime'],
          leadMinutesTime: result['leadMinutesTime'],
          phone: result['phone'],
          photo: result['photo'],
          photoUrl: result['photoUrl'],
          polygon: null,
          provinceFk: result['provinceFk'],
          municipalityFk: result['municipalityFk'],
          businessBrandFk: result['businessBrandFk'],
          toPickUp: result['toPickUp'],
        ));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
