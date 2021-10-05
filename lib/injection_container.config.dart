// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/utils/json_web_token.dart' as _i8;
import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/authorization_token_local_data_source.dart' as _i13;
import 'data/datasources/banned_device_local_data_source.dart' as _i14;
import 'data/datasources/banned_user_local_data_source.dart' as _i15;
import 'data/datasources/device_local_data_source.dart' as _i5;
import 'data/datasources/kubernetes_data_source.dart' as _i9;
import 'data/datasources/refresh_token_local_data_source.dart' as _i10;
import 'data/datasources/user_local_data_source.dart' as _i11;
import 'data/datasources/verification_code_local_data_source.dart' as _i12;
import 'data/email/emailer.dart' as _i6;
import 'data/email/emailer_impl.dart' as _i7;
import 'data/repositories/authentication_repository_impl.dart' as _i19;
import 'data/repositories/verification_code_repository_impl.dart' as _i17;
import 'domain/repositories/authentication_repository.dart' as _i18;
import 'domain/repositories/verification_code_repository.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Database>(() => _i4.PostgresqlDatabase());
  gh.factory<_i5.DeviceLocalDataSource>(
      () => _i5.DeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i6.Emailer>(() => _i7.EmailerImpl());
  gh.factory<_i8.JsonWebToken>(() => _i8.JsonWebToken());
  gh.factory<_i9.KubernetesDataSource>(() => _i9.KubernetesDataSourceImpl());
  gh.factory<_i10.RefreshTokenLocalDataSource>(
      () => _i10.RefreshTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i11.UserLocalDataSource>(
      () => _i11.UserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i12.VerificationCodeLocalDataSource>(
      () => _i12.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i13.AuthorizationTokenLocalDataSource>(
      () => _i13.AuthorizationTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i14.BannedDeviceLocalDataSource>(
      () => _i14.BannedDeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i15.BannedUserLocalDataSource>(
      () => _i15.BannedUserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i16.VerificationCodeRepository>(() =>
      _i17.VerificationCodeRepositoryImpl(
          emailer: get<_i6.Emailer>(),
          bannedUserLocalDataSource: get<_i15.BannedUserLocalDataSource>(),
          bannedDeviceLocalDataSource: get<_i14.BannedDeviceLocalDataSource>(),
          userLocalDataSource: get<_i11.UserLocalDataSource>(),
          verificationCodeLocalDataSource:
              get<_i12.VerificationCodeLocalDataSource>()));
  gh.factory<_i18.AuthenticationRepository>(() => _i19.AuthenticationImpl(
      emailer: get<_i6.Emailer>(),
      jsonWebToken: get<_i8.JsonWebToken>(),
      kubernetesDataSource: get<_i9.KubernetesDataSource>(),
      deviceLocalDataSource: get<_i5.DeviceLocalDataSource>(),
      authorizationTokenLocalDataSource:
          get<_i13.AuthorizationTokenLocalDataSource>(),
      refreshTokenLocalDataSource: get<_i10.RefreshTokenLocalDataSource>(),
      bannedUserLocalDataSource: get<_i15.BannedUserLocalDataSource>(),
      bannedDeviceLocalDataSource: get<_i14.BannedDeviceLocalDataSource>(),
      userLocalDataSource: get<_i11.UserLocalDataSource>(),
      verificationCodeLocalDataSource:
          get<_i12.VerificationCodeLocalDataSource>()));
  return get;
}
