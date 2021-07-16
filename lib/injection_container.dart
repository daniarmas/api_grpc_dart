import 'package:api_grpc_dart/data/database/postgresql.dart';
import 'package:api_grpc_dart/data/datasources/list_business_local_data_source.dart';
import 'package:api_grpc_dart/data/repositories/business_repository_impl.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initInjectionContainer() {
  serviceLocator.registerSingleton<PostgresqlDatabase>(PostgresqlDatabase());
  serviceLocator.registerSingleton<ListBusinessLocalDataSource>(
      ListBusinessLocalDataSourceImpl());
  serviceLocator.registerSingleton<BusinessRepository>(
      BusinessRepositoryImpl(localDataSource: serviceLocator()));
}

void initFeatures() {}
