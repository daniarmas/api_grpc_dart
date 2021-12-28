// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dotenv/dotenv.dart' show env;
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart';

FutureOr<GrpcError?> accessTokenValid(ServiceCall call, ServiceMethod method) {
  if (env['DEBUG'] == 'true') {
    if (call.clientMetadata!['accesstoken'] != null &&
        call.clientMetadata!['accesstoken'] == env['ACCESSTOKEN']) {
      return null;
    }
    return GrpcError.unauthenticated('Client unauthenticated');
  } else {
    if (call.headers!['accesstoken'] != null &&
        call.headers!['accesstoken'] == env['ACCESSTOKEN']) {
      return null;
    }
    return GrpcError.unauthenticated('Client unauthenticated');
  }
}

FutureOr<GrpcError?> authorizationTokenValid(
    ServiceCall call, ServiceMethod method, List<String> methods) {
  JsonWebToken jsonWebToken = GetIt.I<JsonWebToken>();
  try {
    if (methods.contains(method.name)) {
      if (call.clientMetadata!['authorization'] != null &&
          call.clientMetadata!['authorization'] != '') {
        var strings = call.clientMetadata!['authorization']!.split(' ');
        jsonWebToken.verify(strings[1], 'AuthorizationToken');
        return null;
      }
      return GrpcError.unauthenticated('Unauthenticated');
    } else {
      return null;
    }
  } catch (error) {
    if (error is GrpcError) {
      return error;
    } else {
      return GrpcError.internal('Internal server error');
    }
  }
}

FutureOr<GrpcError?> checkClientMetadata(
    ServiceCall call, ServiceMethod method) {
  final metadata = call.clientMetadata;
  if (metadata!['platform'] == null ||
      metadata['platform'] == 'PLATFORM_TYPE_UNSPECIFIED') {
    return GrpcError.invalidArgument('Client metadata incomplete');
  }
  if (metadata['platform'] == null ||
      metadata['app'] == null ||
      metadata['appversion'] == null ||
      metadata['ipv4'] == null ||
      // metadata['ipv6'] == null ||
      metadata['systemlanguage'] == null ||
      metadata['systemversionsdk'] == null ||
      metadata['systemversion'] == null ||
      metadata['networktype'] == null ||
      metadata['deviceid'] == null ||
      metadata['model'] == null ||
      metadata['firebasecloudmessagingid'] == null) {
    return GrpcError.invalidArgument('Client metadata incomplete');
  }
  return null;
}
