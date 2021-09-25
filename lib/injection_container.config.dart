// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/authorization_token_local_data_source.dart' as _i9;
import 'data/datasources/banned_device_local_data_source.dart' as _i10;
import 'data/datasources/banned_user_local_data_source.dart' as _i11;
import 'data/datasources/device_local_data_source.dart' as _i5;
import 'data/datasources/refresh_token_local_data_source.dart' as _i6;
import 'data/datasources/user_local_data_source.dart' as _i7;
import 'data/datasources/verification_code_local_data_source.dart' as _i8;
import 'data/repositories/authentication_repository_impl.dart' as _i15;
import 'data/repositories/verification_code_repository_impl.dart' as _i13;
import 'domain/repositories/sign_in_repository.dart' as _i14;
import 'domain/repositories/verification_code_repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Database>(() => _i4.PostgresqlDatabase());
  gh.factory<_i5.DeviceLocalDataSource>(
      () => _i5.DeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i6.RefreshTokenLocalDataSource>(
      () => _i6.RefreshTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i7.UserLocalDataSource>(
      () => _i7.UserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i8.VerificationCodeLocalDataSource>(
      () => _i8.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i9.AuthorizationTokenLocalDataSource>(
      () => _i9.AuthorizationTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i10.BannedDeviceLocalDataSource>(
      () => _i10.BannedDeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i11.BannedUserLocalDataSource>(
      () => _i11.BannedUserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i12.VerificationCodeRepository>(() =>
      _i13.VerificationCodeRepositoryImpl(
          bannedUserLocalDataSource: get<_i11.BannedUserLocalDataSource>(),
          bannedDeviceLocalDataSource: get<_i10.BannedDeviceLocalDataSource>(),
          userLocalDataSource: get<_i7.UserLocalDataSource>(),
          verificationCodeLocalDataSource:
              get<_i8.VerificationCodeLocalDataSource>()));
  gh.factory<_i14.AuthenticationRepository>(() => _i15.AuthenticationImpl(
      deviceLocalDataSource: get<_i5.DeviceLocalDataSource>(),
      authorizationTokenLocalDataSource:
          get<_i9.AuthorizationTokenLocalDataSource>(),
      refreshTokenLocalDataSource: get<_i6.RefreshTokenLocalDataSource>(),
      bannedUserLocalDataSource: get<_i11.BannedUserLocalDataSource>(),
      bannedDeviceLocalDataSource: get<_i10.BannedDeviceLocalDataSource>(),
      userLocalDataSource: get<_i7.UserLocalDataSource>(),
      verificationCodeLocalDataSource:
          get<_i8.VerificationCodeLocalDataSource>()));
  return get;
}
