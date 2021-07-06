import 'package:api_grpc_dart/src/services/business.service.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:postgres/postgres.dart';

import 'environment.dart';

class Server {
  late final Environment environment;
  late final PostgreSQLConnection connection;

  static Future<void> init() async {
    final getIt = GetIt.instance;
    final environment = Environment.development();
    final connection = PostgreSQLConnection('192.168.0.2', 54322, 'database',
        username: 'postgres', password: 'postgres');
    getIt.registerSingleton<Environment>(
      environment,
    );
    getIt.registerSingleton<PostgreSQLConnection>(connection);

    await connection.open().then((value) async {
      print('🚀 Database Server is on...');
      final server = grpc.Server([
        BusinessService(),
      ]);
      await server.serve(port: environment.PORT);
      print('🚀 Server listening at port ${server.port}...');
    }).catchError((onError) {
      throw Exception(onError);
    });
  }
}
