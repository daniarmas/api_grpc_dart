import 'package:api_grpc_dart/injection_container.config.dart';
import 'package:dotenv/dotenv.dart' show env, load;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'environment.dart';

final getIt = GetIt.instance;

void configureDependenciesManual() {
  getIt.registerSingleton<EnvironmentApp>(EnvironmentApp(
    port: int.parse(env['PORT']!),
    databaseHost: env['DATABASE_HOST']!,
    databasePort: int.parse(env['DATABASE_PORT']!),
    databaseDatabase: env['DATABASE_DATABASE']!,
    databaseUsername: env['DATABASE_USERNAME']!,
    databasePassword: env['DATABASE_PASSWORD']!,
  ));
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  load();
  configureDependenciesManual();
  $initGetIt(getIt);
}
