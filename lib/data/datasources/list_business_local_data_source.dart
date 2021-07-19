import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../injection_container.dart' as sl;
import '../../protos/protos/main.pb.dart';
import '../database/database.dart';

// ignore: one_member_abstracts
abstract class ListBusinessLocalDataSource {
  Future<Either<Failure, Iterable<Business>>> listBusiness();
}

class ListBusinessLocalDataSourceImpl implements ListBusinessLocalDataSource {
  final Database _database = sl.serviceLocator();

  @override
  Future<Either<Failure, Iterable<Business>>> listBusiness() async {
    final result = await _database.list(table: 'Business', attributes: [
      '"Business"."id"',
      '"Business"."name"',
      '"Business"."description"',
      '"Business"."address"',
      '"Business"."phone"',
      '"Business"."email"',
      '"Business"."photo"',
      '"Business"."photoUrl"',
      'ST_X("Business"."coordinates") AS longitude',
      'ST_Y("Business"."coordinates") AS latitude',
      'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon'
    ], whereAnd: [
      WhereAttribute(key: 'name', value: 'Kadis Varadero'),
      WhereAttribute(key: 'phone', value: '45567899')
    ], limit: 10);
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
          polygon: parsePolygon(result[0]['']['polygon']),
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
