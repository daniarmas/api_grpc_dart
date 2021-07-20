import 'package:dartz/dartz.dart';
import 'package:postgres_dao/agregation_attribute.dart';
import 'package:postgres_dao/normal_attribute.dart';
import 'package:postgres_dao/where_agregation_attribute.dart';
import 'package:postgres_dao/where_normal_attribute.dart';

import '../../core/error/failure.dart';
import '../../injection_container.dart' as sl;
import '../../protos/protos/main.pb.dart';
import '../database/database.dart';

// ignore: one_member_abstracts
abstract class ListBusinessLocalDataSource {
  Future<Either<Failure, Iterable<Business>>> listBusiness(LatLng latLng);
}

class ListBusinessLocalDataSourceImpl implements ListBusinessLocalDataSource {
  final Database _database = sl.serviceLocator();

  @override
  Future<Either<Failure, Iterable<Business>>> listBusiness(
      LatLng latLng) async {
    String _table = 'Business';
    final result = await _database.list(
        table: _table,
        attributes: [
          NormalAttribute(name: 'id'),
          NormalAttribute(name: 'name'),
          NormalAttribute(name: 'description'),
          NormalAttribute(name: 'address'),
          NormalAttribute(name: 'phone'),
          NormalAttribute(name: 'email'),
          NormalAttribute(name: 'photo'),
          NormalAttribute(name: 'photoUrl'),
          AgregationAttribute(
              name: 'ST_X("Business"."coordinates") AS longitude'),
          AgregationAttribute(
              name: 'ST_Y("Business"."coordinates") AS latitude'),
          AgregationAttribute(
              name:
                  'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon'),
          AgregationAttribute(
              name:
                  'ST_Distance("coordinates", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326)) AS "distance"'),
        ],
        orderByAsc: 'distance',
        whereAnd: [
          WhereAgregationAttribute(
              key:
                  'ST_Contains("polygon", ST_GeomFromText(\'POINT(${latLng.longitude} ${latLng.latitude})\', 4326))',
              value: 'true'),
          WhereNormalAttribute(key: 'isOpen', value: 'true', table: 'Business'),
        ],
        limit: 10);
    return Right(result.map((e) {
      return Business(
          id: e['Business']['id'],
          name: e['Business']['name'],
          description: e['Business']['description'],
          address: e['Business']['address'],
          phone: e['Business']['phone'],
          email: e['Business']['email'],
          photo: e['Business']['photo'],
          photoUrl: e['Business']['photoUrl'],
          // polygon: parsePolygon(result[0]['']['polygon']),
          distance: e['']['distance'],
          coordinates: LatLng(
              latitude: e['']['latitude'], longitude: e['']['longitude']));
    }));
  }

  List<Polygon> parsePolygon(List<dynamic> parameter) {
    List<Polygon> list = [];
    for (var item in parameter) {
      item.forEach((elem) {
        list.add(Polygon(coordinates: [elem[0], elem[1]]));
      });
    }
    return list;
  }
}
