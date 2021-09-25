import 'dart:io';

import 'package:api_grpc_dart/injection_container.config.dart';
import 'package:dotenv/dotenv.dart' show env, load;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'environment.dart';

final getIt = GetIt.instance;

void configureDependenciesManual() {
  try {
    load();
    getIt.registerSingleton<EnvironmentApp>(EnvironmentApp(
      jsonWebTokenSecretKey: env['JWT_SECRET_KEY']!,
      port: int.parse(env['PORT']!),
      databaseHost: env['DATABASE_HOST']!,
      databasePort: int.parse(env['DATABASE_PORT']!),
      databaseDatabase: env['DATABASE_DATABASE']!,
      databaseUsername: env['DATABASE_USERNAME']!,
      databasePassword: env['DATABASE_PASSWORD']!,
    ));
  } catch (error) {
    if (error.toString() == 'Null check operator used on a null value') {
      var env = Platform.environment;
      getIt.registerSingleton<EnvironmentApp>(EnvironmentApp(
        jsonWebTokenSecretKey: env['JWT_SECRET_KEY']!,
        port: int.parse(env['PORT']!),
        databaseHost: env['DATABASE_HOST']!,
        databasePort: int.parse(env['DATABASE_PORT']!),
        databaseDatabase: env['DATABASE_DATABASE']!,
        databaseUsername: env['DATABASE_USERNAME']!,
        databasePassword: env['DATABASE_PASSWORD']!,
      ));
    }
  }
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  configureDependenciesManual();
  $initGetIt(getIt);
}
