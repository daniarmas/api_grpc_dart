import 'package:api_grpc_dart/core/utils/get_request_data.dart';
import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class AuthenticationService extends AuthenticationServiceBase {
  @override
  Future<CreateVerificationCodeResponse> createVerificationCode(
      ServiceCall call, CreateVerificationCodeRequest request) async {
    late CreateVerificationCodeResponse response;
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    late Either<GrpcError, VerificationCode> result;
    Database database = GetIt.I<Database>();
    var connection = await database.getConnection();
    await connection.transaction((context) async {
      result = await verificationCodeRepository.createVerificationCode(
          data: getRequestData(request, add: {
            'createTime': DateTime.now(),
            'updateTime': DateTime.now()
          }),
          paths: request.fieldMask.paths,
          context: context);
    });
    result.fold(
        (left) => {throw left},
        (right) => {
              response = CreateVerificationCodeResponse(verificationCode: right)
            });
    return response;
  }

  @override
  Future<ListVerificationCodeResponse> listVerificationCode(
      ServiceCall call, ListVerificationCodeRequest request) async {
    late ListVerificationCodeResponse response;
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    late Either<GrpcError, Iterable<VerificationCode>> result;
    Database database = GetIt.I<Database>();
    var connection = await database.getConnection();
    await connection.transaction((context) async {
      result = await verificationCodeRepository.listVerificationCode(
        paths: request.fieldMask.paths,
        context: context,
        data: getRequestData(request),
      );
    });
    result.fold(
        (left) => {throw left},
        (right) =>
            {response = ListVerificationCodeResponse(verificationCode: right)});
    return response;
  }

  @override
  Future<GetVerificationCodeResponse> getVerificationCode(
      ServiceCall call, GetVerificationCodeRequest request) async {
    late GetVerificationCodeResponse response;
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    late Either<GrpcError, VerificationCode> result;
    Database database = GetIt.I<Database>();
    var connection = await database.getConnection();
    await connection.transaction((context) async {
      result = await verificationCodeRepository.getVerificationCode(
          data: getRequestData(request),
          paths: request.fieldMask.paths,
          context: context);
    });
    result.fold(
        (left) => {throw left},
        (right) =>
            {response = GetVerificationCodeResponse(verificationCode: right)});
    return response;
  }

  @override
  Future<Empty> deleteVerificationCode(
      ServiceCall call, DeleteVerificationCodeRequest request) async {
    try {
      VerificationCodeRepository verificationCodeRepository =
          GetIt.I<VerificationCodeRepository>();
      Database database = GetIt.I<Database>();
      var connection = await database.getConnection();
      await connection.transaction((context) async {
        await verificationCodeRepository.deleteVerificationCode(
            data: getRequestData(request), context: context);
      });
      return Future.value(Empty());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CreateSignInResponse> createSignIn(
      ServiceCall call, CreateSignInRequest request) async {
    late CreateSignInResponse response;
    Database database = GetIt.I<Database>();
    var connection = await database.getConnection();
    late Either<GrpcError, CreateSignInResponse> result;
    await connection.transaction((context) async {});
    throw UnimplementedError();
  }
}
