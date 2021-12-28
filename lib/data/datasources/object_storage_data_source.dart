// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:minio/minio.dart';

// Project imports:
import '../../environment.dart';

// ignore: one_member_abstracts
abstract class ObjectStorageDataSource {
  Future<List<String>> presignedPutObject(String bucket, String object,
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
  Future<List<String>> presignedPutObject(String bucket, String object,
      {int? expires}) async {
    try {
      List<String> response = [];
      // High Photo
      await Future.delayed(Duration(milliseconds: 10));
      List<String> highPhotoStringsName = object.split('.');
      String highPhotoStringsFinalName =
          highPhotoStringsName.first + '_high.' + highPhotoStringsName.last;
      final highPhotoUrl =
          await minio.presignedPutObject(bucket, highPhotoStringsFinalName);
      List<String> highPhotoStrings = highPhotoUrl.split('/');
      response.add('${highPhotoStrings[3]}/${highPhotoStrings[4]}');
      // Low Photo
      await Future.delayed(Duration(milliseconds: 10));
      List<String> lowPhotoStringsName = object.split('.');
      String lowPhotoStringsFinalName =
          lowPhotoStringsName.first + '_low.' + lowPhotoStringsName.last;
      final lowPhotoUrl =
          await minio.presignedPutObject(bucket, lowPhotoStringsFinalName);
      List<String> lowPhotoStrings = lowPhotoUrl.split('/');
      response.add('${lowPhotoStrings[3]}/${lowPhotoStrings[4]}');
      // Thumbnail Photo
      await Future.delayed(Duration(milliseconds: 10));
      List<String> thumbnailPhotoStringsName = object.split('.');
      String thumbnailPhotoStringsFinalName = thumbnailPhotoStringsName.first +
          '_thumbnail.' +
          thumbnailPhotoStringsName.last;
      final thumbnailPhotoUrl = await minio.presignedPutObject(
          bucket, thumbnailPhotoStringsFinalName);
      List<String> thumbnailPhotoStrings = thumbnailPhotoUrl.split('/');
      response.add('${thumbnailPhotoStrings[3]}/${thumbnailPhotoStrings[4]}');
      response.add(highPhotoStringsFinalName);
      response.add(lowPhotoStringsFinalName);
      response.add(thumbnailPhotoStringsFinalName);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
