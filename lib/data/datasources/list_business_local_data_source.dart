import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../core/error/failure.dart';
import '../../protos/main.pb.dart';
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
    return Right(
        result.map((e) => Business()..mergeFromProto3Json(e['Business'])));
  }
}
