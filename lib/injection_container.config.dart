// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// Project imports:
import 'core/utils/json_web_token.dart' as _i11;
import 'core/utils/username_generator.dart' as _i19;
import 'data/database/database.dart' as _i3;
import 'data/database/postgresql.dart' as _i4;
import 'data/datasources/authorization_token_local_data_source.dart' as _i21;
import 'data/datasources/banned_device_local_data_source.dart' as _i22;
import 'data/datasources/banned_user_local_data_source.dart' as _i23;
import 'data/datasources/business_local_data_source.dart' as _i24;
import 'data/datasources/device_local_data_source.dart' as _i5;
import 'data/datasources/item_local_data_source.dart' as _i8;
import 'data/datasources/kubernetes_data_source.dart' as _i12;
import 'data/datasources/object_storage_data_source.dart' as _i13;
import 'data/datasources/refresh_token_local_data_source.dart' as _i16;
import 'data/datasources/session_local_data_source.dart' as _i17;
import 'data/datasources/user_local_data_source.dart' as _i18;
import 'data/datasources/verification_code_local_data_source.dart' as _i20;
import 'data/email/emailer.dart' as _i6;
import 'data/email/emailer_impl.dart' as _i7;
import 'data/repositories/authentication_repository_impl.dart' as _i32;
import 'data/repositories/business_repository_impl.dart' as _i26;
import 'data/repositories/item_repository_impl.dart' as _i10;
import 'data/repositories/object_storage_repository_impl.dart' as _i15;
import 'data/repositories/user_repository_impl.dart' as _i28;
import 'data/repositories/verification_code_repository_impl.dart' as _i30;
import 'domain/repositories/authentication_repository.dart' as _i31;
import 'domain/repositories/business_repository.dart' as _i25;
import 'domain/repositories/item_repository.dart' as _i9;
import 'domain/repositories/object_storage_repository.dart' as _i14;
import 'domain/repositories/user_repository.dart' as _i27;

import 'domain/repositories/verification_code_repository.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.Database>(() => _i4.PostgresqlDatabase());
  gh.factory<_i5.DeviceLocalDataSource>(
      () => _i5.DeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i6.Emailer>(() => _i7.EmailerImpl());
  gh.factory<_i8.ItemLocalDataSource>(
      () => _i8.ItemLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i9.ItemRepository>(() => _i10.ItemRepositoryImpl(
      itemLocalDataSource: get<_i8.ItemLocalDataSource>(),
      database: get<_i3.Database>()));
  gh.factory<_i11.JsonWebToken>(() => _i11.JsonWebToken());
  gh.factory<_i12.KubernetesDataSource>(() => _i12.KubernetesDataSourceImpl());
  gh.factory<_i13.ObjectStorageDataSource>(
      () => _i13.MinioObjectStorageDataSource());
  gh.factory<_i14.ObjectStorageRepository>(() =>
      _i15.ObjectStorageRepositoryImpl(
          objectStorageDataSource: get<_i13.ObjectStorageDataSource>()));
  gh.factory<_i16.RefreshTokenLocalDataSource>(
      () => _i16.RefreshTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i17.SessionLocalDataSource>(
      () => _i17.SessionLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i18.UserLocalDataSource>(
      () => _i18.UserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i19.UsernameGenerator>(() => _i19.UsernameGenerator());
  gh.factory<_i20.VerificationCodeLocalDataSource>(
      () => _i20.VerificationCodeLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i21.AuthorizationTokenLocalDataSource>(
      () => _i21.AuthorizationTokenLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i22.BannedDeviceLocalDataSource>(
      () => _i22.BannedDeviceLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i23.BannedUserLocalDataSource>(
      () => _i23.BannedUserLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i24.BusinessLocalDataSource>(
      () => _i24.BusinessLocalDataSourceImpl(get<_i3.Database>()));
  gh.factory<_i25.BusinessRepository>(() => _i26.BusinessRepositoryImpl(
      businessLocalDataSource: get<_i24.BusinessLocalDataSource>()));
  gh.factory<_i27.UserRepository>(() => _i28.UserRepositoryImpl(
      generator: get<_i19.UsernameGenerator>(),
      userLocalDataSource: get<_i18.UserLocalDataSource>(),
      verificationCodeLocalDataSource:
          get<_i20.VerificationCodeLocalDataSource>()));
  gh.factory<_i29.VerificationCodeRepository>(() =>
      _i30.VerificationCodeRepositoryImpl(
          emailer: get<_i6.Emailer>(),
          bannedUserLocalDataSource: get<_i23.BannedUserLocalDataSource>(),
          bannedDeviceLocalDataSource: get<_i22.BannedDeviceLocalDataSource>(),
          userLocalDataSource: get<_i18.UserLocalDataSource>(),
          verificationCodeLocalDataSource:
              get<_i20.VerificationCodeLocalDataSource>()));
  gh.factory<_i31.AuthenticationRepository>(() => _i32.AuthenticationImpl(
      emailer: get<_i6.Emailer>(),
      jsonWebToken: get<_i11.JsonWebToken>(),
      kubernetesDataSource: get<_i12.KubernetesDataSource>(),
      deviceLocalDataSource: get<_i5.DeviceLocalDataSource>(),
      authorizationTokenLocalDataSource:
          get<_i21.AuthorizationTokenLocalDataSource>(),
      refreshTokenLocalDataSource: get<_i16.RefreshTokenLocalDataSource>(),
      bannedUserLocalDataSource: get<_i23.BannedUserLocalDataSource>(),
      bannedDeviceLocalDataSource: get<_i22.BannedDeviceLocalDataSource>(),
      userLocalDataSource: get<_i18.UserLocalDataSource>(),
      sessionLocalDataSource: get<_i17.SessionLocalDataSource>(),
      verificationCodeLocalDataSource:
          get<_i20.VerificationCodeLocalDataSource>()));
  return get;
}
