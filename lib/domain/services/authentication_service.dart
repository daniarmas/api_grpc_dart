import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/core/utils/metadata.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/sign_in_repository.dart';
import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class AuthenticationService extends AuthenticationServiceBase {
  Database database = GetIt.I<Database>();

  @override
  Future<CreateVerificationCodeResponse> createVerificationCode(
      ServiceCall call, CreateVerificationCodeRequest request) async {
    try {
      late CreateVerificationCodeResponse response;
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      late Either<GrpcError, VerificationCode> result;
      var connection = await database.getConnection();
      HeadersMetadata metadata = HeadersMetadata.fromServiceCall(call);
      await connection.transaction((context) async {
        result = await verificationCodeRepository.createVerificationCode(
            metadata: metadata,
            data: getRequestData(request, add: {'deviceId': metadata.deviceId}),
            paths: request.fieldMask.paths,
            context: context);
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response =
                    CreateVerificationCodeResponse(verificationCode: right)
              });
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<ListVerificationCodeResponse> listVerificationCode(
      ServiceCall call, ListVerificationCodeRequest request) async {
    try {
      late ListVerificationCodeResponse response;
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      late Either<GrpcError, Iterable<VerificationCode>> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.listVerificationCode(
          metadata: HeadersMetadata.fromServiceCall(call),
          paths: request.fieldMask.paths,
          context: context,
          data: getRequestData(request),
        );
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response = ListVerificationCodeResponse(verificationCode: right)
              });
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<GetVerificationCodeResponse> getVerificationCode(
      ServiceCall call, GetVerificationCodeRequest request) async {
    try {
      late GetVerificationCodeResponse response;
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      late Either<GrpcError, VerificationCode> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.getVerificationCode(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: request.fieldMask.paths,
            context: context);
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response = GetVerificationCodeResponse(verificationCode: right)
              });
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<Empty> deleteVerificationCode(
      ServiceCall call, DeleteVerificationCodeRequest request) async {
    try {
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      late Either<GrpcError, void> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.deleteVerificationCode(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            context: context);
      });
      result.fold((left) => throw left, (right) => null);
      return Empty();
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<SignInResponse> signIn(ServiceCall call, SignInRequest request) async {
    try {
      late SignInResponse response;
      AuthenticationRepository signInRepository = GetIt.I<AuthenticationRepository>();
      late Either<GrpcError, SignInResponse> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await signInRepository.signIn(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: [],
            context: context);
      });
      result.fold((left) => {throw left}, (right) => {response = right});
      return response;
    } catch (error) {
      if (error is GrpcError) {
        rethrow;
      } else {
        throw GrpcError.internal('Internal server error');
      }
    }
  }

  @override
  Future<UpdateVerificationCodeResponse> updateVerificationCode(
      ServiceCall call, UpdateVerificationCodeRequest request) async {
    try {
      late UpdateVerificationCodeResponse response;
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      late Either<GrpcError, VerificationCode> result;
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        result = await verificationCodeRepository.updateVerificationCode(
            metadata: HeadersMetadata.fromServiceCall(call),
            data: getRequestData(request),
            paths: request.fieldMask.paths,
            context: context);
      });
      result.fold(
          (left) => {throw left},
          (right) => {
                response =
                    UpdateVerificationCodeResponse(verificationCode: right)
              });
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
