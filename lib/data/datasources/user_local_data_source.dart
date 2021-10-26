import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class UserLocalDataSource {
  Future<User> createUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<User>> listUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});

  Future<List<User>> listUserInAliases(
      {required PostgreSQLExecutionContext context,
      required List<String> data,
      required List<Attribute> paths});

  Future<User?> getUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<Attribute> paths});
  Future<void> deleteUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Database _database;
  final String _table = 'User';

  UserLocalDataSourceImpl(this._database);
  @override
  Future<User> createUser(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context, table: _table, data: data, attributes: paths);
      String? photo = result['photo'];
      return User(
          id: result['id'],
          email: result['email'],
          fullName: result['fullName'],
          alias: result['alias'],
          birthday: (result['birthday'] != null)
              ? result['birthday'].toString()
              : null,
          photo: result['photo'],
          photoUrl: (photo != null && photo.isNotEmpty)
              ? 'https://192.168.1.3/oss/$photo'
              : null,
          createTime: (result['createTime'] != null)
              ? result['createTime'].toString()
              : null,
          updateTime: (result['updateTime'] != null)
              ? result['updateTime'].toString()
              : null);
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
      required List<Attribute> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: _table,
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        String? photo = result[_table]['photo'];
        return User(
            id: result[_table]['id'],
            email: result[_table]['email'],
            fullName: result[_table]['fullName'],
            alias: result[_table]['alias'],
            birthday: (result[_table]['birthday'] != null)
                ? result[_table]['birthday'].toString()
                : null,
            photo: result[_table]['photo'],
            photoUrl: (photo != null && photo.isNotEmpty)
                ? 'https://192.168.1.3/oss/$photo'
                : null,
            createTime: (result[_table]['createTime'] != null)
                ? result[_table]['createTime'].toString()
                : null,
            updateTime: (result[_table]['updateTime'] != null)
                ? result[_table]['updateTime'].toString()
                : null);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<User>> listUser(
      {required PostgreSQLExecutionContext context,
      required List<Attribute> paths,
      required Map<String, dynamic> data}) async {
    try {
      List<User> response = [];
      final result = await _database.list(
          context: context,
          table: _table,
          attributes: paths,
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var e in result) {
        String? photo = e['photo'];
        response.add(User(
            id: e['id'],
            email: e['email'],
            fullName: e['fullName'],
            alias: e['alias'],
            birthday: (e['birthday'] != null) ? e['birthday'].toString() : null,
            photo: e['photo'],
            photoUrl: (photo != null && photo.isNotEmpty)
                ? 'https://192.168.1.3/oss/$photo'
                : null,
            createTime:
                (e['createTime'] != null) ? e['createTime'].toString() : null,
            updateTime:
                (e['updateTime'] != null) ? e['updateTime'].toString() : null));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<User>> listUserInAliases(
      {required PostgreSQLExecutionContext context,
      required List<String> data,
      required List<Attribute> paths}) async {
    try {
      List<User> response = [];
      final result = await _database.list(
          context: context,
          table: _table,
          attributes: paths,
          where: [WhereNormalAttributeIn(key: 'alias', value: data)],
          limit: 100);
      for (var e in result) {
        String? photo = e['photo'];
        response.add(User(
            id: e['id'],
            email: e['email'],
            fullName: e['fullName'],
            alias: e['alias'],
            birthday: (e['birthday'] != null) ? e['birthday'].toString() : null,
            photo: e['photo'],
            photoUrl: (photo != null && photo.isNotEmpty)
                ? 'https://192.168.1.3/oss/$photo'
                : null,
            createTime:
                (e['createTime'] != null) ? e['createTime'].toString() : null,
            updateTime:
                (e['updateTime'] != null) ? e['updateTime'].toString() : null));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
