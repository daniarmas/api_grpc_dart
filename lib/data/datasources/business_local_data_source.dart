import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';
import 'package:postgres_dao/where_agregation_attribute.dart';

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

  // @override
  // Future<List<Business>> listBusiness(
  //     {required PostgreSQLExecutionContext context,
  //     required Map<String, dynamic> data,
  //     required List<String> paths}) async {
  //   try {
  //     List<Business> response = [];
  //     final result = await _database.list(
  //         context: context,
  //         table: _table,
  //         attributes: paths,
  //         where: getWhereNormalAttributeList(data),
  //         limit: 100);
  //     for (var result in result) {
  //       response.add(Business(
  //         id: result['id'],
  //         name: result['name'],
  //         email: result['email'],
  //         address: result['address'],
  //         coordinates: null,
  //         deliveryPrice: result['deliveryPrice'],
  //         description: result['description'],
  //         homeDelivery: result['homeDelivery'],
  //         isOpen: result['isOpen'],
  //         leadDayTime: result['leadDayTime'],
  //         leadHoursTime: result['leadHoursTime'],
  //         leadMinutesTime: result['leadMinutesTime'],
  //         phone: result['phone'],
  //         photo: result['photo'],
  //         photoUrl: result['photoUrl'],
  //         polygon: null,
  //         provinceFk: result['provinceFk'],
  //         municipalityFk: result['municipalityFk'],
  //         businessBrandFk: result['businessBrandFk'],
  //         toPickUp: result['toPickUp'],
  //       ));
  //     }
  //     return response;
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  @override
  Future<List<Business>> listBusiness({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required List<String> paths,
  }) async {
    var latLng = data['location'];
    final result = await _database.list(
        context: context,
        table: _table,
        attributes: paths,
        agregationMethods: [
          'ST_X("Business"."coordinates") AS longitude',
          'ST_Y("Business"."coordinates") AS latitude',
          'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon',
          'ST_Distance("coordinates", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) AS "distance"'
        ],
        orderByAsc: 'distance',
        where: [
          Or([
            WhereAgregationAttribute(
                key:
                    'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
                value: 'true'),
            WhereNormalAttribute(key: 'isOpen', value: 'true'),
            // WhereNormalAttributeNotIn(key: 'id', value: notIds),
          ]),
          And([
            WhereAgregationAttribute(
                key:
                    'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
                value: 'true'),
            WhereNormalAttribute(key: 'isOpen', value: 'true'),
            // WhereNormalAttributeNotIn(key: 'id', value: notIds),
          ]),
        ],
        limit: 10);
    List<Business> responseList = [];
    for (var e in result) {
      responseList.add(Business(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          address: e['address'],
          phone: e['phone'],
          email: e['email'],
          photo: e['photo'],
          photoUrl: e['photoUrl'],
          // polygon: parsePolygon(result[0]['']['polygon']),
          distance: e['distance'],
          coordinates:
              Point(latitude: e['latitude'], longitude: e['longitude'])));
    }
    var response = result.map((e) {
      return Business(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          address: e['address'],
          phone: e['phone'],
          email: e['email'],
          photo: e['photo'],
          photoUrl: e['photoUrl'],
          // polygon: parsePolygon(result[0]['']['polygon']),
          distance: e['distance'],
          coordinates:
              Point(latitude: e['latitude'], longitude: e['longitude']));
    });
    print(response.runtimeType);
    return responseList;
  }
}
