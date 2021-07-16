import 'package:dotenv/dotenv.dart' show load, env;
import 'package:get_it/get_it.dart';

import 'data/database/postgresql.dart';
import 'data/datasources/list_business_local_data_source.dart';
import 'data/repositories/business_repository_impl.dart';
import 'domain/repositories/business_repository.dart';
import 'environment.dart';

final serviceLocator = GetIt.instance;

void initInjectionContainer() {
  load();
  serviceLocator.registerSingleton<Environment>(Environment(
    port: int.parse(env['PORT'] ?? '9000'),
    postgresdbUri: env['POSTGRESDB_URI'] ??
        'postgres://postgres:postgres@192.168.0.2:54322/database',
  ));
  serviceLocator.registerSingleton<PostgresqlDatabase>(PostgresqlDatabase());
  serviceLocator.registerSingleton<ListBusinessLocalDataSource>(
      ListBusinessLocalDataSourceImpl());
  serviceLocator.registerSingleton<BusinessRepository>(
      BusinessRepositoryImpl(localDataSource: serviceLocator()));
}

void initFeatures() {}
