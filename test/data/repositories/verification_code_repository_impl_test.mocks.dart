// Mocks generated by Mockito 5.0.15 from annotations
// in api_grpc_dart/test/data/repositories/verification_code_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:api_grpc_dart/data/database/database.dart' as _i6;
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart'
    as _i4;
import 'package:api_grpc_dart/protos/protos/main.pb.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:postgres/postgres.dart' as _i3;
import 'package:postgres_dao/postgres_dao.dart' as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeVerificationCode_0 extends _i1.Fake implements _i2.VerificationCode {
}

class _FakePostgreSQLConnection_1 extends _i1.Fake
    implements _i3.PostgreSQLConnection {}

class _FakePostgreSQLResult_2 extends _i1.Fake implements _i3.PostgreSQLResult {
}

/// A class which mocks [VerificationCodeLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerificationCodeLocalDataSource extends _i1.Mock
    implements _i4.VerificationCodeLocalDataSource {
  MockVerificationCodeLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.VerificationCode> createVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#createVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue:
                  Future<_i2.VerificationCode>.value(_FakeVerificationCode_0()))
          as _i5.Future<_i2.VerificationCode>);
  @override
  _i5.Future<List<_i2.VerificationCode>> listVerificationCode(
          {_i3.PostgreSQLExecutionContext? context, List<String>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #listVerificationCode, [], {#context: context, #paths: paths}),
          returnValue: Future<List<_i2.VerificationCode>>.value(
              <_i2.VerificationCode>[])) as _i5
          .Future<List<_i2.VerificationCode>>);
  @override
  _i5.Future<List<_i2.VerificationCode>> listVerificationCodeReturnIds(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
              Invocation.method(#listVerificationCodeReturnIds, [],
                  {#context: context, #data: data}),
              returnValue: Future<List<_i2.VerificationCode>>.value(
                  <_i2.VerificationCode>[]))
          as _i5.Future<List<_i2.VerificationCode>>);
  @override
  _i5.Future<_i2.VerificationCode> getVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue:
                  Future<_i2.VerificationCode>.value(_FakeVerificationCode_0()))
          as _i5.Future<_i2.VerificationCode>);
  @override
  _i5.Future<void> deleteVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteVerificationCode, [], {#context: context, #data: data}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<bool> deleteVerificationCodeBeforeCreateVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteVerificationCodeBeforeCreateVerificationCode,
              [], {#context: context, #data: data}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i6.Database {
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
  _i5.Future<_i3.PostgreSQLConnection> getConnection() =>
      (super.noSuchMethod(Invocation.method(#getConnection, []),
              returnValue: Future<_i3.PostgreSQLConnection>.value(
                  _FakePostgreSQLConnection_1()))
          as _i5.Future<_i3.PostgreSQLConnection>);
  @override
  _i5.Future<List<Map<String, dynamic>>> list(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<String>? attributes,
          List<String>? agregationMethods,
          int? limit,
          List<_i7.Where>? where,
          String? orderByAsc}) =>
      (super.noSuchMethod(
              Invocation.method(#list, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #agregationMethods: agregationMethods,
                #limit: limit,
                #where: where,
                #orderByAsc: orderByAsc
              }),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<Map<String, dynamic>> get(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<String>? attributes,
          List<String>? agregationMethods,
          List<_i7.Where>? where}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #agregationMethods: agregationMethods,
                #where: where
              }),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> create(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#create, [], {
                #context: context,
                #table: table,
                #data: data,
                #paths: paths
              }),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<Map<String, dynamic>> update(dynamic object) =>
      (super.noSuchMethod(Invocation.method(#update, [object]),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i5.Future<Map<String, dynamic>>);
  @override
  _i5.Future<void> delete(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<_i7.Where>? where}) =>
      (super.noSuchMethod(
          Invocation.method(
              #delete, [], {#context: context, #table: table, #where: where}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [PostgreSQLConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostgreSQLConnection extends _i1.Mock
    implements _i3.PostgreSQLConnection {
  MockPostgreSQLConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get host =>
      (super.noSuchMethod(Invocation.getter(#host), returnValue: '') as String);
  @override
  int get port =>
      (super.noSuchMethod(Invocation.getter(#port), returnValue: 0) as int);
  @override
  String get databaseName =>
      (super.noSuchMethod(Invocation.getter(#databaseName), returnValue: '')
          as String);
  @override
  bool get useSSL =>
      (super.noSuchMethod(Invocation.getter(#useSSL), returnValue: false)
          as bool);
  @override
  int get timeoutInSeconds =>
      (super.noSuchMethod(Invocation.getter(#timeoutInSeconds), returnValue: 0)
          as int);
  @override
  int get queryTimeoutInSeconds =>
      (super.noSuchMethod(Invocation.getter(#queryTimeoutInSeconds),
          returnValue: 0) as int);
  @override
  String get timeZone =>
      (super.noSuchMethod(Invocation.getter(#timeZone), returnValue: '')
          as String);
  @override
  bool get isUnixSocket =>
      (super.noSuchMethod(Invocation.getter(#isUnixSocket), returnValue: false)
          as bool);
  @override
  Map<String, String> get settings =>
      (super.noSuchMethod(Invocation.getter(#settings),
          returnValue: <String, String>{}) as Map<String, String>);
  @override
  int get processID =>
      (super.noSuchMethod(Invocation.getter(#processID), returnValue: 0)
          as int);
  @override
  _i5.Stream<_i3.Notification> get notifications =>
      (super.noSuchMethod(Invocation.getter(#notifications),
              returnValue: Stream<_i3.Notification>.empty())
          as _i5.Stream<_i3.Notification>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  int get queueSize =>
      (super.noSuchMethod(Invocation.getter(#queueSize), returnValue: 0)
          as int);
  @override
  _i5.Future<dynamic> open() =>
      (super.noSuchMethod(Invocation.method(#open, []),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> close() =>
      (super.noSuchMethod(Invocation.method(#close, []),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> transaction(
          _i5.Future<dynamic> Function(_i3.PostgreSQLExecutionContext)?
              queryBlock,
          {int? commitTimeoutInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(#transaction, [queryBlock],
              {#commitTimeoutInSeconds: commitTimeoutInSeconds}),
          returnValue: Future<dynamic>.value()) as _i5.Future<dynamic>);
  @override
  void cancelTransaction({String? reason}) => super.noSuchMethod(
      Invocation.method(#cancelTransaction, [], {#reason: reason}),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
  @override
  _i5.Future<_i3.PostgreSQLResult> query(String? fmtString,
          {Map<String, dynamic>? substitutionValues,
          bool? allowReuse,
          int? timeoutInSeconds}) =>
      (super.noSuchMethod(
              Invocation.method(#query, [
                fmtString
              ], {
                #substitutionValues: substitutionValues,
                #allowReuse: allowReuse,
                #timeoutInSeconds: timeoutInSeconds
              }),
              returnValue:
                  Future<_i3.PostgreSQLResult>.value(_FakePostgreSQLResult_2()))
          as _i5.Future<_i3.PostgreSQLResult>);
  @override
  _i5.Future<List<Map<String, Map<String, dynamic>>>> mappedResultsQuery(
          String? fmtString,
          {Map<String, dynamic>? substitutionValues = const {},
          bool? allowReuse,
          int? timeoutInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(#mappedResultsQuery, [
            fmtString
          ], {
            #substitutionValues: substitutionValues,
            #allowReuse: allowReuse,
            #timeoutInSeconds: timeoutInSeconds
          }),
          returnValue: Future<List<Map<String, Map<String, dynamic>>>>.value(
              <Map<String, Map<String, dynamic>>>[])) as _i5
          .Future<List<Map<String, Map<String, dynamic>>>>);
  @override
  _i5.Future<int> execute(String? fmtString,
          {Map<String, dynamic>? substitutionValues = const {},
          int? timeoutInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(#execute, [
            fmtString
          ], {
            #substitutionValues: substitutionValues,
            #timeoutInSeconds: timeoutInSeconds
          }),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
}

/// A class which mocks [PostgreSQLExecutionContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostgreSQLExecutionContext extends _i1.Mock
    implements _i3.PostgreSQLExecutionContext {
  MockPostgreSQLExecutionContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get queueSize =>
      (super.noSuchMethod(Invocation.getter(#queueSize), returnValue: 0)
          as int);
  @override
  _i5.Future<_i3.PostgreSQLResult> query(String? fmtString,
          {Map<String, dynamic>? substitutionValues,
          bool? allowReuse,
          int? timeoutInSeconds}) =>
      (super.noSuchMethod(
              Invocation.method(#query, [
                fmtString
              ], {
                #substitutionValues: substitutionValues,
                #allowReuse: allowReuse,
                #timeoutInSeconds: timeoutInSeconds
              }),
              returnValue:
                  Future<_i3.PostgreSQLResult>.value(_FakePostgreSQLResult_2()))
          as _i5.Future<_i3.PostgreSQLResult>);
  @override
  _i5.Future<int> execute(String? fmtString,
          {Map<String, dynamic>? substitutionValues, int? timeoutInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(#execute, [
            fmtString
          ], {
            #substitutionValues: substitutionValues,
            #timeoutInSeconds: timeoutInSeconds
          }),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  void cancelTransaction({String? reason}) => super.noSuchMethod(
      Invocation.method(#cancelTransaction, [], {#reason: reason}),
      returnValueForMissingStub: null);
  @override
  _i5.Future<List<Map<String, Map<String, dynamic>>>> mappedResultsQuery(
          String? fmtString,
          {Map<String, dynamic>? substitutionValues,
          bool? allowReuse,
          int? timeoutInSeconds}) =>
      (super.noSuchMethod(
          Invocation.method(#mappedResultsQuery, [
            fmtString
          ], {
            #substitutionValues: substitutionValues,
            #allowReuse: allowReuse,
            #timeoutInSeconds: timeoutInSeconds
          }),
          returnValue: Future<List<Map<String, Map<String, dynamic>>>>.value(
              <Map<String, Map<String, dynamic>>>[])) as _i5
          .Future<List<Map<String, Map<String, dynamic>>>>);
  @override
  String toString() => super.toString();
}
