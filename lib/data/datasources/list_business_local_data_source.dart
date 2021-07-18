import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../core/error/failure.dart';
import '../../protos/protos/main.pb.dart';
import '../database/database.dart';

// ignore: one_member_abstracts
abstract class ListBusinessLocalDataSource {
  Future<Either<Failure, Iterable<Business>>> listBusiness();
}

class ListBusinessLocalDataSourceImpl implements ListBusinessLocalDataSource {
  @override
  Future<Either<Failure, Iterable<Business>>> listBusiness() async {
    var database = GetIt.I<Database>();
    final result = await database.list(table: 'Business');
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
