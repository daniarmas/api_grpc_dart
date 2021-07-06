///
//  Generated code. Do not modify.
//  source: grpc/main.proto
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
