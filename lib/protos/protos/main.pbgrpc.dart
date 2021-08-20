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

  $async.Future<$0.CreateVerificationCodeResponse> createVerificationCode(
      $grpc.ServiceCall call, $0.CreateVerificationCodeRequest request);
  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode(
      $grpc.ServiceCall call, $0.ListVerificationCodeRequest request);
  $async.Future<$0.GetVerificationCodeResponse> getVerificationCode(
      $grpc.ServiceCall call, $0.GetVerificationCodeRequest request);
}
