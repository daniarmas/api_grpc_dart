// Dart imports:
import 'dart:io' show Platform;

// Package imports:
import 'package:grpc/grpc.dart';

// Project imports:
import '../../protos/protos/main.pbgrpc.dart';

class HostnameService extends HostnameServiceBase {
  @override
  Future<HostnameResponse> hostname(ServiceCall call, HostnameRequest request) {
    return Future.value(HostnameResponse(hostname: Platform.localHostname));
  }
}
