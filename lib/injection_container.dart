import 'package:dotenv/dotenv.dart' show load, env;
import 'package:get_it/get_it.dart';

import 'data/database/database.dart';
import 'data/database/postgresql.dart';
import 'data/datasources/list_business_local_data_source.dart';
import 'data/repositories/business_repository_impl.dart';
import 'domain/repositories/business_repository.dart';
import 'environment.dart';

final serviceLocator = GetIt.instance;

void initInjectionContainer() {
  load();
  serviceLocator.registerSingleton<Environment>(Environment(
    port: int.parse(env['PORT']!),
    databaseHost: env['DATABASE_HOST']!,
    databasePort: int.parse(env['DATABASE_PORT']!),
    databaseDatabase: env['DATABASE_DATABASE']!,
    databaseUsername: env['DATABASE_USERNAME']!,
    databasePassword: env['DATABASE_PASSWORD']!,
  ));
  serviceLocator.registerSingleton<Database>(PostgresqlDatabase());
  serviceLocator.registerSingleton<ListBusinessLocalDataSource>(
      ListBusinessLocalDataSourceImpl());
  serviceLocator.registerSingleton<BusinessRepository>(
      BusinessRepositoryImpl(localDataSource: serviceLocator()));
}
