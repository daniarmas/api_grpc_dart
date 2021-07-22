import 'dart:math';

import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class AuthenticationService extends AuthenticationServiceBase {
  @override
  Future<CreateVerificationCodeResponse> createVerificationCode(
      ServiceCall call, CreateVerificationCodeRequest request) {
    var randomNumber = Random();
    var next = randomNumber.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    Future<CreateVerificationCodeResponse> response = Future.value(
        CreateVerificationCodeResponse(
            verificationCode: VerificationCode(
                code: next.toInt().toString(),
                deviceId: request.deviceId,
                type: request.type)));
    return response;
  }
}
