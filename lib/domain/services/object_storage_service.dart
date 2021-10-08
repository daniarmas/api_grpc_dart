import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/domain/repositories/object_storage_repository.dart';
import 'package:api_grpc_dart/protos/protos/main.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../environment.dart';

class ObjectStorageService extends ObjectStorageServiceBase {
  @override
  Future<GetPresignedPutUserAvatarResponse> getPresignedPutObjectUserAvatar(
      ServiceCall call, GetPresignedPutUserAvatarRequest request) async {
    try {
      if (request.objectName == '') {
        throw GrpcError.invalidArgument('Input `objectName` invalid');
      }
      final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
      late GetPresignedPutUserAvatarResponse response;
      ObjectStorageRepository objectStorageRepository =
          GetIt.I<ObjectStorageRepository>();
      late Either<GrpcError, String> result;
      result = await objectStorageRepository.presignedPutObject(
          bucket: _environment.objectStorageUserAvatarBucket,
          metadata: HeadersMetadata.fromServiceCall(call),
          object: request.objectName,
          paths: []);
      result.fold(
          (left) => {throw left},
          (right) =>
              {response = GetPresignedPutUserAvatarResponse(objectUrl: right)});
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }
}
