import 'package:api_grpc_dart/data/database/database.dart';
import 'package:api_grpc_dart/data/database/postgresql.dart';
import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart';
import 'package:test/scaffolding.dart';

void main() {
  BusinessLocalDataSourceImpl localDataSource;
  Database database = PostgresqlDatabase();

  setUp(() {
    localDataSource = BusinessLocalDataSourceImpl(database);
  });
}
