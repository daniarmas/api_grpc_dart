import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';

import '../../protos/protos/main.pb.dart';

abstract class UserLocalDataSource {
  Future<User> createUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<User>> listUser(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<User?> getUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<void> deleteUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Database _database;

  UserLocalDataSourceImpl(this._database);
  @override
  Future<User> createUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context, table: 'User', data: data, attributes: paths);
      String photo = result['photo'] ?? '';
      return User(
          id: result['id'] ?? '',
          email: result['email'] ?? '',
          fullName: result['fullName'] ?? '',
          legalAge: result['legalAge'],
          photo: result['photo'] ?? '',
          photoUrl: (photo != '') ? 'https://192.168.1.3/oss/$photo' : '',
          createTime: result['createTime'] ?? '',
          updateTime: result['updateTime'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User?> getUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'User',
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        String photo = result['User']['photo'] ?? '';
        return User(
            id: result['User']['id'] ?? '',
            email: result['User']['email'] ?? '',
            fullName: result['User']['fullName'] ?? '',
            legalAge: result['User']['legalAge'] ?? false,
            photo: result['User']['photo'] ?? '',
            photoUrl:
                (photo.isNotEmpty) ? 'https://192.168.1.3/oss/$photo' : '',
            createTime: result['User']['createTime'] ?? '',
            updateTime: result['User']['updateTime'] ?? '');
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<User>> listUser(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data}) {
    // TODO: implement listUser
    throw UnimplementedError();
  }
}
