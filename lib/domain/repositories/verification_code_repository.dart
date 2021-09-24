import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';

import '../../protos/protos/main.pb.dart';

abstract class VerificationCodeRepository {
  Future<Either<GrpcError, VerificationCode>> createVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths});
  Future<Either<GrpcError, Iterable<VerificationCode>>> listVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths});
  Future<Either<GrpcError, VerificationCode>> getVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths});
  Future<Either<GrpcError, void>> deleteVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata});
  Future<Either<GrpcError, VerificationCode>> updateVerificationCode(
      {required PostgreSQLExecutionContext context,
      required Map<String, dynamic> data,
      required HeadersMetadata metadata,
      required List<String> paths});
}
