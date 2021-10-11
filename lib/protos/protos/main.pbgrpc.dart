///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'main.pb.dart' as $0;
import '../google/protobuf/empty.pb.dart' as $1;
export 'main.pb.dart';

class AuthenticationServiceClient extends $grpc.Client {
  static final _$createVerificationCode = $grpc.ClientMethod<
          $0.CreateVerificationCodeRequest, $0.CreateVerificationCodeResponse>(
      '/AuthenticationService/CreateVerificationCode',
      ($0.CreateVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateVerificationCodeResponse.fromBuffer(value));
  static final _$listVerificationCode = $grpc.ClientMethod<
          $0.ListVerificationCodeRequest, $0.ListVerificationCodeResponse>(
      '/AuthenticationService/ListVerificationCode',
      ($0.ListVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ListVerificationCodeResponse.fromBuffer(value));
  static final _$getVerificationCode = $grpc.ClientMethod<
          $0.GetVerificationCodeRequest, $0.GetVerificationCodeResponse>(
      '/AuthenticationService/GetVerificationCode',
      ($0.GetVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetVerificationCodeResponse.fromBuffer(value));
  static final _$updateVerificationCode = $grpc.ClientMethod<
          $0.UpdateVerificationCodeRequest, $0.UpdateVerificationCodeResponse>(
      '/AuthenticationService/UpdateVerificationCode',
      ($0.UpdateVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateVerificationCodeResponse.fromBuffer(value));
  static final _$deleteVerificationCode =
      $grpc.ClientMethod<$0.DeleteVerificationCodeRequest, $1.Empty>(
          '/AuthenticationService/DeleteVerificationCode',
          ($0.DeleteVerificationCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$signIn =
      $grpc.ClientMethod<$0.SignInRequest, $0.SignInResponse>(
          '/AuthenticationService/SignIn',
          ($0.SignInRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignInResponse.fromBuffer(value));
  static final _$signUp =
      $grpc.ClientMethod<$0.SignUpRequest, $0.SignUpResponse>(
          '/AuthenticationService/SignUp',
          ($0.SignUpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignUpResponse.fromBuffer(value));
  static final _$checkSession =
      $grpc.ClientMethod<$0.CheckSessionRequest, $0.CheckSessionResponse>(
          '/AuthenticationService/CheckSession',
          ($0.CheckSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CheckSessionResponse.fromBuffer(value));
  static final _$userExists =
      $grpc.ClientMethod<$0.UserExistsRequest, $1.Empty>(
          '/AuthenticationService/UserExists',
          ($0.UserExistsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$userExistsStream = $grpc.ClientMethod<
          $0.UserExistsStreamRequest, $0.UserExistsStreamResponse>(
      '/AuthenticationService/UserExistsStream',
      ($0.UserExistsStreamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UserExistsStreamResponse.fromBuffer(value));

  AuthenticationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateVerificationCodeResponse>
      createVerificationCode($0.CreateVerificationCodeRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createVerificationCode, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListVerificationCodeResponse> listVerificationCode(
      $0.ListVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetVerificationCodeResponse> getVerificationCode(
      $0.GetVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateVerificationCodeResponse>
      updateVerificationCode($0.UpdateVerificationCodeRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateVerificationCode, request,
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteVerificationCode(
      $0.DeleteVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteVerificationCode, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.SignInResponse> signIn($0.SignInRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.SignUpResponse> signUp($0.SignUpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckSessionResponse> checkSession(
      $0.CheckSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkSession, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> userExists($0.UserExistsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userExists, request, options: options);
  }

  $grpc.ResponseStream<$0.UserExistsStreamResponse> userExistsStream(
      $async.Stream<$0.UserExistsStreamRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$userExistsStream, request, options: options);
  }
}

abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthenticationService';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateVerificationCodeRequest,
            $0.CreateVerificationCodeResponse>(
        'CreateVerificationCode',
        createVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateVerificationCodeRequest.fromBuffer(value),
        ($0.CreateVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListVerificationCodeRequest,
            $0.ListVerificationCodeResponse>(
        'ListVerificationCode',
        listVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListVerificationCodeRequest.fromBuffer(value),
        ($0.ListVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVerificationCodeRequest,
            $0.GetVerificationCodeResponse>(
        'GetVerificationCode',
        getVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetVerificationCodeRequest.fromBuffer(value),
        ($0.GetVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateVerificationCodeRequest,
            $0.UpdateVerificationCodeResponse>(
        'UpdateVerificationCode',
        updateVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateVerificationCodeRequest.fromBuffer(value),
        ($0.UpdateVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteVerificationCodeRequest, $1.Empty>(
        'DeleteVerificationCode',
        deleteVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteVerificationCodeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $0.SignInResponse>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($0.SignInResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.SignUpResponse>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.SignUpResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CheckSessionRequest, $0.CheckSessionResponse>(
            'CheckSession',
            checkSession_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CheckSessionRequest.fromBuffer(value),
            ($0.CheckSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserExistsRequest, $1.Empty>(
        'UserExists',
        userExists_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserExistsRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserExistsStreamRequest,
            $0.UserExistsStreamResponse>(
        'UserExistsStream',
        userExistsStream,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.UserExistsStreamRequest.fromBuffer(value),
        ($0.UserExistsStreamResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateVerificationCodeResponse> createVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateVerificationCodeRequest> request) async {
    return createVerificationCode(call, await request);
  }

  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListVerificationCodeRequest> request) async {
    return listVerificationCode(call, await request);
  }

  $async.Future<$0.GetVerificationCodeResponse> getVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetVerificationCodeRequest> request) async {
    return getVerificationCode(call, await request);
  }

  $async.Future<$0.UpdateVerificationCodeResponse> updateVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateVerificationCodeRequest> request) async {
    return updateVerificationCode(call, await request);
  }

  $async.Future<$1.Empty> deleteVerificationCode_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteVerificationCodeRequest> request) async {
    return deleteVerificationCode(call, await request);
  }

  $async.Future<$0.SignInResponse> signIn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.SignUpResponse> signUp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.CheckSessionResponse> checkSession_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CheckSessionRequest> request) async {
    return checkSession(call, await request);
  }

  $async.Future<$1.Empty> userExists_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserExistsRequest> request) async {
    return userExists(call, await request);
  }

  $async.Future<$0.CreateVerificationCodeResponse> createVerificationCode(
      $grpc.ServiceCall call, $0.CreateVerificationCodeRequest request);
  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode(
      $grpc.ServiceCall call, $0.ListVerificationCodeRequest request);
  $async.Future<$0.GetVerificationCodeResponse> getVerificationCode(
      $grpc.ServiceCall call, $0.GetVerificationCodeRequest request);
  $async.Future<$0.UpdateVerificationCodeResponse> updateVerificationCode(
      $grpc.ServiceCall call, $0.UpdateVerificationCodeRequest request);
  $async.Future<$1.Empty> deleteVerificationCode(
      $grpc.ServiceCall call, $0.DeleteVerificationCodeRequest request);
  $async.Future<$0.SignInResponse> signIn(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.SignUpResponse> signUp(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.CheckSessionResponse> checkSession(
      $grpc.ServiceCall call, $0.CheckSessionRequest request);
  $async.Future<$1.Empty> userExists(
      $grpc.ServiceCall call, $0.UserExistsRequest request);
  $async.Stream<$0.UserExistsStreamResponse> userExistsStream(
      $grpc.ServiceCall call,
      $async.Stream<$0.UserExistsStreamRequest> request);
}

class BusinessServiceClient extends $grpc.Client {
  static final _$listBusiness =
      $grpc.ClientMethod<$0.ListBusinessRequest, $0.ListBusinessResponse>(
          '/BusinessService/ListBusiness',
          ($0.ListBusinessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListBusinessResponse.fromBuffer(value));
  static final _$getBusiness =
      $grpc.ClientMethod<$0.GetBusinessRequest, $0.GetBusinessResponse>(
          '/BusinessService/GetBusiness',
          ($0.GetBusinessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBusinessResponse.fromBuffer(value));

  BusinessServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListBusinessResponse> listBusiness(
      $0.ListBusinessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBusiness, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBusinessResponse> getBusiness(
      $0.GetBusinessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBusiness, request, options: options);
  }
}

abstract class BusinessServiceBase extends $grpc.Service {
  $core.String get $name => 'BusinessService';

  BusinessServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ListBusinessRequest, $0.ListBusinessResponse>(
            'ListBusiness',
            listBusiness_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListBusinessRequest.fromBuffer(value),
            ($0.ListBusinessResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetBusinessRequest, $0.GetBusinessResponse>(
            'GetBusiness',
            getBusiness_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetBusinessRequest.fromBuffer(value),
            ($0.GetBusinessResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListBusinessResponse> listBusiness_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListBusinessRequest> request) async {
    return listBusiness(call, await request);
  }

  $async.Future<$0.GetBusinessResponse> getBusiness_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBusinessRequest> request) async {
    return getBusiness(call, await request);
  }

  $async.Future<$0.ListBusinessResponse> listBusiness(
      $grpc.ServiceCall call, $0.ListBusinessRequest request);
  $async.Future<$0.GetBusinessResponse> getBusiness(
      $grpc.ServiceCall call, $0.GetBusinessRequest request);
}

class ObjectStorageServiceClient extends $grpc.Client {
  static final _$getPresignedPutObjectUserAvatar = $grpc.ClientMethod<
          $0.GetPresignedPutUserAvatarRequest,
          $0.GetPresignedPutUserAvatarResponse>(
      '/ObjectStorageService/GetPresignedPutObjectUserAvatar',
      ($0.GetPresignedPutUserAvatarRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetPresignedPutUserAvatarResponse.fromBuffer(value));

  ObjectStorageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetPresignedPutUserAvatarResponse>
      getPresignedPutObjectUserAvatar(
          $0.GetPresignedPutUserAvatarRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPresignedPutObjectUserAvatar, request,
        options: options);
  }
}

abstract class ObjectStorageServiceBase extends $grpc.Service {
  $core.String get $name => 'ObjectStorageService';

  ObjectStorageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetPresignedPutUserAvatarRequest,
            $0.GetPresignedPutUserAvatarResponse>(
        'GetPresignedPutObjectUserAvatar',
        getPresignedPutObjectUserAvatar_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPresignedPutUserAvatarRequest.fromBuffer(value),
        ($0.GetPresignedPutUserAvatarResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPresignedPutUserAvatarResponse>
      getPresignedPutObjectUserAvatar_Pre($grpc.ServiceCall call,
          $async.Future<$0.GetPresignedPutUserAvatarRequest> request) async {
    return getPresignedPutObjectUserAvatar(call, await request);
  }

  $async.Future<$0.GetPresignedPutUserAvatarResponse>
      getPresignedPutObjectUserAvatar(
          $grpc.ServiceCall call, $0.GetPresignedPutUserAvatarRequest request);
}

class HostnameServiceClient extends $grpc.Client {
  static final _$hostname =
      $grpc.ClientMethod<$0.HostnameRequest, $0.HostnameResponse>(
          '/HostnameService/hostname',
          ($0.HostnameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HostnameResponse.fromBuffer(value));

  HostnameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HostnameResponse> hostname($0.HostnameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hostname, request, options: options);
  }
}

abstract class HostnameServiceBase extends $grpc.Service {
  $core.String get $name => 'HostnameService';

  HostnameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HostnameRequest, $0.HostnameResponse>(
        'hostname',
        hostname_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HostnameRequest.fromBuffer(value),
        ($0.HostnameResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HostnameResponse> hostname_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HostnameRequest> request) async {
    return hostname(call, await request);
  }

  $async.Future<$0.HostnameResponse> hostname(
      $grpc.ServiceCall call, $0.HostnameRequest request);
}

class HealthClient extends $grpc.Client {
  static final _$check =
      $grpc.ClientMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
          '/Health/Check',
          ($0.HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HealthCheckResponse.fromBuffer(value));

  HealthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HealthCheckResponse> check(
      $0.HealthCheckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }
}

abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'Health';

  HealthServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.HealthCheckRequest, $0.HealthCheckResponse>(
            'Check',
            check_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.HealthCheckRequest.fromBuffer(value),
            ($0.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HealthCheckResponse> check_Pre($grpc.ServiceCall call,
      $async.Future<$0.HealthCheckRequest> request) async {
    return check(call, await request);
  }

  $async.Future<$0.HealthCheckResponse> check(
      $grpc.ServiceCall call, $0.HealthCheckRequest request);
}
