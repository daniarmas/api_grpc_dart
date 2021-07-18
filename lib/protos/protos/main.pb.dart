///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListBusinessRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBusinessRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryFk')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notIds')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thisMonth')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ListBusinessRequest._() : super();
  factory ListBusinessRequest({
    $core.String? categoryFk,
    $core.int? limit,
    $core.Iterable<$core.String>? notIds,
    $core.bool? thisMonth,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (categoryFk != null) {
      _result.categoryFk = categoryFk;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (notIds != null) {
      _result.notIds.addAll(notIds);
    }
    if (thisMonth != null) {
      _result.thisMonth = thisMonth;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
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
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get notIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get thisMonth => $_getBF(3);
  @$pb.TagNumber(4)
  set thisMonth($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasThisMonth() => $_has(3);
  @$pb.TagNumber(4)
  void clearThisMonth() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get latitude => $_getN(4);
  @$pb.TagNumber(5)
  set latitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLatitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLatitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get longitude => $_getN(5);
  @$pb.TagNumber(6)
  set longitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLongitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLongitude() => clearField(6);
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
    ..aOM<LatLng>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'coordinates', subBuilder: LatLng.create)
    ..pc<Polygon>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'polygon', $pb.PbFieldType.PM, subBuilder: Polygon.create)
    ..hasRequiredFields = false
  ;

  Business._() : super();
  factory Business({
    $core.String? id,
    $core.String? name,
    LatLng? coordinates,
    $core.Iterable<Polygon>? polygon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (coordinates != null) {
      _result.coordinates = coordinates;
    }
    if (polygon != null) {
      _result.polygon.addAll(polygon);
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
  LatLng get coordinates => $_getN(2);
  @$pb.TagNumber(3)
  set coordinates(LatLng v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCoordinates() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoordinates() => clearField(3);
  @$pb.TagNumber(3)
  LatLng ensureCoordinates() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<Polygon> get polygon => $_getList(3);
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

