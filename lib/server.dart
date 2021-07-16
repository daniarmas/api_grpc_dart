import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'data/database/database.dart';
import 'domain/services/business_service.dart';
import 'environment.dart';

class Server {
  static final serviceLocator = GetIt.instance;
  static final Environment _environment = serviceLocator();
  static final Database _database = serviceLocator();

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
