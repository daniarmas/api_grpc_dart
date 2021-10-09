// Mocks generated by Mockito 5.0.15 from annotations
// in api_grpc_dart/test/data/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:api_grpc_dart/core/utils/username_generator.dart' as _i8;
import 'package:api_grpc_dart/data/database/database.dart' as _i6;
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart'
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

class _FakeUser_0 extends _i1.Fake implements _i2.User {}

class _FakePostgreSQLConnection_1 extends _i1.Fake
    implements _i3.PostgreSQLConnection {}

/// A class which mocks [UserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalDataSource extends _i1.Mock
    implements _i4.UserLocalDataSource {
  MockUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.User> createUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #createUser, [], {#context: context, #data: data, #paths: paths}),
          returnValue:
              Future<_i2.User>.value(_FakeUser_0())) as _i5.Future<_i2.User>);
  @override
  _i5.Future<List<_i2.User>> listUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listUser, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i2.User>>.value(<_i2.User>[]))
          as _i5.Future<List<_i2.User>>);
  @override
  _i5.Future<List<_i2.User>> listUserInAliases(
          {_i3.PostgreSQLExecutionContext? context,
          List<String>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listUserInAliases, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i2.User>>.value(<_i2.User>[]))
          as _i5.Future<List<_i2.User>>);
  @override
  _i5.Future<_i2.User?> getUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getUser, [], {#context: context, #data: data, #paths: paths}),
          returnValue: Future<_i2.User?>.value()) as _i5.Future<_i2.User?>);
  @override
  _i5.Future<void> deleteUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteUser, [], {#context: context, #data: data}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
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
          List<_i7.Where>? where,
          List<String>? agregationMethods,
          int? limit,
          String? orderByAsc}) =>
      (super.noSuchMethod(
              Invocation.method(#list, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #where: where,
                #agregationMethods: agregationMethods,
                #limit: limit,
                #orderByAsc: orderByAsc
              }),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<Map<String, dynamic>?> get(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<String>? attributes,
          List<_i7.Where>? where,
          List<String>? agregationMethods}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [], {
                #context: context,
                #table: table,
                #attributes: attributes,
                #where: where,
                #agregationMethods: agregationMethods
              }),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<Map<String, dynamic>> create(
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          Map<String, dynamic>? data,
          List<String>? attributes}) =>
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
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          Map<String, dynamic>? data,
          List<_i7.Where>? where,
          List<String>? attributes}) =>
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
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<_i7.Where>? where}) =>
      (super.noSuchMethod(
          Invocation.method(
              #delete, [], {#context: context, #table: table, #where: where}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UsernameGenerator].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsernameGenerator extends _i1.Mock implements _i8.UsernameGenerator {
  MockUsernameGenerator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get separator =>
      (super.noSuchMethod(Invocation.getter(#separator), returnValue: '')
          as String);
  @override
  set separator(String? _separator) =>
      super.noSuchMethod(Invocation.setter(#separator, _separator),
          returnValueForMissingStub: null);
  @override
  List<String> get splitDate => (super
          .noSuchMethod(Invocation.getter(#splitDate), returnValue: <String>[])
      as List<String>);
  @override
  set splitDate(List<String>? _splitDate) =>
      super.noSuchMethod(Invocation.setter(#splitDate, _splitDate),
          returnValueForMissingStub: null);
  @override
  String generate(String? emailOrName,
          {List<String>? adjectives = const [],
          DateTime? date,
          bool? hasNumbers = true,
          int? numberSeed = 9999,
          String? prefix = r'',
          String? suffix = r'',
          bool? shortYear = true}) =>
      (super.noSuchMethod(
          Invocation.method(#generate, [
            emailOrName
          ], {
            #adjectives: adjectives,
            #date: date,
            #hasNumbers: hasNumbers,
            #numberSeed: numberSeed,
            #prefix: prefix,
            #suffix: suffix,
            #shortYear: shortYear
          }),
          returnValue: '') as String);
  @override
  String generateForName(String? firstName,
          {String? lastName = r'',
          List<String>? adjectives = const [],
          bool? hasNumbers = true,
          int? numberSeed = 100}) =>
      (super.noSuchMethod(
          Invocation.method(#generateForName, [
            firstName
          ], {
            #lastName: lastName,
            #adjectives: adjectives,
            #hasNumbers: hasNumbers,
            #numberSeed: numberSeed
          }),
          returnValue: '') as String);
  @override
  List<String> generateList(String? emailOrName,
          {List<String>? adjectives = const [],
          DateTime? date,
          bool? hasNumbers = true,
          int? numberSeed = 100,
          String? prefix = r'',
          String? suffix = r'',
          bool? shortYear = true,
          int? length = 1}) =>
      (super.noSuchMethod(
          Invocation.method(#generateList, [
            emailOrName
          ], {
            #adjectives: adjectives,
            #date: date,
            #hasNumbers: hasNumbers,
            #numberSeed: numberSeed,
            #prefix: prefix,
            #suffix: suffix,
            #shortYear: shortYear,
            #length: length
          }),
          returnValue: <String>[]) as List<String>);
  @override
  List<String> generateListForName(String? firstName,
          {String? lastName = r'',
          List<String>? adjectives = const [],
          bool? hasNumbers = true,
          int? numberSeed = 100,
          int? length = 1}) =>
      (super.noSuchMethod(
          Invocation.method(#generateListForName, [
            firstName
          ], {
            #lastName: lastName,
            #adjectives: adjectives,
            #hasNumbers: hasNumbers,
            #numberSeed: numberSeed,
            #length: length
          }),
          returnValue: <String>[]) as List<String>);
  @override
  String toString() => super.toString();
}