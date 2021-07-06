import 'package:get_it/get_it.dart';
import 'package:postgres/postgres.dart';

import 'environment.dart';

Future<void> setup() async {
  final getIt = GetIt.instance;
  final environment = Environment.development();
  final connection = PostgreSQLConnection('192.168.0.2', 54322, 'database',
      username: 'postgres', password: 'postgres');
  await connection.open();
  getIt.registerSingleton<Environment>(
    environment,
  );
  getIt.registerSingleton<PostgreSQLConnection>(connection);
}
