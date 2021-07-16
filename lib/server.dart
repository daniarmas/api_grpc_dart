import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;

import 'data/database/postgresql.dart';
import 'domain/services/business_service.dart';
import 'environment.dart';

class Server {
  static Future<void> init() async {
    final environment = GetIt.I<Environment>();
    final postgresqlDatabase = GetIt.I<PostgresqlDatabase>();
    await postgresqlDatabase.setUp().then((value) async {
      if (value) {
        final server = grpc.Server([
          BusinessService(),
        ]);
        await server.serve(port: environment.port);
        print('🚀 Server listening at port ${server.port}...');
      }
    }).catchError((onError) {
      throw Exception(onError);
    });
  }
}
