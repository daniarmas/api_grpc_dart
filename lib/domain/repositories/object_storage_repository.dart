import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres_dao/postgres_dao.dart';

// ignore: one_member_abstracts
abstract class ObjectStorageRepository {
  Future<Either<GrpcError, String>> presignedPutObject(
      {required String bucket,
      required String object,
      required HeadersMetadata metadata,
      required List<Attribute> paths});
}
