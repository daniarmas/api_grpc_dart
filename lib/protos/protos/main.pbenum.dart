///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SearchMunicipalityType extends $pb.ProtobufEnum {
  static const SearchMunicipalityType SEARCH_MUNICIPALITY_TYPE_UNSPECIFIED = SearchMunicipalityType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH_MUNICIPALITY_TYPE_UNSPECIFIED');
  static const SearchMunicipalityType MORE = SearchMunicipalityType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MORE');
  static const SearchMunicipalityType NO_MORE = SearchMunicipalityType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NO_MORE');

  static const $core.List<SearchMunicipalityType> values = <SearchMunicipalityType> [
    SEARCH_MUNICIPALITY_TYPE_UNSPECIFIED,
    MORE,
    NO_MORE,
  ];

  static final $core.Map<$core.int, SearchMunicipalityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SearchMunicipalityType? valueOf($core.int value) => _byValue[value];

  const SearchMunicipalityType._($core.int v, $core.String n) : super(v, n);
}

class VerificationCodeType extends $pb.ProtobufEnum {
  static const VerificationCodeType VERIFICATION_CODE_TYPE_UNSPECIFIED = VerificationCodeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFICATION_CODE_TYPE_UNSPECIFIED');
  static const VerificationCodeType SIGN_IN = VerificationCodeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIGN_IN');
  static const VerificationCodeType SIGN_UP = VerificationCodeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIGN_UP');
  static const VerificationCodeType CHANGE_USER_EMAIL = VerificationCodeType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_USER_EMAIL');

  static const $core.List<VerificationCodeType> values = <VerificationCodeType> [
    VERIFICATION_CODE_TYPE_UNSPECIFIED,
    SIGN_IN,
    SIGN_UP,
    CHANGE_USER_EMAIL,
  ];

  static final $core.Map<$core.int, VerificationCodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VerificationCodeType? valueOf($core.int value) => _byValue[value];

  const VerificationCodeType._($core.int v, $core.String n) : super(v, n);
}

class ItemStatusType extends $pb.ProtobufEnum {
  static const ItemStatusType ITEM_STATUS_TYPE_UNSPECIFIED = ItemStatusType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ITEM_STATUS_TYPE_UNSPECIFIED');
  static const ItemStatusType AVAILABLE = ItemStatusType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AVAILABLE');
  static const ItemStatusType UNAVAILABLE = ItemStatusType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAVAILABLE');
  static const ItemStatusType DEPRECATED = ItemStatusType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEPRECATED');

  static const $core.List<ItemStatusType> values = <ItemStatusType> [
    ITEM_STATUS_TYPE_UNSPECIFIED,
    AVAILABLE,
    UNAVAILABLE,
    DEPRECATED,
  ];

  static final $core.Map<$core.int, ItemStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ItemStatusType? valueOf($core.int value) => _byValue[value];

  const ItemStatusType._($core.int v, $core.String n) : super(v, n);
}

class BusinessStatusType extends $pb.ProtobufEnum {
  static const BusinessStatusType BUSINESS_STATUS_TYPE_UNSPECIFIED = BusinessStatusType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_STATUS_TYPE_UNSPECIFIED');
  static const BusinessStatusType BUSINESS_AVAILABLE = BusinessStatusType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_AVAILABLE');
  static const BusinessStatusType BUSINESS_UNAVAILABLE = BusinessStatusType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_UNAVAILABLE');

  static const $core.List<BusinessStatusType> values = <BusinessStatusType> [
    BUSINESS_STATUS_TYPE_UNSPECIFIED,
    BUSINESS_AVAILABLE,
    BUSINESS_UNAVAILABLE,
  ];

  static final $core.Map<$core.int, BusinessStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusinessStatusType? valueOf($core.int value) => _byValue[value];

  const BusinessStatusType._($core.int v, $core.String n) : super(v, n);
}

class PlatformType extends $pb.ProtobufEnum {
  static const PlatformType PLATFORM_TYPE_UNSPECIFIED = PlatformType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLATFORM_TYPE_UNSPECIFIED');
  static const PlatformType IOS = PlatformType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IOS');
  static const PlatformType ANDROID = PlatformType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID');

  static const $core.List<PlatformType> values = <PlatformType> [
    PLATFORM_TYPE_UNSPECIFIED,
    IOS,
    ANDROID,
  ];

  static final $core.Map<$core.int, PlatformType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlatformType? valueOf($core.int value) => _byValue[value];

  const PlatformType._($core.int v, $core.String n) : super(v, n);
}

class AppType extends $pb.ProtobufEnum {
  static const AppType APP_TYPE_UNSPECIFIED = AppType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_TYPE_UNSPECIFIED');
  static const AppType APP = AppType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP');
  static const AppType BUSINESS_APP = AppType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_APP');

  static const $core.List<AppType> values = <AppType> [
    APP_TYPE_UNSPECIFIED,
    APP,
    BUSINESS_APP,
  ];

  static final $core.Map<$core.int, AppType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AppType? valueOf($core.int value) => _byValue[value];

  const AppType._($core.int v, $core.String n) : super(v, n);
}

class HealthCheckResponse_ServingStatus extends $pb.ProtobufEnum {
  static const HealthCheckResponse_ServingStatus UNKNOWN = HealthCheckResponse_ServingStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const HealthCheckResponse_ServingStatus SERVING = HealthCheckResponse_ServingStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVING');
  static const HealthCheckResponse_ServingStatus NOT_SERVING = HealthCheckResponse_ServingStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_SERVING');

  static const $core.List<HealthCheckResponse_ServingStatus> values = <HealthCheckResponse_ServingStatus> [
    UNKNOWN,
    SERVING,
    NOT_SERVING,
  ];

  static final $core.Map<$core.int, HealthCheckResponse_ServingStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HealthCheckResponse_ServingStatus? valueOf($core.int value) => _byValue[value];

  const HealthCheckResponse_ServingStatus._($core.int v, $core.String n) : super(v, n);
}

class UserAddress_UserAddressType extends $pb.ProtobufEnum {
  static const UserAddress_UserAddressType UNSPECIFIED = UserAddress_UserAddressType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPECIFIED');
  static const UserAddress_UserAddressType HOUSE = UserAddress_UserAddressType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOUSE');
  static const UserAddress_UserAddressType APARTAMENT = UserAddress_UserAddressType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APARTAMENT');

  static const $core.List<UserAddress_UserAddressType> values = <UserAddress_UserAddressType> [
    UNSPECIFIED,
    HOUSE,
    APARTAMENT,
  ];

  static final $core.Map<$core.int, UserAddress_UserAddressType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserAddress_UserAddressType? valueOf($core.int value) => _byValue[value];

  const UserAddress_UserAddressType._($core.int v, $core.String n) : super(v, n);
}

