import 'dart:convert';

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

  @override
  Future<List<Business>> listBusiness({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required List<String> paths,
  }) async {
    try {
      var latLng = data['location'];
      var nextPage = data['nextPage'];
      late List<Map<String, dynamic>> result;
      if (nextPage == null) {
        result = await _database.list(
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
              WhereAgregationAttribute(
                  key:
                      'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
                  value: 'true'),
              WhereNormalAttribute(key: 'isOpen', value: 'true'),
            ],
            limit: 1);
      } else {
        result = await _database.list(
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
              WhereNormalAttributeHigher(
                  key: 'name',
                  value: utf8.decode(base64.decode(data['nextPage']))),
              WhereAgregationAttribute(
                  key:
                      'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
                  value: 'true'),
              WhereNormalAttribute(key: 'isOpen', value: 'true'),
            ],
            limit: 1);
      }
      List<Business> response = [];
      for (var e in result) {
        response.add(Business(
            id: e[_table]['id'],
            name: e[_table]['name'],
            description: e[_table]['description'],
            isOpen: e[_table]['isOpen'],
            businessBrandFk: e[_table]['businessBrandFk'],
            deliveryPrice: e[_table]['deliveryPrice'],
            homeDelivery: e[_table]['homeDelivery'],
            leadDayTime: e[_table]['leadDayTime'],
            leadHoursTime: e[_table]['leadHoursTime'],
            leadMinutesTime: e[_table]['leadMinutesTime'],
            municipalityFk: e[_table]['municipalityFk'],
            provinceFk: e[_table]['provinceFk'],
            toPickUp: e[_table]['toPickUp'],
            address: e[_table]['address'],
            phone: e[_table]['phone'],
            email: e[_table]['email'],
            photo: e[_table]['photo'],
            photoUrl: e[_table]['photoUrl'],
            // polygon: parsePolygon(e['']['polygon'][0]),
            distance: e['']['distance'],
            coordinates: Point(
                latitude: e['']['latitude'], longitude: e['']['longitude'])));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
