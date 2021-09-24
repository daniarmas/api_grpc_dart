import 'package:api_grpc_dart/core/utils/parse_enums.dart';
import 'package:api_grpc_dart/core/utils/string_utils.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/get_where_list.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class DeviceLocalDataSource {
  Future<Device> createDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<List<Device>> listDevice(
      {required PostgreSQLExecutionContext context,
      required List<String> paths,
      required Map<String, dynamic> data});

  Future<Device?> getDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths});

  Future<Device?> updateDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required Map<String, dynamic> where,
      required List<String> paths});

  Future<void> deleteDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data});
}

@Injectable(as: DeviceLocalDataSource)
class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
  final Database _database;

  DeviceLocalDataSourceImpl(this._database);

  @override
  Future<Device> createDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.create(
          context: context, table: 'Device', data: data, attributes: paths);
      return Device(
          id: result['id'],
          deviceId: result['deviceId'],
          model: result['model'],
          firebaseCloudMessagingId: result['firebaseCloudMessagingId'],
          platform: parsePlatformTypeEnum(result['platform']),
          systemVersion: result['systemVersion'],
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
  Future<List<Device>> listDevice({
    required PostgreSQLExecutionContext context,
    required List<String> paths,
    required Map<String, dynamic> data,
  }) async {
    try {
      List<Device> response = [];
      final result = await _database.list(
          context: context,
          table: 'Device',
          attributes: paths,
          where: getWhereNormalAttributeList(data),
          limit: 100);
      for (var item in result) {
        response.add(Device(
            id: item['id'],
            deviceId: item['deviceId'],
            firebaseCloudMessagingId: item['firebaseCloudMessagingId'],
            model: item['model'],
            platform: parsePlatformTypeEnum(item['platform']),
            systemVersion: item['systemVersion'],
            createTime: (item['createTime'] != null)
                ? item['createTime'].toString()
                : null,
            updateTime: (item['updateTime'] != null)
                ? item['updateTime'].toString()
                : null));
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Device?> getDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required List<String> paths}) async {
    try {
      final result = await _database.get(
          context: context,
          table: 'Device',
          where: getWhereNormalAttributeList(data),
          attributes: paths);
      if (result != null) {
        return Device(
            id: result['id'],
            deviceId: result['deviceId'],
            firebaseCloudMessagingId: result['firebaseCloudMessagingId'],
            model: result['model'],
            platform: parsePlatformTypeEnum(result['platform']),
            systemVersion: result['systemVersion'],
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
  Future<void> deleteDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data}) async {
    try {
      await _database.delete(
          context: context,
          table: 'Device',
          where: getWhereNormalAttributeList(data));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Device?> updateDevice(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required Map<String, dynamic> where,
      required List<String> paths}) async {
    try {
      final result = await _database.update(
          context: context,
          table: 'Device',
          data: data,
          where: getWhereNormalAttributeList(where),
          attributes: paths);
      if (result != null) {
        return Device(
            id: result['id'],
            firebaseCloudMessagingId: result['firebaseCloudMessagingId'],
            model: result['model'],
            systemVersion: result['systemVersion'],
            platform: parsePlatformTypeEnum(result['platform']),
            deviceId: result['deviceId'],
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
}
