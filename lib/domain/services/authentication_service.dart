import 'dart:math';

import 'package:api_grpc_dart/domain/repositories/verification_code_repository.dart';
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
    result.fold((l) => {throw Exception(l)},
        (r) => {response = ListVerificationCodeResponse(verificationCodes: r)});
    return response;
  }
}
