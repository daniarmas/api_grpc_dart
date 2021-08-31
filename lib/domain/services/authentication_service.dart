import 'dart:math';

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
    var randomNumber = Random();
    var next = randomNumber.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    final result =
        await verificationCodeRepository.createVerificationCode(data: {
      'code': next.toInt().toString(),
      'type': request.type,
      'deviceId': request.deviceId,
      'createTime': DateTime.now(),
      'updateTime': DateTime.now(),
    });
    result.fold(
        (l) => {throw Exception(l)},
        (r) =>
            {response = CreateVerificationCodeResponse(verificationCode: r)});
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
        (left) => {
              response = ListVerificationCodeResponse(
                  error: Error(
                      code: left.code,
                      message: left.message,
                      codeName: left.codeName))
            },
        (right) => {
              response = ListVerificationCodeResponse(
                  data: ListVerificationCodeResponse_Data(
                      verificationCode: right))
            });
    return response;
  }

  @override
  Future<GetVerificationCodeResponse> getVerificationCode(
      ServiceCall call, GetVerificationCodeRequest request) async {
    late GetVerificationCodeResponse response;
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    const String msg = 'Length of `Name` cannot be more than 10 characters';
    final result =
        await verificationCodeRepository.getVerificationCode(id: request.id);
    result.fold((l) => {throw GrpcError.invalidArgument(msg)},
        (r) => {response = GetVerificationCodeResponse(verificationCode: r)});
    return response;
  }

  @override
  Future<Empty> deleteVerificationCode(
      ServiceCall call, DeleteVerificationCodeRequest request) async {
    VerificationCodeRepository verificationCodeRepository =
        GetIt.I<VerificationCodeRepository>();
    await verificationCodeRepository.deleteVerificationCode(id: request.id);
    return Future.value(Empty());
  }

  @override
  Future<CreateSignInResponse> createSignIn(
      ServiceCall call, CreateSignInRequest request) {
    // TODO: implement createSignIn
    throw UnimplementedError();
  }
}
