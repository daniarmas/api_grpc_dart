// Mocks generated by Mockito 5.0.10 from annotations
// in api_grpc_dart/test/data/datasources/list_business_local_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:api_grpc_dart/data/database/database.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:postgres_dao/where.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i2.Database {
  MockDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> connect() =>
      (super.noSuchMethod(Invocation.method(#connect, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<dynamic>> list(
          {String? table,
          List<String>? attributes,
          List<String>? agregationMethods,
          int? limit,
          List<_i4.Where>? where,
          String? orderByAsc}) =>
      (super.noSuchMethod(
              Invocation.method(#list, [], {
                #table: table,
                #attributes: attributes,
                #agregationMethods: agregationMethods,
                #limit: limit,
                #where: where,
                #orderByAsc: orderByAsc
              }),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
          as _i3.Future<List<dynamic>>);
  @override
  _i3.Future<dynamic> get() => (super.noSuchMethod(Invocation.method(#get, []),
      returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<Map<String, dynamic>> create(
          {String? table, Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
              Invocation.method(#create, [], {#table: table, #data: data}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i3.Future<Map<String, dynamic>>);
  @override
  _i3.Future<dynamic> update(dynamic object) =>
      (super.noSuchMethod(Invocation.method(#update, [object]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  void delete(String? id) =>
      super.noSuchMethod(Invocation.method(#delete, [id]),
          returnValueForMissingStub: null);
}
