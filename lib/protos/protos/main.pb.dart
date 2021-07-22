///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'main.pbenum.dart';

export 'main.pbenum.dart';

class ListBusinessRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBusinessRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryFk')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notIds')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thisMonth')
    ..aOM<LatLng>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', subBuilder: LatLng.create)
    ..hasRequiredFields = false
  ;

  ListBusinessRequest._() : super();
  factory ListBusinessRequest({
    $core.String? categoryFk,
    $core.Iterable<$core.String>? notIds,
    $core.bool? thisMonth,
    LatLng? coordinates,
  }) {
    final _result = create();
    if (categoryFk != null) {
      _result.categoryFk = categoryFk;
    }
    if (notIds != null) {
      _result.notIds.addAll(notIds);
    }
    if (thisMonth != null) {
      _result.thisMonth = thisMonth;
    }
    if (coordinates != null) {
      _result.coordinates = coordinates;
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
  $core.String get categoryFk => $_getSZ(0);
  @$pb.TagNumber(1)
  set categoryFk($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategoryFk() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategoryFk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get notIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get thisMonth => $_getBF(2);
  @$pb.TagNumber(3)
  set thisMonth($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThisMonth() => $_has(2);
  @$pb.TagNumber(3)
  void clearThisMonth() => clearField(3);

  @$pb.TagNumber(4)
  LatLng get coordinates => $_getN(3);
  @$pb.TagNumber(4)
  set coordinates(LatLng v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoordinates() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoordinates() => clearField(4);
  @$pb.TagNumber(4)
  LatLng ensureCoordinates() => $_ensure(3);
}

class ListBusinessResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBusinessResponse', createEmptyInstance: create)
    ..pc<Business>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'business', $pb.PbFieldType.PM, subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  ListBusinessResponse._() : super();
  factory ListBusinessResponse({
    $core.Iterable<Business>? business,
  }) {
    final _result = create();
    if (business != null) {
      _result.business.addAll(business);
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
  $core.List<Business> get business => $_getList(0);
}

class Business extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Business', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photo')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photoUrl')
    ..aOM<LatLng>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', subBuilder: LatLng.create)
    ..pc<Polygon>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'polygon', $pb.PbFieldType.PM, subBuilder: Polygon.create)
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distance', $pb.PbFieldType.OD)
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
    LatLng? coordinates,
    $core.Iterable<Polygon>? polygon,
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
    if (coordinates != null) {
      _result.coordinates = coordinates;
    }
    if (polygon != null) {
      _result.polygon.addAll(polygon);
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

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(5)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(5)
  void clearAddress() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(6)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(6)
  void clearPhone() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(7)
  set email($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(7)
  void clearEmail() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get photo => $_getSZ(6);
  @$pb.TagNumber(8)
  set photo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhoto() => $_has(6);
  @$pb.TagNumber(8)
  void clearPhoto() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get photoUrl => $_getSZ(7);
  @$pb.TagNumber(9)
  set photoUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasPhotoUrl() => $_has(7);
  @$pb.TagNumber(9)
  void clearPhotoUrl() => clearField(9);

  @$pb.TagNumber(10)
  LatLng get coordinates => $_getN(8);
  @$pb.TagNumber(10)
  set coordinates(LatLng v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCoordinates() => $_has(8);
  @$pb.TagNumber(10)
  void clearCoordinates() => clearField(10);
  @$pb.TagNumber(10)
  LatLng ensureCoordinates() => $_ensure(8);

  @$pb.TagNumber(11)
  $core.List<Polygon> get polygon => $_getList(9);

  @$pb.TagNumber(12)
  $core.double get distance => $_getN(10);
  @$pb.TagNumber(12)
  set distance($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasDistance() => $_has(10);
  @$pb.TagNumber(12)
  void clearDistance() => clearField(12);
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

class CreateVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVerificationCodeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..e<VerificationCodeType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: VerificationCodeType.UNSPECIFIED, valueOf: VerificationCodeType.valueOf, enumValues: VerificationCodeType.values)
    ..hasRequiredFields = false
  ;

  CreateVerificationCodeRequest._() : super();
  factory CreateVerificationCodeRequest({
    $core.String? deviceId,
    $core.String? email,
    VerificationCodeType? type,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (email != null) {
      _result.email = email;
    }
    if (type != null) {
      _result.type = type;
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
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  VerificationCodeType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(VerificationCodeType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
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

class VerificationCode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerificationCode', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..e<VerificationCodeType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: VerificationCodeType.UNSPECIFIED, valueOf: VerificationCodeType.valueOf, enumValues: VerificationCodeType.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false
  ;

  VerificationCode._() : super();
  factory VerificationCode({
    $core.String? code,
    VerificationCodeType? type,
    $core.String? deviceId,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (type != null) {
      _result.type = type;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
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
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  VerificationCodeType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(VerificationCodeType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);
}

class LatLng extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LatLng', createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  LatLng._() : super();
  factory LatLng({
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
  factory LatLng.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LatLng.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LatLng clone() => LatLng()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LatLng copyWith(void Function(LatLng) updates) => super.copyWith((message) => updates(message as LatLng)) as LatLng; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LatLng create() => LatLng._();
  LatLng createEmptyInstance() => create();
  static $pb.PbList<LatLng> createRepeated() => $pb.PbList<LatLng>();
  @$core.pragma('dart2js:noInline')
  static LatLng getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LatLng>(create);
  static LatLng? _defaultInstance;

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

class RepeatedBusiness extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RepeatedBusiness', createEmptyInstance: create)
    ..pc<Business>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'business', $pb.PbFieldType.PM, subBuilder: Business.create)
    ..hasRequiredFields = false
  ;

  RepeatedBusiness._() : super();
  factory RepeatedBusiness({
    $core.Iterable<Business>? business,
  }) {
    final _result = create();
    if (business != null) {
      _result.business.addAll(business);
    }
    return _result;
  }
  factory RepeatedBusiness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepeatedBusiness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepeatedBusiness clone() => RepeatedBusiness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepeatedBusiness copyWith(void Function(RepeatedBusiness) updates) => super.copyWith((message) => updates(message as RepeatedBusiness)) as RepeatedBusiness; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RepeatedBusiness create() => RepeatedBusiness._();
  RepeatedBusiness createEmptyInstance() => create();
  static $pb.PbList<RepeatedBusiness> createRepeated() => $pb.PbList<RepeatedBusiness>();
  @$core.pragma('dart2js:noInline')
  static RepeatedBusiness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepeatedBusiness>(create);
  static RepeatedBusiness? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Business> get business => $_getList(0);
}

class BusinessCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BusinessCategory', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  BusinessCategory._() : super();
  factory BusinessCategory({
    $core.String? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory BusinessCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusinessCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusinessCategory clone() => BusinessCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusinessCategory copyWith(void Function(BusinessCategory) updates) => super.copyWith((message) => updates(message as BusinessCategory)) as BusinessCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BusinessCategory create() => BusinessCategory._();
  BusinessCategory createEmptyInstance() => create();
  static $pb.PbList<BusinessCategory> createRepeated() => $pb.PbList<BusinessCategory>();
  @$core.pragma('dart2js:noInline')
  static BusinessCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusinessCategory>(create);
  static BusinessCategory? _defaultInstance;

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
}

