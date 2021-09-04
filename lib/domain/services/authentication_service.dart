import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
import 'package:api_grpc_dart/protos/google/protobuf/empty.pb.dart';
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
    final result =
        await verificationCodeRepository.createVerificationCode(data: {
      'type': request.type,
      'email': request.email,
      'deviceId': request.deviceId,
      'createTime': DateTime.now(),
      'updateTime': DateTime.now(),
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
    final result = await verificationCodeRepository.listVerificationCode();
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
    final result =
        await verificationCodeRepository.getVerificationCode(id: request.id);
    result.fold(
        (left) => {throw left},
        (right) =>
            {response = GetVerificationCodeResponse(verificationCode: right)});
    return response;
  }

  @override
  Future<Empty> deleteVerificationCode(
      ServiceCall call, DeleteVerificationCodeRequest request) async {
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    try {
      await verificationCodeRepository.deleteVerificationCode(id: request.id);
      return Future.value(Empty());
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CreateSignInResponse> createSignIn(
      ServiceCall call, CreateSignInRequest request) {
    // TODO: implement createSignIn
    throw UnimplementedError();
  }
}
