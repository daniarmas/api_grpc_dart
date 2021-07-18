import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'data/database/database.dart';
import 'domain/services/business_service.dart';
import 'environment.dart';
import 'injection_container.dart' as sl;

class Server {
  static final Environment _environment = sl.serviceLocator();
  static final Database _database = sl.serviceLocator();

  static Future<void> init() async {
    await _database.connect().then((value) async {
      if (value) {
        final server = grpc.Server([
          BusinessService(),
        ]);
        await server.serve(port: _environment.port);
        print('🚀 Server listening at port ${server.port}...');
      }
    }).catchError((onError) {
      throw Exception(onError);
    });
  }
}
