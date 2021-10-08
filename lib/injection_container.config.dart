// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/utils/json_web_token.dart' as _i8;
import 'core/utils/username_generator.dart' as _i15;
import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/authorization_token_local_data_source.dart' as _i17;
import 'data/datasources/banned_device_local_data_source.dart' as _i18;
import 'data/datasources/banned_user_local_data_source.dart' as _i19;
import 'data/datasources/device_local_data_source.dart' as _i5;
import 'data/datasources/kubernetes_data_source.dart' as _i9;
import 'data/datasources/object_storage_data_source.dart' as _i10;
import 'data/datasources/refresh_token_local_data_source.dart' as _i13;
import 'data/datasources/user_local_data_source.dart' as _i14;
import 'data/datasources/verification_code_local_data_source.dart' as _i16;
import 'data/email/emailer.dart' as _i6;
import 'data/email/emailer_impl.dart' as _i7;
import 'data/repositories/authentication_repository_impl.dart' as _i25;
import 'data/repositories/object_storage_repository_impl.dart' as _i12;
import 'data/repositories/user_repository_impl.dart' as _i21;
import 'data/repositories/verification_code_repository_impl.dart' as _i23;
import 'domain/repositories/authentication_repository.dart' as _i24;
import 'domain/repositories/object_storage_repository.dart' as _i11;
import 'domain/repositories/user_repository.dart' as _i20;
import 'domain/repositories/verification_code_repository.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.ObjectStorageDataSource>(
      () => _i10.MinioObjectStorageDataSource());
  gh.factory<_i11.ObjectStorageRepository>(() =>
      _i12.ObjectStorageRepositoryImpl(
          objectStorageDataSource: get<_i10.ObjectStorageDataSource>()));
  gh.factory<_i13.RefreshTokenLocalDataSource>(
      () => _i13.RefreshTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i14.UserLocalDataSource>(
      () => _i14.UserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i15.UsernameGenerator>(() => _i15.UsernameGenerator());
  gh.factory<_i16.VerificationCodeLocalDataSource>(
      () => _i16.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i17.AuthorizationTokenLocalDataSource>(
      () => _i17.AuthorizationTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i18.BannedDeviceLocalDataSource>(
      () => _i18.BannedDeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i19.BannedUserLocalDataSource>(
      () => _i19.BannedUserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i20.UserRepository>(() => _i21.UserRepositoryImpl(
      generator: get<_i15.UsernameGenerator>(),
      userLocalDataSource: get<_i14.UserLocalDataSource>()));
  gh.factory<_i22.VerificationCodeRepository>(() =>
      _i23.VerificationCodeRepositoryImpl(
          emailer: get<_i6.Emailer>(),
          bannedUserLocalDataSource: get<_i19.BannedUserLocalDataSource>(),
          bannedDeviceLocalDataSource: get<_i18.BannedDeviceLocalDataSource>(),
          userLocalDataSource: get<_i14.UserLocalDataSource>(),
          verificationCodeLocalDataSource:
              get<_i16.VerificationCodeLocalDataSource>()));
  gh.factory<_i24.AuthenticationRepository>(() => _i25.AuthenticationImpl(
      emailer: get<_i6.Emailer>(),
      jsonWebToken: get<_i8.JsonWebToken>(),
      kubernetesDataSource: get<_i9.KubernetesDataSource>(),
      deviceLocalDataSource: get<_i5.DeviceLocalDataSource>(),
      authorizationTokenLocalDataSource:
          get<_i17.AuthorizationTokenLocalDataSource>(),
      refreshTokenLocalDataSource: get<_i13.RefreshTokenLocalDataSource>(),
      bannedUserLocalDataSource: get<_i19.BannedUserLocalDataSource>(),
      bannedDeviceLocalDataSource: get<_i18.BannedDeviceLocalDataSource>(),
      userLocalDataSource: get<_i14.UserLocalDataSource>(),
      verificationCodeLocalDataSource:
          get<_i16.VerificationCodeLocalDataSource>()));
  return get;
}
