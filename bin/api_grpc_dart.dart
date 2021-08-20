import 'package:api_grpc_dart/injection_container.dart';
import 'package:api_grpc_dart/server.dart';

void main(List<String> arguments) {
  configureDependencies();
  Server.init();
}
