import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/server.dart';

import 'package:shutdown/shutdown.dart' as shutdown;

void main(List<String> arguments) async {
  shutdown.triggerOnSigInt();
  shutdown.triggerOnSigHup();
  configureDependencies();
  await Server.init();
}
