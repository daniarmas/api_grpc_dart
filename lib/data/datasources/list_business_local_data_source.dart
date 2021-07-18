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
      '"Business".id',
      '"Business".name',
      'ST_X("Business"."coordinates") AS longitude',
      'ST_Y("Business"."coordinates") AS latitude',
      'ST_AsGeoJSON("Business"."polygon") :: json->\'coordinates\' AS polygon'
    ]);
    List<Polygon> list = [];
    result[0]['']['polygon'].forEach((element) {
      element.forEach((elem) {
        list.add(Polygon(coordinates: [elem[0], elem[1]]));
      });
    });
    return Right(result.map((e) {
      return Business(
          id: e['Business']['id'],
          name: e['Business']['name'],
          polygon: list,
          coordinates: LatLng(
              latitude: e['']['latitude'], longitude: e['']['longitude']));
    }));
  }
}
