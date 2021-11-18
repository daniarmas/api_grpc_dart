// Dart imports:
import 'dart:io';

// Package imports:
import 'package:grpc/grpc.dart';

// Project imports:
import 'package:api_grpc_dart/protos/protos/main.pbgrpc.dart';

void main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 2210,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final healthServiceClient = HealthClient(channel);

  // HealthCheck
  try {
    final resultHealthCheck =
        await healthServiceClient.check(HealthCheckRequest());
    stdout.write(resultHealthCheck);
    exit(0);
  } catch (error) {
    stderr.write(error);
  }
}
