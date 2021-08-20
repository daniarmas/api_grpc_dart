// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/business_local_data_source.dart' as _i8;
import 'data/datasources/verification_code_local_data_source.dart' as _i5;
import 'data/repositories/business_repository_impl.dart' as _i10;
import 'data/repositories/verification_code_repository_impl.dart' as _i7;
import 'domain/repositories/business_repository.dart' as _i9;
import 'domain/repositories/verification_code_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Database>(() => _i4.PostgresqlDatabase());
  gh.factory<_i5.VerificationCodeLocalDataSource>(
      () => _i5.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i6.VerificationCodeRepository>(() =>
      _i7.VerificationCodeRepositoryImpl(
          localDataSource: get<_i5.VerificationCodeLocalDataSource>()));
  gh.factory<_i8.BusinessLocalDataSource>(
      () => _i8.BusinessLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i9.BusinessRepository>(() => _i10.BusinessRepositoryImpl(
      localDataSource: get<_i8.BusinessLocalDataSource>()));
  return get;
}
