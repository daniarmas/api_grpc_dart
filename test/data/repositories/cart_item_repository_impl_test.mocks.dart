// Mocks generated by Mockito 5.0.15 from annotations
// in api_grpc_dart/test/data/repositories/cart_item_repository_impl_test.dart.
// Do not manually edit this file.

// Dart imports:
import 'dart:async' as _i5;

// Package imports:
import 'package:mockito/mockito.dart' as _i1;
import 'package:postgres/postgres.dart' as _i2;
import 'package:postgres_conector/postgres_conector.dart' as _i6;

// Project imports:
import 'package:api_grpc_dart/core/utils/json_web_token.dart' as _i9;
import 'package:api_grpc_dart/data/database/database.dart' as _i7;
import 'package:api_grpc_dart/protos/protos/main.pb.dart' as _i3;

import 'package:api_grpc_dart/data/datasources/authorization_token_local_data_source.dart'
    as _i8;
import 'package:api_grpc_dart/data/datasources/cart_item_local_data_source.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakePostgreSQLConnection_0 extends _i1.Fake
    implements _i2.PostgreSQLConnection {}

class _FakeAuthorizationToken_1 extends _i1.Fake
    implements _i3.AuthorizationToken {}

/// A class which mocks [CartItemLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartItemLocalDataSource extends _i1.Mock
    implements _i4.CartItemLocalDataSource {
  MockCartItemLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.Item>> listCartItem(
          {_i2.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listCartItem, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i3.Item>>.value(<_i3.Item>[]))
          as _i5.Future<List<_i3.Item>>);
  @override
  _i5.Future<_i3.Item?> getCartItem(
          {_i2.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(#getCartItem, [],
              {#context: context, #data: data, #paths: paths}),
          returnValue: Future<_i3.Item?>.value()) as _i5.Future<_i3.Item?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i7.Database {
  MockDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> connect() =>
      (super.noSuchMethod(Invocation.method(#connect, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i5.Future<_i2.PostgreSQLConnection> getConnection() =>
      (super.noSuchMethod(Invocation.method(#getConnection, []),
              returnValue: Future<_i2.PostgreSQLConnection>.value(
                  _FakePostgreSQLConnection_0()))
          as _i5.Future<_i2.PostgreSQLConnection>);
  @override
  _i5.Future<List<Map<String, dynamic>>> list(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          List<_i6.Attribute>? attributes,
          List<_i6.Where>? where,
          _i6.InnerJoin? innerJoin,
          List<String>? agregationMethods,
          int? limit,
          _i6.OrderBy? orderBy}) =>
      (super.noSuchMethod(
              Invocation.method(#list, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #where: where,
                #innerJoin: innerJoin,
                #agregationMethods: agregationMethods,
                #limit: limit,
                #orderBy: orderBy
              }),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> search(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          List<_i6.Where>? where,
          List<_i6.Attribute>? attributes,
          _i6.InnerJoin? innerJoin,
          int? limit,
          _i6.OrderBy? orderBy,
          List<String>? agregationMethods}) =>
      (super.noSuchMethod(
              Invocation.method(#search, [], {
                #context: context,
                #table: table,
                #where: where,
                #attributes: attributes,
                #innerJoin: innerJoin,
                #limit: limit,
                #orderBy: orderBy,
                #agregationMethods: agregationMethods
              }),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<Map<String, dynamic>?> get(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          List<_i6.Attribute>? attributes,
          List<_i6.Where>? where,
          _i6.InnerJoin? innerJoin,
          List<String>? agregationMethods}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #where: where,
                #innerJoin: innerJoin,
                #agregationMethods: agregationMethods
              }),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<Map<String, dynamic>> create(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? attributes}) =>
      (super.noSuchMethod(
              Invocation.method(#create, [], {
                #context: context,
                #table: table,
                #data: data,
                #attributes: attributes
              }),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>?> update(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          Map<String, dynamic>? data,
          List<_i6.Where>? where,
          List<_i6.Attribute>? attributes}) =>
      (super.noSuchMethod(
              Invocation.method(#update, [], {
                #context: context,
                #table: table,
                #data: data,
                #where: where,
                #attributes: attributes
              }),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<bool> delete(
          {_i2.PostgreSQLExecutionContext? context,
          String? table,
          List<_i6.Where>? where}) =>
      (super.noSuchMethod(
          Invocation.method(
              #delete, [], {#context: context, #table: table, #where: where}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AuthorizationTokenLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthorizationTokenLocalDataSource extends _i1.Mock
    implements _i8.AuthorizationTokenLocalDataSource {
  MockAuthorizationTokenLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.AuthorizationToken> createAuthorizationToken(
          {_i2.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#createAuthorizationToken, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i3.AuthorizationToken>.value(
                  _FakeAuthorizationToken_1()))
          as _i5.Future<_i3.AuthorizationToken>);
  @override
  _i5.Future<List<_i3.AuthorizationToken>> listAuthorizationToken(
          {_i2.PostgreSQLExecutionContext? context,
          List<_i6.Attribute>? paths,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
              Invocation.method(#listAuthorizationToken, [],
                  {#context: context, #paths: paths, #data: data}),
              returnValue: Future<List<_i3.AuthorizationToken>>.value(
                  <_i3.AuthorizationToken>[]))
          as _i5.Future<List<_i3.AuthorizationToken>>);
  @override
  _i5.Future<_i3.AuthorizationToken?> getAuthorizationToken(
          {_i2.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getAuthorizationToken, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i3.AuthorizationToken?>.value())
          as _i5.Future<_i3.AuthorizationToken?>);
  @override
  _i5.Future<bool> deleteAuthorizationToken(
          {_i2.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteAuthorizationToken, [], {#context: context, #data: data}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [JsonWebToken].
///
/// See the documentation for Mockito's code generation for more information.
class MockJsonWebToken extends _i1.Mock implements _i9.JsonWebToken {
  MockJsonWebToken() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String generateAuthorizationToken({Map<String, dynamic>? payload}) =>
      (super.noSuchMethod(
          Invocation.method(
              #generateAuthorizationToken, [], {#payload: payload}),
          returnValue: '') as String);
  @override
  String generateRefreshToken({Map<String, dynamic>? payload}) =>
      (super.noSuchMethod(
          Invocation.method(#generateRefreshToken, [], {#payload: payload}),
          returnValue: '') as String);
  @override
  Map<String, dynamic> verify(String? token, String? tokenName) =>
      (super.noSuchMethod(Invocation.method(#verify, [token, tokenName]),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  String toString() => super.toString();
}
