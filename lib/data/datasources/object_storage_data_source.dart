import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:minio/minio.dart';

import '../../environment.dart';

// ignore: one_member_abstracts
abstract class ObjectStorageDataSource {
  Future<String> presignedPutObject(String bucket, String object,
      {int? expires});
}

@Injectable(as: ObjectStorageDataSource)
class MinioObjectStorageDataSource implements ObjectStorageDataSource {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
  static final minio = Minio(
      endPoint: _environment.objectStorageEndpoint,
      accessKey: _environment.objectStorageAccessKey,
      secretKey: _environment.objectStorageSecretKey,
      port: _environment.objectStoragePort,
      useSSL: !_environment.debug);

  @override
  Future<String> presignedPutObject(String bucket, String object,
      {int? expires}) async {
    try {
      final url = await minio.presignedPutObject(bucket, object);
      if (!_environment.debug) {
        List<String> strings = url.split('/');
        return '${strings[0]}//${strings[2]}/${_environment.objectStoragePathPrefix}/${strings[3]}/${strings[4]}';
      }
      return url;
    } catch (error) {
      rethrow;
    }
  }
}
