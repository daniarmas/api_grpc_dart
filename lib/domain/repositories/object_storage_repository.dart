// Package imports:
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres_conector/postgres_conector.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/metadata.dart';
import '../../protos/protos/main.pb.dart';

// ignore: one_member_abstracts
abstract class ObjectStorageRepository {
  Future<Either<GrpcError, GetPresignedPutUserAvatarResponse>> presignedPutObject(
      {required String bucket,
      required String object,
      required HeadersMetadata metadata,
      required List<Attribute> paths});
}
