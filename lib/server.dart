import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'data/database/database.dart';
import 'domain/services/authentication_service.dart';
import 'domain/services/business_service.dart';
import 'environment.dart';

class Server {
  static final EnvironmentApp _environment = GetIt.I<EnvironmentApp>();
  static final Database _database = GetIt.I<Database>();

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
