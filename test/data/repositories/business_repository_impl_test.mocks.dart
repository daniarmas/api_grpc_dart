// Mocks generated by Mockito 5.0.15 from annotations
// in api_grpc_dart/test/data/repositories/business_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:api_grpc_dart/data/datasources/business_local_data_source.dart'
    as _i3;
import 'package:api_grpc_dart/protos/protos/main.pb.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:postgres/postgres.dart' as _i5;
import 'package:postgres_dao/postgres_dao.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeFeedResponse_0 extends _i1.Fake implements _i2.FeedResponse {}

/// A class which mocks [BusinessLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBusinessLocalDataSource extends _i1.Mock
    implements _i3.BusinessLocalDataSource {
  MockBusinessLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FeedResponse> feed(
          {_i5.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #feed, [], {#context: context, #data: data, #paths: paths}),
              returnValue:
                  Future<_i2.FeedResponse>.value(_FakeFeedResponse_0()))
          as _i4.Future<_i2.FeedResponse>);
  @override
  _i4.Future<_i2.Business?> getBusiness(
          {_i5.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getBusiness, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.Business?>.value())
          as _i4.Future<_i2.Business?>);
  @override
  String toString() => super.toString();
}
