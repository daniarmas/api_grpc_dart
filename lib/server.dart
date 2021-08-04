import 'package:api_grpc_dart/domain/services/authentication_service.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'data/database/database.dart';
import 'domain/services/business_service.dart';
import 'environment.dart';
import 'injection_container.dart' as sl;

class Server {
  static final EnvironmentApp _environment = sl.getIt();
  static final Database _database = sl.getIt();

  static Future<void> init() async {
    await _database.connect().then((value) async {
      if (value) {
        final server =
            grpc.Server([BusinessService(), AuthenticationService()]);
        await server.serve(port: _environment.port);
        print('🚀 Server listening at port ${server.port}...');
      }
    }).catchError((onError) {
      throw Exception(onError);
    });
  }
}
