import 'dart:io' show Platform;

import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class HostnameService extends HostnameServiceBase {
  @override
  Future<HostnameResponse> hostname(ServiceCall call, HostnameRequest request) {
    return Future.value(HostnameResponse(hostname: Platform.localHostname));
  }
}
