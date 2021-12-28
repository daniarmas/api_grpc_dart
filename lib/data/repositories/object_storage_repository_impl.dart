// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/datasources/object_storage_data_source.dart';
import 'package:api_grpc_dart/domain/repositories/object_storage_repository.dart';
import '../../protos/protos/main.pb.dart';

@Injectable(as: ObjectStorageRepository)
class ObjectStorageRepositoryImpl implements ObjectStorageRepository {
  late ObjectStorageDataSource objectStorageDataSource;

  ObjectStorageRepositoryImpl({required this.objectStorageDataSource});

  @override
  Future<Either<GrpcError, GetPresignedPutUserAvatarResponse>>
      presignedPutObject(
          {required String bucket,
          required String object,
          required HeadersMetadata metadata,
          required List<Attribute> paths}) async {
    try {
      final result =
          await objectStorageDataSource.presignedPutObject(bucket, object);
      return Right(GetPresignedPutUserAvatarResponse(
        highQualityPhoto: result[0],
        lowQualityPhoto: result[1],
        thumbnailPhoto: result[2],
        highQualityPhotoName: result[3],
        lowQualityPhotoName: result[4],
        thumbnailPhotoName: result[5],
      ));
    } on GrpcError catch (error) {
      return Left(error);
    } on Exception {
      return Left(GrpcError.internal('Internal server error'));
    }
  }
}
