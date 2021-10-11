///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/field_mask.pb.dart' as $2;

import 'main.pbenum.dart';

export 'main.pbenum.dart';

class ListBusinessRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBusinessRequest', createEmptyInstance: create)
    ..aOM<Point>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location', subBuilder: Point.create)
    ..aOM<$2.FieldMask>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  ListBusinessRequest._() : super();
  factory ListBusinessRequest({
    Point? location,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (location != null) {
      _result.location = location;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory ListBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBusinessRequest clone() => ListBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBusinessRequest copyWith(void Function(ListBusinessRequest) updates) => super.copyWith((message) => updates(message as ListBusinessRequest)) as ListBusinessRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessRequest create() => ListBusinessRequest._();
  ListBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<ListBusinessRequest> createRepeated() => $pb.PbList<ListBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBusinessRequest>(create);
  static ListBusinessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Point get location => $_getN(0);
  @$pb.TagNumber(1)
  set location(Point v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => clearField(1);
  @$pb.TagNumber(1)
  Point ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.FieldMask get fieldMask => $_getN(1);
  @$pb.TagNumber(2)
  set fieldMask($2.FieldMask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldMask() => clearField(2);
  @$pb.TagNumber(2)
  $2.FieldMask ensureFieldMask() => $_ensure(1);
}

class ListBusinessResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBusinessResponse', createEmptyInstance: create)
    ..pc<Business>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businesses', $pb.PbFieldType.PM, subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  ListBusinessResponse._() : super();
  factory ListBusinessResponse({
    $core.Iterable<Business>? businesses,
  }) {
    final _result = create();
    if (businesses != null) {
      _result.businesses.addAll(businesses);
    }
    return _result;
  }
  factory ListBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBusinessResponse clone() => ListBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBusinessResponse copyWith(void Function(ListBusinessResponse) updates) => super.copyWith((message) => updates(message as ListBusinessResponse)) as ListBusinessResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBusinessResponse create() => ListBusinessResponse._();
  ListBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<ListBusinessResponse> createRepeated() => $pb.PbList<ListBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBusinessResponse>(create);
  static ListBusinessResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Business> get businesses => $_getList(0);
}

class GetBusinessRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBusinessRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<$2.FieldMask>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  GetBusinessRequest._() : super();
  factory GetBusinessRequest({
    $core.String? id,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory GetBusinessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessRequest clone() => GetBusinessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessRequest copyWith(void Function(GetBusinessRequest) updates) => super.copyWith((message) => updates(message as GetBusinessRequest)) as GetBusinessRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBusinessRequest create() => GetBusinessRequest._();
  GetBusinessRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessRequest> createRepeated() => $pb.PbList<GetBusinessRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessRequest>(create);
  static GetBusinessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.FieldMask get fieldMask => $_getN(1);
  @$pb.TagNumber(2)
  set fieldMask($2.FieldMask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldMask() => clearField(2);
  @$pb.TagNumber(2)
  $2.FieldMask ensureFieldMask() => $_ensure(1);
}

class GetBusinessResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBusinessResponse', createEmptyInstance: create)
    ..aOM<Business>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'business', subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  GetBusinessResponse._() : super();
  factory GetBusinessResponse({
    Business? business,
  }) {
    final _result = create();
    if (business != null) {
      _result.business = business;
    }
    return _result;
  }
  factory GetBusinessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessResponse clone() => GetBusinessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessResponse copyWith(void Function(GetBusinessResponse) updates) => super.copyWith((message) => updates(message as GetBusinessResponse)) as GetBusinessResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBusinessResponse create() => GetBusinessResponse._();
  GetBusinessResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessResponse> createRepeated() => $pb.PbList<GetBusinessResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessResponse>(create);
  static GetBusinessResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Business get business => $_getN(0);
  @$pb.TagNumber(1)
  set business(Business v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusiness() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusiness() => clearField(1);
  @$pb.TagNumber(1)
  Business ensureBusiness() => $_ensure(0);
}

class GetPresignedPutUserAvatarRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPresignedPutUserAvatarRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objectName', protoName: 'objectName')
    ..hasRequiredFields = false
  ;

  GetPresignedPutUserAvatarRequest._() : super();
  factory GetPresignedPutUserAvatarRequest({
    $core.String? objectName,
  }) {
    final _result = create();
    if (objectName != null) {
      _result.objectName = objectName;
    }
    return _result;
  }
  factory GetPresignedPutUserAvatarRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPresignedPutUserAvatarRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPresignedPutUserAvatarRequest clone() => GetPresignedPutUserAvatarRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPresignedPutUserAvatarRequest copyWith(void Function(GetPresignedPutUserAvatarRequest) updates) => super.copyWith((message) => updates(message as GetPresignedPutUserAvatarRequest)) as GetPresignedPutUserAvatarRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPresignedPutUserAvatarRequest create() => GetPresignedPutUserAvatarRequest._();
  GetPresignedPutUserAvatarRequest createEmptyInstance() => create();
  static $pb.PbList<GetPresignedPutUserAvatarRequest> createRepeated() => $pb.PbList<GetPresignedPutUserAvatarRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPresignedPutUserAvatarRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPresignedPutUserAvatarRequest>(create);
  static GetPresignedPutUserAvatarRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectName => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObjectName() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectName() => clearField(1);
}

class GetPresignedPutUserAvatarResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPresignedPutUserAvatarResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objectUrl', protoName: 'objectUrl')
    ..hasRequiredFields = false
  ;

  GetPresignedPutUserAvatarResponse._() : super();
  factory GetPresignedPutUserAvatarResponse({
    $core.String? objectUrl,
  }) {
    final _result = create();
    if (objectUrl != null) {
      _result.objectUrl = objectUrl;
    }
    return _result;
  }
  factory GetPresignedPutUserAvatarResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPresignedPutUserAvatarResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPresignedPutUserAvatarResponse clone() => GetPresignedPutUserAvatarResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPresignedPutUserAvatarResponse copyWith(void Function(GetPresignedPutUserAvatarResponse) updates) => super.copyWith((message) => updates(message as GetPresignedPutUserAvatarResponse)) as GetPresignedPutUserAvatarResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPresignedPutUserAvatarResponse create() => GetPresignedPutUserAvatarResponse._();
  GetPresignedPutUserAvatarResponse createEmptyInstance() => create();
  static $pb.PbList<GetPresignedPutUserAvatarResponse> createRepeated() => $pb.PbList<GetPresignedPutUserAvatarResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPresignedPutUserAvatarResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPresignedPutUserAvatarResponse>(create);
  static GetPresignedPutUserAvatarResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObjectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectUrl() => clearField(1);
}

class SignUpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignUpRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alias')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName', protoName: 'fullName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'birthday')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  SignUpRequest._() : super();
  factory SignUpRequest({
    $core.String? email,
    $core.String? alias,
    $core.String? fullName,
    $core.String? birthday,
    $core.String? photo,
    $core.String? code,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (alias != null) {
      _result.alias = alias;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory SignUpRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpRequest clone() => SignUpRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpRequest copyWith(void Function(SignUpRequest) updates) => super.copyWith((message) => updates(message as SignUpRequest)) as SignUpRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignUpRequest create() => SignUpRequest._();
  SignUpRequest createEmptyInstance() => create();
  static $pb.PbList<SignUpRequest> createRepeated() => $pb.PbList<SignUpRequest>();
  @$core.pragma('dart2js:noInline')
  static SignUpRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpRequest>(create);
  static SignUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get alias => $_getSZ(1);
  @$pb.TagNumber(2)
  set alias($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAlias() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlias() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get birthday => $_getSZ(3);
  @$pb.TagNumber(4)
  set birthday($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBirthday() => $_has(3);
  @$pb.TagNumber(4)
  void clearBirthday() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get photo => $_getSZ(4);
  @$pb.TagNumber(5)
  set photo($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoto() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoto() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get code => $_getSZ(5);
  @$pb.TagNumber(6)
  set code($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearCode() => clearField(6);
}

class SignUpResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignUpResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationToken', protoName: 'authorizationToken')
    ..aOM<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  SignUpResponse._() : super();
  factory SignUpResponse({
    $core.String? refreshToken,
    $core.String? authorizationToken,
    User? user,
  }) {
    final _result = create();
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (authorizationToken != null) {
      _result.authorizationToken = authorizationToken;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory SignUpResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignUpResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignUpResponse clone() => SignUpResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignUpResponse copyWith(void Function(SignUpResponse) updates) => super.copyWith((message) => updates(message as SignUpResponse)) as SignUpResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignUpResponse create() => SignUpResponse._();
  SignUpResponse createEmptyInstance() => create();
  static $pb.PbList<SignUpResponse> createRepeated() => $pb.PbList<SignUpResponse>();
  @$core.pragma('dart2js:noInline')
  static SignUpResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignUpResponse>(create);
  static SignUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationToken() => clearField(2);

  @$pb.TagNumber(3)
  User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  User ensureUser() => $_ensure(2);
}

class UserExistsStreamRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserExistsStreamRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alias')
    ..hasRequiredFields = false
  ;

  UserExistsStreamRequest._() : super();
  factory UserExistsStreamRequest({
    $core.String? alias,
  }) {
    final _result = create();
    if (alias != null) {
      _result.alias = alias;
    }
    return _result;
  }
  factory UserExistsStreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserExistsStreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserExistsStreamRequest clone() => UserExistsStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserExistsStreamRequest copyWith(void Function(UserExistsStreamRequest) updates) => super.copyWith((message) => updates(message as UserExistsStreamRequest)) as UserExistsStreamRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserExistsStreamRequest create() => UserExistsStreamRequest._();
  UserExistsStreamRequest createEmptyInstance() => create();
  static $pb.PbList<UserExistsStreamRequest> createRepeated() => $pb.PbList<UserExistsStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static UserExistsStreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserExistsStreamRequest>(create);
  static UserExistsStreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get alias => $_getSZ(0);
  @$pb.TagNumber(1)
  set alias($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlias() => clearField(1);
}

class UserExistsStreamResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserExistsStreamResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isValid', protoName: 'isValid')
    ..hasRequiredFields = false
  ;

  UserExistsStreamResponse._() : super();
  factory UserExistsStreamResponse({
    $core.bool? isValid,
  }) {
    final _result = create();
    if (isValid != null) {
      _result.isValid = isValid;
    }
    return _result;
  }
  factory UserExistsStreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserExistsStreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserExistsStreamResponse clone() => UserExistsStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserExistsStreamResponse copyWith(void Function(UserExistsStreamResponse) updates) => super.copyWith((message) => updates(message as UserExistsStreamResponse)) as UserExistsStreamResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserExistsStreamResponse create() => UserExistsStreamResponse._();
  UserExistsStreamResponse createEmptyInstance() => create();
  static $pb.PbList<UserExistsStreamResponse> createRepeated() => $pb.PbList<UserExistsStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static UserExistsStreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserExistsStreamResponse>(create);
  static UserExistsStreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isValid => $_getBF(0);
  @$pb.TagNumber(1)
  set isValid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsValid() => clearField(1);
}

class UserExistsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserExistsRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  UserExistsRequest._() : super();
  factory UserExistsRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory UserExistsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserExistsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserExistsRequest clone() => UserExistsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserExistsRequest copyWith(void Function(UserExistsRequest) updates) => super.copyWith((message) => updates(message as UserExistsRequest)) as UserExistsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserExistsRequest create() => UserExistsRequest._();
  UserExistsRequest createEmptyInstance() => create();
  static $pb.PbList<UserExistsRequest> createRepeated() => $pb.PbList<UserExistsRequest>();
  @$core.pragma('dart2js:noInline')
  static UserExistsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserExistsRequest>(create);
  static UserExistsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class CheckSessionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckSessionResponse', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ipAddresses', protoName: 'ipAddresses')
    ..hasRequiredFields = false
  ;

  CheckSessionResponse._() : super();
  factory CheckSessionResponse({
    $core.Iterable<$core.String>? ipAddresses,
  }) {
    final _result = create();
    if (ipAddresses != null) {
      _result.ipAddresses.addAll(ipAddresses);
    }
    return _result;
  }
  factory CheckSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckSessionResponse clone() => CheckSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckSessionResponse copyWith(void Function(CheckSessionResponse) updates) => super.copyWith((message) => updates(message as CheckSessionResponse)) as CheckSessionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckSessionResponse create() => CheckSessionResponse._();
  CheckSessionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckSessionResponse> createRepeated() => $pb.PbList<CheckSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckSessionResponse>(create);
  static CheckSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ipAddresses => $_getList(0);
}

class CheckSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckSessionRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationToken', protoName: 'authorizationToken')
    ..hasRequiredFields = false
  ;

  CheckSessionRequest._() : super();
  factory CheckSessionRequest({
    $core.String? refreshToken,
    $core.String? authorizationToken,
  }) {
    final _result = create();
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (authorizationToken != null) {
      _result.authorizationToken = authorizationToken;
    }
    return _result;
  }
  factory CheckSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckSessionRequest clone() => CheckSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckSessionRequest copyWith(void Function(CheckSessionRequest) updates) => super.copyWith((message) => updates(message as CheckSessionRequest)) as CheckSessionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckSessionRequest create() => CheckSessionRequest._();
  CheckSessionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckSessionRequest> createRepeated() => $pb.PbList<CheckSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckSessionRequest>(create);
  static CheckSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationToken() => clearField(2);
}

class CreateVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVerificationCodeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..e<VerificationCodeType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED, valueOf: VerificationCodeType.valueOf, enumValues: VerificationCodeType.values)
    ..aOM<$2.FieldMask>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  CreateVerificationCodeRequest._() : super();
  factory CreateVerificationCodeRequest({
    $core.String? email,
    VerificationCodeType? type,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (type != null) {
      _result.type = type;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory CreateVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateVerificationCodeRequest clone() => CreateVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateVerificationCodeRequest copyWith(void Function(CreateVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as CreateVerificationCodeRequest)) as CreateVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVerificationCodeRequest create() => CreateVerificationCodeRequest._();
  CreateVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateVerificationCodeRequest> createRepeated() => $pb.PbList<CreateVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVerificationCodeRequest>(create);
  static CreateVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  VerificationCodeType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(VerificationCodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $2.FieldMask get fieldMask => $_getN(2);
  @$pb.TagNumber(3)
  set fieldMask($2.FieldMask v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldMask() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldMask() => clearField(3);
  @$pb.TagNumber(3)
  $2.FieldMask ensureFieldMask() => $_ensure(2);
}

class CreateVerificationCodeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVerificationCodeResponse', createEmptyInstance: create)
    ..aOM<VerificationCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCode', protoName: 'verificationCode', subBuilder: VerificationCode.create)
    ..hasRequiredFields = false
  ;

  CreateVerificationCodeResponse._() : super();
  factory CreateVerificationCodeResponse({
    VerificationCode? verificationCode,
  }) {
    final _result = create();
    if (verificationCode != null) {
      _result.verificationCode = verificationCode;
    }
    return _result;
  }
  factory CreateVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateVerificationCodeResponse clone() => CreateVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateVerificationCodeResponse copyWith(void Function(CreateVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as CreateVerificationCodeResponse)) as CreateVerificationCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVerificationCodeResponse create() => CreateVerificationCodeResponse._();
  CreateVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateVerificationCodeResponse> createRepeated() => $pb.PbList<CreateVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVerificationCodeResponse>(create);
  static CreateVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationCode get verificationCode => $_getN(0);
  @$pb.TagNumber(1)
  set verificationCode(VerificationCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationCode() => clearField(1);
  @$pb.TagNumber(1)
  VerificationCode ensureVerificationCode() => $_ensure(0);
}

class ListVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListVerificationCodeRequest', createEmptyInstance: create)
    ..aOM<$2.FieldMask>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  ListVerificationCodeRequest._() : super();
  factory ListVerificationCodeRequest({
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory ListVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVerificationCodeRequest clone() => ListVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVerificationCodeRequest copyWith(void Function(ListVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as ListVerificationCodeRequest)) as ListVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListVerificationCodeRequest create() => ListVerificationCodeRequest._();
  ListVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<ListVerificationCodeRequest> createRepeated() => $pb.PbList<ListVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static ListVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVerificationCodeRequest>(create);
  static ListVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.FieldMask get fieldMask => $_getN(0);
  @$pb.TagNumber(1)
  set fieldMask($2.FieldMask v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFieldMask() => $_has(0);
  @$pb.TagNumber(1)
  void clearFieldMask() => clearField(1);
  @$pb.TagNumber(1)
  $2.FieldMask ensureFieldMask() => $_ensure(0);
}

class ListVerificationCodeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListVerificationCodeResponse', createEmptyInstance: create)
    ..pc<VerificationCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCodes', $pb.PbFieldType.PM, protoName: 'verificationCodes', subBuilder: VerificationCode.create)
    ..hasRequiredFields = false
  ;

  ListVerificationCodeResponse._() : super();
  factory ListVerificationCodeResponse({
    $core.Iterable<VerificationCode>? verificationCodes,
  }) {
    final _result = create();
    if (verificationCodes != null) {
      _result.verificationCodes.addAll(verificationCodes);
    }
    return _result;
  }
  factory ListVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListVerificationCodeResponse clone() => ListVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListVerificationCodeResponse copyWith(void Function(ListVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as ListVerificationCodeResponse)) as ListVerificationCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListVerificationCodeResponse create() => ListVerificationCodeResponse._();
  ListVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<ListVerificationCodeResponse> createRepeated() => $pb.PbList<ListVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static ListVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListVerificationCodeResponse>(create);
  static ListVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<VerificationCode> get verificationCodes => $_getList(0);
}

class DeleteVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteVerificationCodeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DeleteVerificationCodeRequest._() : super();
  factory DeleteVerificationCodeRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVerificationCodeRequest clone() => DeleteVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVerificationCodeRequest copyWith(void Function(DeleteVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as DeleteVerificationCodeRequest)) as DeleteVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteVerificationCodeRequest create() => DeleteVerificationCodeRequest._();
  DeleteVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteVerificationCodeRequest> createRepeated() => $pb.PbList<DeleteVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVerificationCodeRequest>(create);
  static DeleteVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetVerificationCodeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOM<$2.FieldMask>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  GetVerificationCodeRequest._() : super();
  factory GetVerificationCodeRequest({
    $core.String? id,
    $core.String? code,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory GetVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVerificationCodeRequest clone() => GetVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVerificationCodeRequest copyWith(void Function(GetVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as GetVerificationCodeRequest)) as GetVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVerificationCodeRequest create() => GetVerificationCodeRequest._();
  GetVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<GetVerificationCodeRequest> createRepeated() => $pb.PbList<GetVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVerificationCodeRequest>(create);
  static GetVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(5)
  $2.FieldMask get fieldMask => $_getN(2);
  @$pb.TagNumber(5)
  set fieldMask($2.FieldMask v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFieldMask() => $_has(2);
  @$pb.TagNumber(5)
  void clearFieldMask() => clearField(5);
  @$pb.TagNumber(5)
  $2.FieldMask ensureFieldMask() => $_ensure(2);
}

class GetVerificationCodeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetVerificationCodeResponse', createEmptyInstance: create)
    ..aOM<VerificationCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCode', protoName: 'verificationCode', subBuilder: VerificationCode.create)
    ..hasRequiredFields = false
  ;

  GetVerificationCodeResponse._() : super();
  factory GetVerificationCodeResponse({
    VerificationCode? verificationCode,
  }) {
    final _result = create();
    if (verificationCode != null) {
      _result.verificationCode = verificationCode;
    }
    return _result;
  }
  factory GetVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVerificationCodeResponse clone() => GetVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVerificationCodeResponse copyWith(void Function(GetVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as GetVerificationCodeResponse)) as GetVerificationCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVerificationCodeResponse create() => GetVerificationCodeResponse._();
  GetVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<GetVerificationCodeResponse> createRepeated() => $pb.PbList<GetVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVerificationCodeResponse>(create);
  static GetVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationCode get verificationCode => $_getN(0);
  @$pb.TagNumber(1)
  set verificationCode(VerificationCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationCode() => clearField(1);
  @$pb.TagNumber(1)
  VerificationCode ensureVerificationCode() => $_ensure(0);
}

class UpdateVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateVerificationCodeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..e<VerificationCodeType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED, valueOf: VerificationCodeType.valueOf, enumValues: VerificationCodeType.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$2.FieldMask>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  UpdateVerificationCodeRequest._() : super();
  factory UpdateVerificationCodeRequest({
    $core.String? id,
    $core.String? code,
    $core.String? email,
    VerificationCodeType? type,
    $core.String? deviceId,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (email != null) {
      _result.email = email;
    }
    if (type != null) {
      _result.type = type;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory UpdateVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVerificationCodeRequest clone() => UpdateVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVerificationCodeRequest copyWith(void Function(UpdateVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as UpdateVerificationCodeRequest)) as UpdateVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVerificationCodeRequest create() => UpdateVerificationCodeRequest._();
  UpdateVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateVerificationCodeRequest> createRepeated() => $pb.PbList<UpdateVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVerificationCodeRequest>(create);
  static UpdateVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  VerificationCodeType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(VerificationCodeType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $2.FieldMask get fieldMask => $_getN(5);
  @$pb.TagNumber(6)
  set fieldMask($2.FieldMask v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFieldMask() => $_has(5);
  @$pb.TagNumber(6)
  void clearFieldMask() => clearField(6);
  @$pb.TagNumber(6)
  $2.FieldMask ensureFieldMask() => $_ensure(5);
}

class UpdateVerificationCodeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateVerificationCodeResponse', createEmptyInstance: create)
    ..aOM<VerificationCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCode', protoName: 'verificationCode', subBuilder: VerificationCode.create)
    ..hasRequiredFields = false
  ;

  UpdateVerificationCodeResponse._() : super();
  factory UpdateVerificationCodeResponse({
    VerificationCode? verificationCode,
  }) {
    final _result = create();
    if (verificationCode != null) {
      _result.verificationCode = verificationCode;
    }
    return _result;
  }
  factory UpdateVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateVerificationCodeResponse clone() => UpdateVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateVerificationCodeResponse copyWith(void Function(UpdateVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as UpdateVerificationCodeResponse)) as UpdateVerificationCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVerificationCodeResponse create() => UpdateVerificationCodeResponse._();
  UpdateVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateVerificationCodeResponse> createRepeated() => $pb.PbList<UpdateVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVerificationCodeResponse>(create);
  static UpdateVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  VerificationCode get verificationCode => $_getN(0);
  @$pb.TagNumber(1)
  set verificationCode(VerificationCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationCode() => clearField(1);
  @$pb.TagNumber(1)
  VerificationCode ensureVerificationCode() => $_ensure(0);
}

class SignInRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOM<$2.FieldMask>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fieldMask', protoName: 'fieldMask', subBuilder: $2.FieldMask.create)
    ..hasRequiredFields = false
  ;

  SignInRequest._() : super();
  factory SignInRequest({
    $core.String? email,
    $core.String? code,
    $2.FieldMask? fieldMask,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    if (fieldMask != null) {
      _result.fieldMask = fieldMask;
    }
    return _result;
  }
  factory SignInRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInRequest clone() => SignInRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInRequest copyWith(void Function(SignInRequest) updates) => super.copyWith((message) => updates(message as SignInRequest)) as SignInRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInRequest create() => SignInRequest._();
  SignInRequest createEmptyInstance() => create();
  static $pb.PbList<SignInRequest> createRepeated() => $pb.PbList<SignInRequest>();
  @$core.pragma('dart2js:noInline')
  static SignInRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInRequest>(create);
  static SignInRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $2.FieldMask get fieldMask => $_getN(2);
  @$pb.TagNumber(3)
  set fieldMask($2.FieldMask v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFieldMask() => $_has(2);
  @$pb.TagNumber(3)
  void clearFieldMask() => clearField(3);
  @$pb.TagNumber(3)
  $2.FieldMask ensureFieldMask() => $_ensure(2);
}

class SignInResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignInResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationToken', protoName: 'authorizationToken')
    ..aOM<User>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  SignInResponse._() : super();
  factory SignInResponse({
    $core.String? refreshToken,
    $core.String? authorizationToken,
    User? user,
  }) {
    final _result = create();
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (authorizationToken != null) {
      _result.authorizationToken = authorizationToken;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory SignInResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignInResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignInResponse clone() => SignInResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignInResponse copyWith(void Function(SignInResponse) updates) => super.copyWith((message) => updates(message as SignInResponse)) as SignInResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignInResponse create() => SignInResponse._();
  SignInResponse createEmptyInstance() => create();
  static $pb.PbList<SignInResponse> createRepeated() => $pb.PbList<SignInResponse>();
  @$core.pragma('dart2js:noInline')
  static SignInResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignInResponse>(create);
  static SignInResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationToken() => clearField(2);

  @$pb.TagNumber(3)
  User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  User ensureUser() => $_ensure(2);
}

class HostnameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostnameRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  HostnameRequest._() : super();
  factory HostnameRequest() => create();
  factory HostnameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostnameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostnameRequest clone() => HostnameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostnameRequest copyWith(void Function(HostnameRequest) updates) => super.copyWith((message) => updates(message as HostnameRequest)) as HostnameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostnameRequest create() => HostnameRequest._();
  HostnameRequest createEmptyInstance() => create();
  static $pb.PbList<HostnameRequest> createRepeated() => $pb.PbList<HostnameRequest>();
  @$core.pragma('dart2js:noInline')
  static HostnameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostnameRequest>(create);
  static HostnameRequest? _defaultInstance;
}

class HostnameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostnameResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  HostnameResponse._() : super();
  factory HostnameResponse({
    $core.String? hostname,
  }) {
    final _result = create();
    if (hostname != null) {
      _result.hostname = hostname;
    }
    return _result;
  }
  factory HostnameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostnameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostnameResponse clone() => HostnameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostnameResponse copyWith(void Function(HostnameResponse) updates) => super.copyWith((message) => updates(message as HostnameResponse)) as HostnameResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostnameResponse create() => HostnameResponse._();
  HostnameResponse createEmptyInstance() => create();
  static $pb.PbList<HostnameResponse> createRepeated() => $pb.PbList<HostnameResponse>();
  @$core.pragma('dart2js:noInline')
  static HostnameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostnameResponse>(create);
  static HostnameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

class HealthCheckRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HealthCheckRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'service')
    ..hasRequiredFields = false
  ;

  HealthCheckRequest._() : super();
  factory HealthCheckRequest({
    $core.String? service,
  }) {
    final _result = create();
    if (service != null) {
      _result.service = service;
    }
    return _result;
  }
  factory HealthCheckRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckRequest clone() => HealthCheckRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckRequest copyWith(void Function(HealthCheckRequest) updates) => super.copyWith((message) => updates(message as HealthCheckRequest)) as HealthCheckRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HealthCheckRequest create() => HealthCheckRequest._();
  HealthCheckRequest createEmptyInstance() => create();
  static $pb.PbList<HealthCheckRequest> createRepeated() => $pb.PbList<HealthCheckRequest>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckRequest>(create);
  static HealthCheckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);
  @$pb.TagNumber(1)
  set service($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);
  @$pb.TagNumber(1)
  void clearService() => clearField(1);
}

class HealthCheckResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HealthCheckResponse', createEmptyInstance: create)
    ..e<HealthCheckResponse_ServingStatus>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: HealthCheckResponse_ServingStatus.UNKNOWN, valueOf: HealthCheckResponse_ServingStatus.valueOf, enumValues: HealthCheckResponse_ServingStatus.values)
    ..hasRequiredFields = false
  ;

  HealthCheckResponse._() : super();
  factory HealthCheckResponse({
    HealthCheckResponse_ServingStatus? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory HealthCheckResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckResponse clone() => HealthCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckResponse copyWith(void Function(HealthCheckResponse) updates) => super.copyWith((message) => updates(message as HealthCheckResponse)) as HealthCheckResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HealthCheckResponse create() => HealthCheckResponse._();
  HealthCheckResponse createEmptyInstance() => create();
  static $pb.PbList<HealthCheckResponse> createRepeated() => $pb.PbList<HealthCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckResponse>(create);
  static HealthCheckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  HealthCheckResponse_ServingStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(HealthCheckResponse_ServingStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName', protoName: 'fullName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alias')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photoUrl', protoName: 'photoUrl')
    ..pc<UserAddress>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress', $pb.PbFieldType.PM, protoName: 'userAddress', subBuilder: UserAddress.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'birthday')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..pc<UserPermission>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: UserPermission.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String? id,
    $core.String? fullName,
    $core.String? alias,
    $core.String? photo,
    $core.String? photoUrl,
    $core.Iterable<UserAddress>? userAddress,
    $core.String? birthday,
    $core.String? email,
    $core.Iterable<UserPermission>? permissions,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (alias != null) {
      _result.alias = alias;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (photoUrl != null) {
      _result.photoUrl = photoUrl;
    }
    if (userAddress != null) {
      _result.userAddress.addAll(userAddress);
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (email != null) {
      _result.email = email;
    }
    if (permissions != null) {
      _result.permissions.addAll(permissions);
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get alias => $_getSZ(2);
  @$pb.TagNumber(3)
  set alias($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlias() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlias() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get photo => $_getSZ(3);
  @$pb.TagNumber(4)
  set photo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPhoto() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoto() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get photoUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set photoUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhotoUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhotoUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<UserAddress> get userAddress => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get birthday => $_getSZ(6);
  @$pb.TagNumber(7)
  set birthday($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBirthday() => $_has(6);
  @$pb.TagNumber(7)
  void clearBirthday() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get email => $_getSZ(7);
  @$pb.TagNumber(8)
  set email($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEmail() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmail() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<UserPermission> get permissions => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get createTime => $_getSZ(9);
  @$pb.TagNumber(10)
  set createTime($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreateTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreateTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get updateTime => $_getSZ(10);
  @$pb.TagNumber(11)
  set updateTime($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdateTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdateTime() => clearField(11);
}

class Business extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Business', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photoUrl', protoName: 'photoUrl')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isOpen', protoName: 'isOpen')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deliveryPrice', $pb.PbFieldType.OD, protoName: 'deliveryPrice')
    ..aOM<Polygon>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'polygon', subBuilder: Polygon.create)
    ..aOM<Point>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', subBuilder: Point.create)
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadDayTime', $pb.PbFieldType.O3, protoName: 'leadDayTime')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadHoursTime', $pb.PbFieldType.O3, protoName: 'leadHoursTime')
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadMinutesTime', $pb.PbFieldType.O3, protoName: 'leadMinutesTime')
    ..aOB(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toPickUp', protoName: 'toPickUp')
    ..aOB(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeDelivery', protoName: 'homeDelivery')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessBrandFk', protoName: 'businessBrandFk')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provinceFk', protoName: 'provinceFk')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'municipalityFk', protoName: 'municipalityFk')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distance', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Business._() : super();
  factory Business({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.String? address,
    $core.String? phone,
    $core.String? email,
    $core.String? photo,
    $core.String? photoUrl,
    $core.bool? isOpen,
    $core.double? deliveryPrice,
    Polygon? polygon,
    Point? coordinates,
    $core.int? leadDayTime,
    $core.int? leadHoursTime,
    $core.int? leadMinutesTime,
    $core.bool? toPickUp,
    $core.bool? homeDelivery,
    $core.String? businessBrandFk,
    $core.String? provinceFk,
    $core.String? municipalityFk,
    $core.double? distance,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (address != null) {
      _result.address = address;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (email != null) {
      _result.email = email;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (photoUrl != null) {
      _result.photoUrl = photoUrl;
    }
    if (isOpen != null) {
      _result.isOpen = isOpen;
    }
    if (deliveryPrice != null) {
      _result.deliveryPrice = deliveryPrice;
    }
    if (polygon != null) {
      _result.polygon = polygon;
    }
    if (coordinates != null) {
      _result.coordinates = coordinates;
    }
    if (leadDayTime != null) {
      _result.leadDayTime = leadDayTime;
    }
    if (leadHoursTime != null) {
      _result.leadHoursTime = leadHoursTime;
    }
    if (leadMinutesTime != null) {
      _result.leadMinutesTime = leadMinutesTime;
    }
    if (toPickUp != null) {
      _result.toPickUp = toPickUp;
    }
    if (homeDelivery != null) {
      _result.homeDelivery = homeDelivery;
    }
    if (businessBrandFk != null) {
      _result.businessBrandFk = businessBrandFk;
    }
    if (provinceFk != null) {
      _result.provinceFk = provinceFk;
    }
    if (municipalityFk != null) {
      _result.municipalityFk = municipalityFk;
    }
    if (distance != null) {
      _result.distance = distance;
    }
    return _result;
  }
  factory Business.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Business.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Business clone() => Business()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Business copyWith(void Function(Business) updates) => super.copyWith((message) => updates(message as Business)) as Business; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Business create() => Business._();
  Business createEmptyInstance() => create();
  static $pb.PbList<Business> createRepeated() => $pb.PbList<Business>();
  @$core.pragma('dart2js:noInline')
  static Business getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Business>(create);
  static Business? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get photo => $_getSZ(6);
  @$pb.TagNumber(7)
  set photo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhoto() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhoto() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get photoUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set photoUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhotoUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhotoUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isOpen => $_getBF(8);
  @$pb.TagNumber(9)
  set isOpen($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsOpen() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsOpen() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get deliveryPrice => $_getN(9);
  @$pb.TagNumber(10)
  set deliveryPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDeliveryPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeliveryPrice() => clearField(10);

  @$pb.TagNumber(11)
  Polygon get polygon => $_getN(10);
  @$pb.TagNumber(11)
  set polygon(Polygon v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPolygon() => $_has(10);
  @$pb.TagNumber(11)
  void clearPolygon() => clearField(11);
  @$pb.TagNumber(11)
  Polygon ensurePolygon() => $_ensure(10);

  @$pb.TagNumber(12)
  Point get coordinates => $_getN(11);
  @$pb.TagNumber(12)
  set coordinates(Point v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCoordinates() => $_has(11);
  @$pb.TagNumber(12)
  void clearCoordinates() => clearField(12);
  @$pb.TagNumber(12)
  Point ensureCoordinates() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.int get leadDayTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set leadDayTime($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLeadDayTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearLeadDayTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get leadHoursTime => $_getIZ(13);
  @$pb.TagNumber(14)
  set leadHoursTime($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasLeadHoursTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearLeadHoursTime() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get leadMinutesTime => $_getIZ(14);
  @$pb.TagNumber(15)
  set leadMinutesTime($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasLeadMinutesTime() => $_has(14);
  @$pb.TagNumber(15)
  void clearLeadMinutesTime() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get toPickUp => $_getBF(15);
  @$pb.TagNumber(16)
  set toPickUp($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasToPickUp() => $_has(15);
  @$pb.TagNumber(16)
  void clearToPickUp() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get homeDelivery => $_getBF(16);
  @$pb.TagNumber(17)
  set homeDelivery($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasHomeDelivery() => $_has(16);
  @$pb.TagNumber(17)
  void clearHomeDelivery() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get businessBrandFk => $_getSZ(17);
  @$pb.TagNumber(18)
  set businessBrandFk($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBusinessBrandFk() => $_has(17);
  @$pb.TagNumber(18)
  void clearBusinessBrandFk() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get provinceFk => $_getSZ(18);
  @$pb.TagNumber(19)
  set provinceFk($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasProvinceFk() => $_has(18);
  @$pb.TagNumber(19)
  void clearProvinceFk() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get municipalityFk => $_getSZ(19);
  @$pb.TagNumber(20)
  set municipalityFk($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasMunicipalityFk() => $_has(19);
  @$pb.TagNumber(20)
  void clearMunicipalityFk() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get distance => $_getN(20);
  @$pb.TagNumber(21)
  set distance($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasDistance() => $_has(20);
  @$pb.TagNumber(21)
  void clearDistance() => clearField(21);
}

class BannedUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BannedUser', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userFk', protoName: 'userFk')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moderatorAuthorizationTokenFk', protoName: 'moderatorAuthorizationTokenFk')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  BannedUser._() : super();
  factory BannedUser({
    $core.String? id,
    $core.String? description,
    $core.String? userFk,
    $core.String? email,
    $core.String? moderatorAuthorizationTokenFk,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (description != null) {
      _result.description = description;
    }
    if (userFk != null) {
      _result.userFk = userFk;
    }
    if (email != null) {
      _result.email = email;
    }
    if (moderatorAuthorizationTokenFk != null) {
      _result.moderatorAuthorizationTokenFk = moderatorAuthorizationTokenFk;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory BannedUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BannedUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BannedUser clone() => BannedUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BannedUser copyWith(void Function(BannedUser) updates) => super.copyWith((message) => updates(message as BannedUser)) as BannedUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannedUser create() => BannedUser._();
  BannedUser createEmptyInstance() => create();
  static $pb.PbList<BannedUser> createRepeated() => $pb.PbList<BannedUser>();
  @$core.pragma('dart2js:noInline')
  static BannedUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BannedUser>(create);
  static BannedUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userFk => $_getSZ(2);
  @$pb.TagNumber(3)
  set userFk($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserFk() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserFk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get moderatorAuthorizationTokenFk => $_getSZ(4);
  @$pb.TagNumber(5)
  set moderatorAuthorizationTokenFk($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasModeratorAuthorizationTokenFk() => $_has(4);
  @$pb.TagNumber(5)
  void clearModeratorAuthorizationTokenFk() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
}

class BannedDevice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BannedDevice', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceFk', protoName: 'deviceFk')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moderatorAuthorizationTokenFk', protoName: 'moderatorAuthorizationTokenFk')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  BannedDevice._() : super();
  factory BannedDevice({
    $core.String? id,
    $core.String? description,
    $core.String? deviceFk,
    $core.String? deviceId,
    $core.String? moderatorAuthorizationTokenFk,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (description != null) {
      _result.description = description;
    }
    if (deviceFk != null) {
      _result.deviceFk = deviceFk;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (moderatorAuthorizationTokenFk != null) {
      _result.moderatorAuthorizationTokenFk = moderatorAuthorizationTokenFk;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory BannedDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BannedDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BannedDevice clone() => BannedDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BannedDevice copyWith(void Function(BannedDevice) updates) => super.copyWith((message) => updates(message as BannedDevice)) as BannedDevice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannedDevice create() => BannedDevice._();
  BannedDevice createEmptyInstance() => create();
  static $pb.PbList<BannedDevice> createRepeated() => $pb.PbList<BannedDevice>();
  @$core.pragma('dart2js:noInline')
  static BannedDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BannedDevice>(create);
  static BannedDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceFk => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceFk($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceFk() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceFk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get moderatorAuthorizationTokenFk => $_getSZ(4);
  @$pb.TagNumber(5)
  set moderatorAuthorizationTokenFk($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasModeratorAuthorizationTokenFk() => $_has(4);
  @$pb.TagNumber(5)
  void clearModeratorAuthorizationTokenFk() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
}

class AuthorizationToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthorizationToken', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationToken', protoName: 'authorizationToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshTokenFk', protoName: 'refreshTokenFk')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceFk', protoName: 'deviceFk')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userFk', protoName: 'userFk')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valid')
    ..e<AppType>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'app', $pb.PbFieldType.OE, defaultOrMaker: AppType.APP_TYPE_UNSPECIFIED, valueOf: AppType.valueOf, enumValues: AppType.values)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersion', protoName: 'appVersion')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  AuthorizationToken._() : super();
  factory AuthorizationToken({
    $core.String? id,
    $core.String? authorizationToken,
    $core.String? refreshTokenFk,
    $core.String? deviceFk,
    $core.String? userFk,
    $core.bool? valid,
    AppType? app,
    $core.String? appVersion,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (authorizationToken != null) {
      _result.authorizationToken = authorizationToken;
    }
    if (refreshTokenFk != null) {
      _result.refreshTokenFk = refreshTokenFk;
    }
    if (deviceFk != null) {
      _result.deviceFk = deviceFk;
    }
    if (userFk != null) {
      _result.userFk = userFk;
    }
    if (valid != null) {
      _result.valid = valid;
    }
    if (app != null) {
      _result.app = app;
    }
    if (appVersion != null) {
      _result.appVersion = appVersion;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory AuthorizationToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthorizationToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthorizationToken clone() => AuthorizationToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthorizationToken copyWith(void Function(AuthorizationToken) updates) => super.copyWith((message) => updates(message as AuthorizationToken)) as AuthorizationToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthorizationToken create() => AuthorizationToken._();
  AuthorizationToken createEmptyInstance() => create();
  static $pb.PbList<AuthorizationToken> createRepeated() => $pb.PbList<AuthorizationToken>();
  @$core.pragma('dart2js:noInline')
  static AuthorizationToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthorizationToken>(create);
  static AuthorizationToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshTokenFk => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshTokenFk($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefreshTokenFk() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshTokenFk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceFk => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceFk($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceFk() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceFk() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userFk => $_getSZ(4);
  @$pb.TagNumber(5)
  set userFk($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserFk() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserFk() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get valid => $_getBF(5);
  @$pb.TagNumber(6)
  set valid($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasValid() => $_has(5);
  @$pb.TagNumber(6)
  void clearValid() => clearField(6);

  @$pb.TagNumber(7)
  AppType get app => $_getN(6);
  @$pb.TagNumber(7)
  set app(AppType v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasApp() => $_has(6);
  @$pb.TagNumber(7)
  void clearApp() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get appVersion => $_getSZ(7);
  @$pb.TagNumber(8)
  set appVersion($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAppVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearAppVersion() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get createTime => $_getSZ(8);
  @$pb.TagNumber(9)
  set createTime($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreateTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreateTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get updateTime => $_getSZ(9);
  @$pb.TagNumber(10)
  set updateTime($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUpdateTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdateTime() => clearField(10);
}

class RefreshToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshToken', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userFk', protoName: 'userFk')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valid')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationTime', protoName: 'expirationTime')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  RefreshToken._() : super();
  factory RefreshToken({
    $core.String? id,
    $core.String? refreshToken,
    $core.String? userFk,
    $core.bool? valid,
    $core.String? expirationTime,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (userFk != null) {
      _result.userFk = userFk;
    }
    if (valid != null) {
      _result.valid = valid;
    }
    if (expirationTime != null) {
      _result.expirationTime = expirationTime;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory RefreshToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshToken clone() => RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshToken copyWith(void Function(RefreshToken) updates) => super.copyWith((message) => updates(message as RefreshToken)) as RefreshToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshToken create() => RefreshToken._();
  RefreshToken createEmptyInstance() => create();
  static $pb.PbList<RefreshToken> createRepeated() => $pb.PbList<RefreshToken>();
  @$core.pragma('dart2js:noInline')
  static RefreshToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshToken>(create);
  static RefreshToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userFk => $_getSZ(2);
  @$pb.TagNumber(3)
  set userFk($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserFk() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserFk() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get valid => $_getBF(3);
  @$pb.TagNumber(4)
  set valid($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValid() => $_has(3);
  @$pb.TagNumber(4)
  void clearValid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get expirationTime => $_getSZ(4);
  @$pb.TagNumber(5)
  set expirationTime($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpirationTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpirationTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
}

class Device extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Device', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<PlatformType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform', $pb.PbFieldType.OE, defaultOrMaker: PlatformType.PLATFORM_TYPE_UNSPECIFIED, valueOf: PlatformType.valueOf, enumValues: PlatformType.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'systemVersion', protoName: 'systemVersion')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firebaseCloudMessagingId', protoName: 'firebaseCloudMessagingId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'model')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  Device._() : super();
  factory Device({
    $core.String? id,
    PlatformType? platform,
    $core.String? systemVersion,
    $core.String? deviceId,
    $core.String? firebaseCloudMessagingId,
    $core.String? model,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (systemVersion != null) {
      _result.systemVersion = systemVersion;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (firebaseCloudMessagingId != null) {
      _result.firebaseCloudMessagingId = firebaseCloudMessagingId;
    }
    if (model != null) {
      _result.model = model;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  PlatformType get platform => $_getN(1);
  @$pb.TagNumber(2)
  set platform(PlatformType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get systemVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set systemVersion($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSystemVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearSystemVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get firebaseCloudMessagingId => $_getSZ(4);
  @$pb.TagNumber(5)
  set firebaseCloudMessagingId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirebaseCloudMessagingId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirebaseCloudMessagingId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get model => $_getSZ(5);
  @$pb.TagNumber(6)
  set model($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasModel() => $_has(5);
  @$pb.TagNumber(6)
  void clearModel() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get createTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set createTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get updateTime => $_getSZ(7);
  @$pb.TagNumber(8)
  set updateTime($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdateTime() => clearField(8);
}

class UserAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserAddress', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tag')
    ..e<UserAddress_UserAddressType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'residenceType', $pb.PbFieldType.OE, protoName: 'residenceType', defaultOrMaker: UserAddress_UserAddressType.UNSPECIFIED, valueOf: UserAddress_UserAddressType.valueOf, enumValues: UserAddress_UserAddressType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buildingNumber', protoName: 'buildingNumber')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'houseNumber', protoName: 'houseNumber')
    ..aOM<Point>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', subBuilder: Point.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userFk', protoName: 'userFk')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provinceFk', protoName: 'provinceFk')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'municipalityFk', protoName: 'municipalityFk')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  UserAddress._() : super();
  factory UserAddress({
    $core.String? id,
    $core.String? tag,
    UserAddress_UserAddressType? residenceType,
    $core.String? buildingNumber,
    $core.String? houseNumber,
    Point? coordinates,
    $core.String? description,
    $core.String? userFk,
    $core.String? provinceFk,
    $core.String? municipalityFk,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (residenceType != null) {
      _result.residenceType = residenceType;
    }
    if (buildingNumber != null) {
      _result.buildingNumber = buildingNumber;
    }
    if (houseNumber != null) {
      _result.houseNumber = houseNumber;
    }
    if (coordinates != null) {
      _result.coordinates = coordinates;
    }
    if (description != null) {
      _result.description = description;
    }
    if (userFk != null) {
      _result.userFk = userFk;
    }
    if (provinceFk != null) {
      _result.provinceFk = provinceFk;
    }
    if (municipalityFk != null) {
      _result.municipalityFk = municipalityFk;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory UserAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAddress clone() => UserAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAddress copyWith(void Function(UserAddress) updates) => super.copyWith((message) => updates(message as UserAddress)) as UserAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAddress create() => UserAddress._();
  UserAddress createEmptyInstance() => create();
  static $pb.PbList<UserAddress> createRepeated() => $pb.PbList<UserAddress>();
  @$core.pragma('dart2js:noInline')
  static UserAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAddress>(create);
  static UserAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);

  @$pb.TagNumber(3)
  UserAddress_UserAddressType get residenceType => $_getN(2);
  @$pb.TagNumber(3)
  set residenceType(UserAddress_UserAddressType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResidenceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearResidenceType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get buildingNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set buildingNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuildingNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuildingNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get houseNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set houseNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHouseNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearHouseNumber() => clearField(5);

  @$pb.TagNumber(6)
  Point get coordinates => $_getN(5);
  @$pb.TagNumber(6)
  set coordinates(Point v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCoordinates() => $_has(5);
  @$pb.TagNumber(6)
  void clearCoordinates() => clearField(6);
  @$pb.TagNumber(6)
  Point ensureCoordinates() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get userFk => $_getSZ(7);
  @$pb.TagNumber(8)
  set userFk($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUserFk() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserFk() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get provinceFk => $_getSZ(8);
  @$pb.TagNumber(9)
  set provinceFk($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasProvinceFk() => $_has(8);
  @$pb.TagNumber(9)
  void clearProvinceFk() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get municipalityFk => $_getSZ(9);
  @$pb.TagNumber(10)
  set municipalityFk($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMunicipalityFk() => $_has(9);
  @$pb.TagNumber(10)
  void clearMunicipalityFk() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get createTime => $_getSZ(10);
  @$pb.TagNumber(11)
  set createTime($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreateTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreateTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get updateTime => $_getSZ(11);
  @$pb.TagNumber(12)
  set updateTime($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdateTime() => clearField(12);
}

class UserPermission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserPermission', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionFk', protoName: 'permissionFk')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userFk', protoName: 'userFk')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessFk', protoName: 'businessFk')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  UserPermission._() : super();
  factory UserPermission({
    $core.String? id,
    $core.String? name,
    $core.String? permissionFk,
    $core.String? userFk,
    $core.String? businessFk,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (permissionFk != null) {
      _result.permissionFk = permissionFk;
    }
    if (userFk != null) {
      _result.userFk = userFk;
    }
    if (businessFk != null) {
      _result.businessFk = businessFk;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory UserPermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPermission clone() => UserPermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPermission copyWith(void Function(UserPermission) updates) => super.copyWith((message) => updates(message as UserPermission)) as UserPermission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPermission create() => UserPermission._();
  UserPermission createEmptyInstance() => create();
  static $pb.PbList<UserPermission> createRepeated() => $pb.PbList<UserPermission>();
  @$core.pragma('dart2js:noInline')
  static UserPermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPermission>(create);
  static UserPermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get permissionFk => $_getSZ(2);
  @$pb.TagNumber(3)
  set permissionFk($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissionFk() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissionFk() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userFk => $_getSZ(3);
  @$pb.TagNumber(4)
  set userFk($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserFk() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserFk() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get businessFk => $_getSZ(4);
  @$pb.TagNumber(5)
  set businessFk($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBusinessFk() => $_has(4);
  @$pb.TagNumber(5)
  void clearBusinessFk() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
}

class Polygon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Polygon', createEmptyInstance: create)
    ..p<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', $pb.PbFieldType.PD)
    ..hasRequiredFields = false
  ;

  Polygon._() : super();
  factory Polygon({
    $core.Iterable<$core.double>? coordinates,
  }) {
    final _result = create();
    if (coordinates != null) {
      _result.coordinates.addAll(coordinates);
    }
    return _result;
  }
  factory Polygon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Polygon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Polygon clone() => Polygon()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Polygon copyWith(void Function(Polygon) updates) => super.copyWith((message) => updates(message as Polygon)) as Polygon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Polygon create() => Polygon._();
  Polygon createEmptyInstance() => create();
  static $pb.PbList<Polygon> createRepeated() => $pb.PbList<Polygon>();
  @$core.pragma('dart2js:noInline')
  static Polygon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Polygon>(create);
  static Polygon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.double> get coordinates => $_getList(0);
}

class VerificationCode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationCode', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..e<VerificationCodeType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: VerificationCodeType.VERIFICATION_CODE_TYPE_UNSPECIFIED, valueOf: VerificationCodeType.valueOf, enumValues: VerificationCodeType.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime', protoName: 'createTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime', protoName: 'updateTime')
    ..hasRequiredFields = false
  ;

  VerificationCode._() : super();
  factory VerificationCode({
    $core.String? id,
    $core.String? code,
    $core.String? email,
    VerificationCodeType? type,
    $core.String? deviceId,
    $core.String? createTime,
    $core.String? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (email != null) {
      _result.email = email;
    }
    if (type != null) {
      _result.type = type;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory VerificationCode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationCode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationCode clone() => VerificationCode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationCode copyWith(void Function(VerificationCode) updates) => super.copyWith((message) => updates(message as VerificationCode)) as VerificationCode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerificationCode create() => VerificationCode._();
  VerificationCode createEmptyInstance() => create();
  static $pb.PbList<VerificationCode> createRepeated() => $pb.PbList<VerificationCode>();
  @$core.pragma('dart2js:noInline')
  static VerificationCode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationCode>(create);
  static VerificationCode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  VerificationCodeType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(VerificationCodeType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get updateTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set updateTime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdateTime() => clearField(7);
}

class Point extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Point', createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Point._() : super();
  factory Point({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    return _result;
  }
  factory Point.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Point.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Point clone() => Point()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Point copyWith(void Function(Point) updates) => super.copyWith((message) => updates(message as Point)) as Point; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Point create() => Point._();
  Point createEmptyInstance() => create();
  static $pb.PbList<Point> createRepeated() => $pb.PbList<Point>();
  @$core.pragma('dart2js:noInline')
  static Point getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Point>(create);
  static Point? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);
}

