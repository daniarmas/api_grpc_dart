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
  static final _$createVerificationCode =
      $grpc.ClientMethod<$0.CreateVerificationCodeRequest, $1.Empty>(
          '/AuthenticationService/CreateVerificationCode',
          ($0.CreateVerificationCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$listVerificationCode = $grpc.ClientMethod<
          $0.ListVerificationCodeRequest, $0.ListVerificationCodeResponse>(
      '/AuthenticationService/ListVerificationCode',
      ($0.ListVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ListVerificationCodeResponse.fromBuffer(value));
  static final _$getVerificationCode =
      $grpc.ClientMethod<$0.GetVerificationCodeRequest, $1.Empty>(
          '/AuthenticationService/GetVerificationCode',
          ($0.GetVerificationCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
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
  static final _$signOut = $grpc.ClientMethod<$0.SignOutRequest, $1.Empty>(
      '/AuthenticationService/SignOut',
      ($0.SignOutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$checkSession =
      $grpc.ClientMethod<$0.CheckSessionRequest, $0.CheckSessionResponse>(
          '/AuthenticationService/CheckSession',
          ($0.CheckSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CheckSessionResponse.fromBuffer(value));
  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
          '/AuthenticationService/RefreshToken',
          ($0.RefreshTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RefreshTokenResponse.fromBuffer(value));
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
  static final _$listSession =
      $grpc.ClientMethod<$0.ListSessionRequest, $0.ListSessionResponse>(
          '/AuthenticationService/ListSession',
          ($0.ListSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListSessionResponse.fromBuffer(value));

  AuthenticationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> createVerificationCode(
      $0.CreateVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createVerificationCode, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListVerificationCodeResponse> listVerificationCode(
      $0.ListVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> getVerificationCode(
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

  $grpc.ResponseFuture<$1.Empty> signOut($0.SignOutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signOut, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckSessionResponse> checkSession(
      $0.CheckSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshTokenResponse> refreshToken(
      $0.RefreshTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
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

  $grpc.ResponseFuture<$0.ListSessionResponse> listSession(
      $0.ListSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listSession, request, options: options);
  }
}

abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthenticationService';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateVerificationCodeRequest, $1.Empty>(
        'CreateVerificationCode',
        createVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateVerificationCodeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListVerificationCodeRequest,
            $0.ListVerificationCodeResponse>(
        'ListVerificationCode',
        listVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListVerificationCodeRequest.fromBuffer(value),
        ($0.ListVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetVerificationCodeRequest, $1.Empty>(
        'GetVerificationCode',
        getVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetVerificationCodeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.SignOutRequest, $1.Empty>(
        'SignOut',
        signOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignOutRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CheckSessionRequest, $0.CheckSessionResponse>(
            'CheckSession',
            checkSession_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CheckSessionRequest.fromBuffer(value),
            ($0.CheckSessionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
            'RefreshToken',
            refreshToken_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RefreshTokenRequest.fromBuffer(value),
            ($0.RefreshTokenResponse value) => value.writeToBuffer()));
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
    $addMethod(
        $grpc.ServiceMethod<$0.ListSessionRequest, $0.ListSessionResponse>(
            'ListSession',
            listSession_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListSessionRequest.fromBuffer(value),
            ($0.ListSessionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> createVerificationCode_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateVerificationCodeRequest> request) async {
    return createVerificationCode(call, await request);
  }

  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListVerificationCodeRequest> request) async {
    return listVerificationCode(call, await request);
  }

  $async.Future<$1.Empty> getVerificationCode_Pre($grpc.ServiceCall call,
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

  $async.Future<$1.Empty> signOut_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignOutRequest> request) async {
    return signOut(call, await request);
  }

  $async.Future<$0.CheckSessionResponse> checkSession_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CheckSessionRequest> request) async {
    return checkSession(call, await request);
  }

  $async.Future<$0.RefreshTokenResponse> refreshToken_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RefreshTokenRequest> request) async {
    return refreshToken(call, await request);
  }

  $async.Future<$1.Empty> userExists_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserExistsRequest> request) async {
    return userExists(call, await request);
  }

  $async.Future<$0.ListSessionResponse> listSession_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListSessionRequest> request) async {
    return listSession(call, await request);
  }

  $async.Future<$1.Empty> createVerificationCode(
      $grpc.ServiceCall call, $0.CreateVerificationCodeRequest request);
  $async.Future<$0.ListVerificationCodeResponse> listVerificationCode(
      $grpc.ServiceCall call, $0.ListVerificationCodeRequest request);
  $async.Future<$1.Empty> getVerificationCode(
      $grpc.ServiceCall call, $0.GetVerificationCodeRequest request);
  $async.Future<$0.UpdateVerificationCodeResponse> updateVerificationCode(
      $grpc.ServiceCall call, $0.UpdateVerificationCodeRequest request);
  $async.Future<$1.Empty> deleteVerificationCode(
      $grpc.ServiceCall call, $0.DeleteVerificationCodeRequest request);
  $async.Future<$0.SignInResponse> signIn(
      $grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.SignUpResponse> signUp(
      $grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$1.Empty> signOut(
      $grpc.ServiceCall call, $0.SignOutRequest request);
  $async.Future<$0.CheckSessionResponse> checkSession(
      $grpc.ServiceCall call, $0.CheckSessionRequest request);
  $async.Future<$0.RefreshTokenResponse> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenRequest request);
  $async.Future<$1.Empty> userExists(
      $grpc.ServiceCall call, $0.UserExistsRequest request);
  $async.Stream<$0.UserExistsStreamResponse> userExistsStream(
      $grpc.ServiceCall call,
      $async.Stream<$0.UserExistsStreamRequest> request);
  $async.Future<$0.ListSessionResponse> listSession(
      $grpc.ServiceCall call, $0.ListSessionRequest request);
}

class BusinessServiceClient extends $grpc.Client {
  static final _$feed = $grpc.ClientMethod<$0.FeedRequest, $0.FeedResponse>(
      '/BusinessService/Feed',
      ($0.FeedRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FeedResponse.fromBuffer(value));
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

  $grpc.ResponseFuture<$0.FeedResponse> feed($0.FeedRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$feed, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.FeedRequest, $0.FeedResponse>(
        'Feed',
        feed_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FeedRequest.fromBuffer(value),
        ($0.FeedResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.FeedResponse> feed_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FeedRequest> request) async {
    return feed(call, await request);
  }

  $async.Future<$0.GetBusinessResponse> getBusiness_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBusinessRequest> request) async {
    return getBusiness(call, await request);
  }

  $async.Future<$0.FeedResponse> feed(
      $grpc.ServiceCall call, $0.FeedRequest request);
  $async.Future<$0.GetBusinessResponse> getBusiness(
      $grpc.ServiceCall call, $0.GetBusinessRequest request);
}

class ItemServiceClient extends $grpc.Client {
  static final _$listItem =
      $grpc.ClientMethod<$0.ListItemRequest, $0.ListItemResponse>(
          '/ItemService/ListItem',
          ($0.ListItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListItemResponse.fromBuffer(value));
  static final _$getItem =
      $grpc.ClientMethod<$0.GetItemRequest, $0.GetItemResponse>(
          '/ItemService/GetItem',
          ($0.GetItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetItemResponse.fromBuffer(value));
  static final _$searchItem =
      $grpc.ClientMethod<$0.SearchItemRequest, $0.SearchItemResponse>(
          '/ItemService/SearchItem',
          ($0.SearchItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SearchItemResponse.fromBuffer(value));

  ItemServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListItemResponse> listItem($0.ListItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetItemResponse> getItem($0.GetItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchItemResponse> searchItem(
      $0.SearchItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchItem, request, options: options);
  }
}

abstract class ItemServiceBase extends $grpc.Service {
  $core.String get $name => 'ItemService';

  ItemServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListItemRequest, $0.ListItemResponse>(
        'ListItem',
        listItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListItemRequest.fromBuffer(value),
        ($0.ListItemResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetItemRequest, $0.GetItemResponse>(
        'GetItem',
        getItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetItemRequest.fromBuffer(value),
        ($0.GetItemResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchItemRequest, $0.SearchItemResponse>(
        'SearchItem',
        searchItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchItemRequest.fromBuffer(value),
        ($0.SearchItemResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListItemResponse> listItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListItemRequest> request) async {
    return listItem(call, await request);
  }

  $async.Future<$0.GetItemResponse> getItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetItemRequest> request) async {
    return getItem(call, await request);
  }

  $async.Future<$0.SearchItemResponse> searchItem_Pre($grpc.ServiceCall call,
      $async.Future<$0.SearchItemRequest> request) async {
    return searchItem(call, await request);
  }

  $async.Future<$0.ListItemResponse> listItem(
      $grpc.ServiceCall call, $0.ListItemRequest request);
  $async.Future<$0.GetItemResponse> getItem(
      $grpc.ServiceCall call, $0.GetItemRequest request);
  $async.Future<$0.SearchItemResponse> searchItem(
      $grpc.ServiceCall call, $0.SearchItemRequest request);
}

class UserServiceClient extends $grpc.Client {
  static final _$updateUser =
      $grpc.ClientMethod<$0.UpdateUserRequest, $0.UpdateUserResponse>(
          '/UserService/UpdateUser',
          ($0.UpdateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateUserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UpdateUserResponse> updateUser(
      $0.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UpdateUserRequest, $0.UpdateUserResponse>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserRequest.fromBuffer(value),
        ($0.UpdateUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UpdateUserResponse> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.UpdateUserResponse> updateUser(
      $grpc.ServiceCall call, $0.UpdateUserRequest request);
}

class OrderServiceClient extends $grpc.Client {
  static final _$listOrder =
      $grpc.ClientMethod<$0.ListOrderRequest, $0.ListOrderResponse>(
          '/OrderService/ListOrder',
          ($0.ListOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListOrderResponse.fromBuffer(value));
  static final _$getOrder =
      $grpc.ClientMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
          '/OrderService/GetOrder',
          ($0.GetOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetOrderResponse.fromBuffer(value));

  OrderServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListOrderResponse> listOrder(
      $0.ListOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOrderResponse> getOrder($0.GetOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrder, request, options: options);
  }
}

abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'OrderService';

  OrderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListOrderRequest, $0.ListOrderResponse>(
        'ListOrder',
        listOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListOrderRequest.fromBuffer(value),
        ($0.ListOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
        'GetOrder',
        getOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.GetOrderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListOrderResponse> listOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListOrderRequest> request) async {
    return listOrder(call, await request);
  }

  $async.Future<$0.GetOrderResponse> getOrder_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetOrderRequest> request) async {
    return getOrder(call, await request);
  }

  $async.Future<$0.ListOrderResponse> listOrder(
      $grpc.ServiceCall call, $0.ListOrderRequest request);
  $async.Future<$0.GetOrderResponse> getOrder(
      $grpc.ServiceCall call, $0.GetOrderRequest request);
}

class CartItemServiceClient extends $grpc.Client {
  static final _$listCartItem =
      $grpc.ClientMethod<$0.ListCartItemRequest, $0.ListCartItemResponse>(
          '/CartItemService/ListCartItem',
          ($0.ListCartItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListCartItemResponse.fromBuffer(value));
  static final _$getCartItem =
      $grpc.ClientMethod<$0.GetCartItemRequest, $0.GetCartItemResponse>(
          '/CartItemService/GetCartItem',
          ($0.GetCartItemRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetCartItemResponse.fromBuffer(value));

  CartItemServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListCartItemResponse> listCartItem(
      $0.ListCartItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listCartItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCartItemResponse> getCartItem(
      $0.GetCartItemRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCartItem, request, options: options);
  }
}

abstract class CartItemServiceBase extends $grpc.Service {
  $core.String get $name => 'CartItemService';

  CartItemServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ListCartItemRequest, $0.ListCartItemResponse>(
            'ListCartItem',
            listCartItem_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListCartItemRequest.fromBuffer(value),
            ($0.ListCartItemResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetCartItemRequest, $0.GetCartItemResponse>(
            'GetCartItem',
            getCartItem_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetCartItemRequest.fromBuffer(value),
            ($0.GetCartItemResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListCartItemResponse> listCartItem_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListCartItemRequest> request) async {
    return listCartItem(call, await request);
  }

  $async.Future<$0.GetCartItemResponse> getCartItem_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetCartItemRequest> request) async {
    return getCartItem(call, await request);
  }

  $async.Future<$0.ListCartItemResponse> listCartItem(
      $grpc.ServiceCall call, $0.ListCartItemRequest request);
  $async.Future<$0.GetCartItemResponse> getCartItem(
      $grpc.ServiceCall call, $0.GetCartItemRequest request);
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
