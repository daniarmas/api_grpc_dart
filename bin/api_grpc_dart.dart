import 'package:api_grpc_dart/server.dart';
import 'package:api_grpc_dart/injection_container.dart';

void main(List<String> arguments) {
  initInjectionContainer();
  Server.init();
}
