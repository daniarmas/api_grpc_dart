// Mocks generated by Mockito 5.0.15 from annotations
// in api_grpc_dart/test/data/repositories/verification_code_repository_impl_test.dart.
// Do not manually edit this file.

// Dart imports:
import 'dart:async' as _i5;

// Package imports:
import 'package:mockito/mockito.dart' as _i1;
import 'package:postgres/postgres.dart' as _i3;
import 'package:postgres_conector/postgres_conector.dart' as _i6;

// Project imports:
import 'package:api_grpc_dart/data/database/database.dart' as _i11;
import 'package:api_grpc_dart/data/email/emailer.dart' as _i10;
import 'package:api_grpc_dart/protos/protos/main.pb.dart' as _i2;

import 'package:api_grpc_dart/data/datasources/banned_device_local_data_source.dart'
    as _i9;
import 'package:api_grpc_dart/data/datasources/banned_user_local_data_source.dart'
    as _i8;
import 'package:api_grpc_dart/data/datasources/user_local_data_source.dart'
    as _i7;
import 'package:api_grpc_dart/data/datasources/verification_code_local_data_source.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeVerificationCode_0 extends _i1.Fake implements _i2.VerificationCode {
}

class _FakeUser_1 extends _i1.Fake implements _i2.User {}

class _FakeBannedUser_2 extends _i1.Fake implements _i2.BannedUser {}

class _FakeBannedDevice_3 extends _i1.Fake implements _i2.BannedDevice {}

class _FakePostgreSQLConnection_4 extends _i1.Fake
    implements _i3.PostgreSQLConnection {}

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
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#createVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue:
                  Future<_i2.VerificationCode>.value(_FakeVerificationCode_0()))
          as _i5.Future<_i2.VerificationCode>);
  @override
  _i5.Future<List<_i2.VerificationCode>> listVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i2.VerificationCode>>.value(
                  <_i2.VerificationCode>[]))
          as _i5.Future<List<_i2.VerificationCode>>);
  @override
  _i5.Future<_i2.VerificationCode?> getVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.VerificationCode?>.value())
          as _i5.Future<_i2.VerificationCode?>);
  @override
  _i5.Future<_i2.VerificationCode?> updateVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#updateVerificationCode, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.VerificationCode?>.value())
          as _i5.Future<_i2.VerificationCode?>);
  @override
  _i5.Future<bool> deleteVerificationCode(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteVerificationCode, [], {#context: context, #data: data}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalDataSource extends _i1.Mock
    implements _i7.UserLocalDataSource {
  MockUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.User> createUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #createUser, [], {#context: context, #data: data, #paths: paths}),
          returnValue:
              Future<_i2.User>.value(_FakeUser_1())) as _i5.Future<_i2.User>);
  @override
  _i5.Future<List<_i2.User>> listUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listUser, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i2.User>>.value(<_i2.User>[]))
          as _i5.Future<List<_i2.User>>);
  @override
  _i5.Future<List<_i2.User>> listUserInAliases(
          {_i3.PostgreSQLExecutionContext? context,
          List<String>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#listUserInAliases, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<List<_i2.User>>.value(<_i2.User>[]))
          as _i5.Future<List<_i2.User>>);
  @override
  _i5.Future<_i2.User?> getUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getUser, [], {#context: context, #data: data, #paths: paths}),
          returnValue: Future<_i2.User?>.value()) as _i5.Future<_i2.User?>);
  @override
  _i5.Future<_i2.User?> updateUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateUser, [], {#context: context, #data: data, #paths: paths}),
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

/// A class which mocks [BannedUserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBannedUserLocalDataSource extends _i1.Mock
    implements _i8.BannedUserLocalDataSource {
  MockBannedUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BannedUser> createBannedUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#createBannedUser, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.BannedUser>.value(_FakeBannedUser_2()))
          as _i5.Future<_i2.BannedUser>);
  @override
  _i5.Future<List<_i2.BannedUser>> listBannedUser(
          {_i3.PostgreSQLExecutionContext? context,
          List<_i6.Attribute>? paths,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
              Invocation.method(#listBannedUser, [],
                  {#context: context, #paths: paths, #data: data}),
              returnValue:
                  Future<List<_i2.BannedUser>>.value(<_i2.BannedUser>[]))
          as _i5.Future<List<_i2.BannedUser>>);
  @override
  _i5.Future<_i2.BannedUser?> getBannedUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getBannedUser, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.BannedUser?>.value())
          as _i5.Future<_i2.BannedUser?>);
  @override
  _i5.Future<void> deleteBannedUser(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteBannedUser, [], {#context: context, #data: data}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [BannedDeviceLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockBannedDeviceLocalDataSource extends _i1.Mock
    implements _i9.BannedDeviceLocalDataSource {
  MockBannedDeviceLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.BannedDevice> createBannedDevice(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<String>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#createBannedDevice, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue:
                  Future<_i2.BannedDevice>.value(_FakeBannedDevice_3()))
          as _i5.Future<_i2.BannedDevice>);
  @override
  _i5.Future<List<_i2.BannedDevice>> listBannedDevice(
          {_i3.PostgreSQLExecutionContext? context,
          List<_i6.Attribute>? paths,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
              Invocation.method(#listBannedDevice, [],
                  {#context: context, #paths: paths, #data: data}),
              returnValue:
                  Future<List<_i2.BannedDevice>>.value(<_i2.BannedDevice>[]))
          as _i5.Future<List<_i2.BannedDevice>>);
  @override
  _i5.Future<_i2.BannedDevice?> getBannedDevice(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data,
          List<_i6.Attribute>? paths}) =>
      (super.noSuchMethod(
              Invocation.method(#getBannedDevice, [],
                  {#context: context, #data: data, #paths: paths}),
              returnValue: Future<_i2.BannedDevice?>.value())
          as _i5.Future<_i2.BannedDevice?>);
  @override
  _i5.Future<void> deleteBannedDevice(
          {_i3.PostgreSQLExecutionContext? context,
          Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(
              #deleteBannedDevice, [], {#context: context, #data: data}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Emailer].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmailer extends _i1.Mock implements _i10.Emailer {
  MockEmailer() {
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
  _i5.Future<void> getConnection() =>
      (super.noSuchMethod(Invocation.method(#getConnection, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendMail(
          {String? body, String? recipient, String? subject}) =>
      (super.noSuchMethod(
          Invocation.method(#sendMail, [],
              {#body: body, #recipient: recipient, #subject: subject}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendVerificationCodeMail(
          {String? recipient,
          String? code,
          _i2.VerificationCodeType? verificationCodeType,
          String? ip,
          String? device,
          DateTime? time}) =>
      (super.noSuchMethod(
          Invocation.method(#sendVerificationCodeMail, [], {
            #recipient: recipient,
            #code: code,
            #verificationCodeType: verificationCodeType,
            #ip: ip,
            #device: device,
            #time: time
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendSignInMail(
          {String? recipient, String? ip, String? device, DateTime? time}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInMail, [],
              {#recipient: recipient, #ip: ip, #device: device, #time: time}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendSignUpMail(
          {String? recipient, String? ip, String? device, DateTime? time}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignUpMail, [],
              {#recipient: recipient, #ip: ip, #device: device, #time: time}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i11.Database {
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
                  _FakePostgreSQLConnection_4()))
          as _i5.Future<_i3.PostgreSQLConnection>);
  @override
  _i5.Future<List<Map<String, dynamic>>> list(
          {_i3.PostgreSQLExecutionContext? context,
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
          {_i3.PostgreSQLExecutionContext? context,
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
          {_i3.PostgreSQLExecutionContext? context,
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
          {_i3.PostgreSQLExecutionContext? context,
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
          {_i3.PostgreSQLExecutionContext? context,
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
          {_i3.PostgreSQLExecutionContext? context,
          String? table,
          List<_i6.Where>? where}) =>
      (super.noSuchMethod(
          Invocation.method(
              #delete, [], {#context: context, #table: table, #where: where}),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}
