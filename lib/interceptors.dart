import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:dotenv/dotenv.dart' show env;

FutureOr<GrpcError?> accessTokenValid(ServiceCall call, ServiceMethod method) {
  if (env['DEBUG'] == 'true') {
    if (call.clientMetadata!['authorization'] != null &&
        call.clientMetadata!['authorization'] == env['ACCESSTOKEN']) {
      return null;
    }
    return GrpcError.unauthenticated('Client unauthenticated');
  } else {
    if (call.headers!['authorization'] != null &&
        call.headers!['authorization'] == env['ACCESSTOKEN']) {
      return null;
    }
    return GrpcError.unauthenticated('Client unauthenticated');
  }
}
