import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:postgres/postgres.dart';
import 'package:postgres_dao/postgres_dao.dart';

import '../../protos/protos/main.pb.dart';

abstract class VerificationCodeRepository {
  Future<Either<GrpcError, CreateVerificationCodeResponse>>
      createVerificationCode({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<String> paths,
  });
  Future<Either<GrpcError, ListVerificationCodeResponse>> listVerificationCode({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, GetVerificationCodeResponse>> getVerificationCode({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
  Future<Either<GrpcError, void>> deleteVerificationCode({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
  });
  Future<Either<GrpcError, UpdateVerificationCodeResponse>>
      updateVerificationCode({
    required PostgreSQLExecutionContext context,
    required Map<String, dynamic> data,
    required HeadersMetadata metadata,
    required List<Attribute> paths,
  });
}
