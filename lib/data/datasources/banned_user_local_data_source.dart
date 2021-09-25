import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';

import '../../protos/protos/main.pb.dart';

abstract class BannedUserLocalDataSource {
  Future<BannedUser> createBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<BannedUser>> listBannedUser(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<BannedUser?> getBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<void> deleteBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: BannedUserLocalDataSource)
class BannedUserLocalDataSourceImpl implements BannedUserLocalDataSource {
  final Database _database;

  BannedUserLocalDataSourceImpl(this._database);

  @override
  Future<BannedUser> createBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) {
    // TODO: implement createBannedUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) {
    // TODO: implement deleteBannedUser
    throw UnimplementedError();
  }

  @override
  Future<BannedUser?> getBannedUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'BannedUser',
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return BannedUser(
            id: result['id'],
            description: result['description'],
            moderatorAuthorizationTokenFk:
                result['moderatorAuthorizationTokenFk'],
            userFk: result['userFk'],
            email: result['email'],
            createTime: (result['createTime'] != null)
                ? result['createTime'].toString()
                : null,
            updateTime: (result['updateTime'] != null)
                ? result['updateTime'].toString()
                : null);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<BannedUser>> listBannedUser(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data}) {
    // TODO: implement listBannedUser
    throw UnimplementedError();
  }
}