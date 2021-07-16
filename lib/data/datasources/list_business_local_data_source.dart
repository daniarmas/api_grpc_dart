import 'package:api_grpc_dart/core/error/failure.dart';
import 'package:api_grpc_dart/data/database/postgresql.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class ListBusinessLocalDataSource {
  Future<Either<Failure, Iterable<Business>>> listBusiness();
}

class ListBusinessLocalDataSourceImpl implements ListBusinessLocalDataSource {
  @override
  Future<Either<Failure, Iterable<Business>>> listBusiness() async {
    var connection = GetIt.I<PostgresqlDatabase>();
    final result = await connection.list(table: 'Business');
    return Right(
        result.map((e) => Business()..mergeFromProto3Json(e['Business'])));
  }
}
