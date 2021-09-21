// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/authorization_token_local_data_source.dart' as _i7;
import 'data/datasources/banned_device_local_data_source.dart' as _i10;
import 'data/datasources/banned_user_local_data_source.dart' as _i11;
import 'data/datasources/user_local_data_source.dart' as _i5;
import 'data/datasources/verification_code_local_data_source.dart' as _i6;
import 'data/repositories/authorization_token_impl.dart' as _i9;
import 'data/repositories/verification_code_repository_impl.dart' as _i13;
import 'domain/repositories/authorization_token.dart' as _i8;
import 'domain/repositories/verification_code_repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Database>(() => _i4.PostgresqlDatabase());
  gh.factory<_i5.UserLocalDataSource>(
      () => _i5.UserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i6.VerificationCodeLocalDataSource>(
      () => _i6.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i7.AuthorizationTokenLocalDataSource>(
      () => _i7.AuthorizationTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i8.AuthorizationTokenRepository>(() =>
      _i9.AuthorizationTokenRepositoryImpl(
          localDataSource: get<_i7.AuthorizationTokenLocalDataSource>()));
  gh.factory<_i10.BannedDeviceLocalDataSource>(
      () => _i10.BannedDeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i11.BannedUserLocalDataSource>(
      () => _i11.BannedUserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i12.VerificationCodeRepository>(() =>
      _i13.VerificationCodeRepositoryImpl(
          bannedUserLocalDataSource: get<_i11.BannedUserLocalDataSource>(),
          bannedDeviceLocalDataSource: get<_i10.BannedDeviceLocalDataSource>(),
          userLocalDataSource: get<_i5.UserLocalDataSource>(),
          verificationCodeLocalDataSource:
              get<_i6.VerificationCodeLocalDataSource>()));
  return get;
}
