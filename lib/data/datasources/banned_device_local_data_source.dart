import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';

import '../../protos/protos/main.pb.dart';

abstract class BannedDeviceLocalDataSource {
  Future<BannedDevice> createBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<BannedDevice>> listBannedDevice(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<BannedDevice?> getBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});
  Future<void> deleteBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: BannedDeviceLocalDataSource)
class BannedDeviceLocalDataSourceImpl implements BannedDeviceLocalDataSource {
  final Database _database;

  BannedDeviceLocalDataSourceImpl(this._database);

  @override
  Future<BannedDevice> createBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) {
    // TODO: implement createBannedDevice
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) {
    // TODO: implement deleteBannedDevice
    throw UnimplementedError();
  }

  @override
  Future<BannedDevice?> getBannedDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'BannedDevice',
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return BannedDevice(
          id: result['BannedDevice']['id'] ?? '',
          description: result['BannedDevice']['description'] ?? '',
          deviceFk: result['BannedDevice']['deviceFk'] ?? '',
          deviceId: result['BannedDevice']['deviceId'] ?? '',
          moderatorAuthorizationTokenFk:
              result['BannedDevice']['moderatorAuthorizationTokenFk'] ?? '',
        );
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<BannedDevice>> listBannedDevice(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data}) {
    // TODO: implement listBannedDevice
    throw UnimplementedError();
  }
}
