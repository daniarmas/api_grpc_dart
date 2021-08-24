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

class BusinessServiceClient extends $grpc.Client {
  static final _$listBusiness =
      $grpc.ClientMethod<$0.ListBusinessRequest, $0.ListBusinessResponse>(
          '/BusinessService/ListBusiness',
          ($0.ListBusinessRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListBusinessResponse.fromBuffer(value));

  BusinessServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListBusinessResponse> listBusiness(
      $0.ListBusinessRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBusiness, request, options: options);
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
  }

  $async.Future<$0.ListBusinessResponse> listBusiness_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListBusinessRequest> request) async {
    return listBusiness(call, await request);
  }

  $async.Future<$0.ListBusinessResponse> listBusiness(
      $grpc.ServiceCall call, $0.ListBusinessRequest request);
}

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
  static final _$deleteVerificationCode =
      $grpc.ClientMethod<$0.DeleteVerificationCodeRequest, $1.Empty>(
          '/AuthenticationService/DeleteVerificationCode',
          ($0.DeleteVerificationCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

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

  $grpc.ResponseFuture<$1.Empty> deleteVerificationCode(
      $0.DeleteVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteVerificationCode, request,
        options: options);
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
    $addMethod($grpc.ServiceMethod<$0.DeleteVerificationCodeRequest, $1.Empty>(
        'DeleteVerificationCode',
        deleteVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteVerificationCodeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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

  $async.Future<$1.Empty> deleteVerificationCode_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteVerificationCodeRequest> request) async {
    return deleteVerificationCode(call, await request);
  }

  $async.Future<$0.CreateVerificationCodeResponse> createVerificationCode(
      $grpc.ServiceCall call, $0.CreateVerificationCodeRequest request);
  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode(
      $grpc.ServiceCall call, $0.ListVerificationCodeRequest request);
  $async.Future<$0.GetVerificationCodeResponse> getVerificationCode(
      $grpc.ServiceCall call, $0.GetVerificationCodeRequest request);
  $async.Future<$1.Empty> deleteVerificationCode(
      $grpc.ServiceCall call, $0.DeleteVerificationCodeRequest request);
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
