import 'package:grpc/grpc.dart';

import '../../protos/protos/main.pbgrpc.dart';

class HealthService extends HealthServiceBase {
  @override
  Future<HealthCheckResponse> check(
      ServiceCall call, HealthCheckRequest request) {
    return Future.value(
        HealthCheckResponse(status: HealthCheckResponse_ServingStatus.SERVING));
  }
}
