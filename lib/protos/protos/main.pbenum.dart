///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME

// Dart imports:
import 'dart:core' as $core;

// Package imports:
import 'package:protobuf/protobuf.dart' as $pb;

class SearchMunicipalityType extends $pb.ProtobufEnum {
  static const SearchMunicipalityType SearchMunicipalityTypeUnspecified = SearchMunicipalityType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SearchMunicipalityTypeUnspecified');
  static const SearchMunicipalityType More = SearchMunicipalityType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'More');
  static const SearchMunicipalityType NoMore = SearchMunicipalityType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NoMore');

  static const $core.List<SearchMunicipalityType> values = <SearchMunicipalityType> [
    SearchMunicipalityTypeUnspecified,
    More,
    NoMore,
  ];

  static final $core.Map<$core.int, SearchMunicipalityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SearchMunicipalityType? valueOf($core.int value) => _byValue[value];

  const SearchMunicipalityType._($core.int v, $core.String n) : super(v, n);
}

class VerificationCodeType extends $pb.ProtobufEnum {
  static const VerificationCodeType VerificationCodeTypeUnspecified = VerificationCodeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VerificationCodeTypeUnspecified');
  static const VerificationCodeType SignIn = VerificationCodeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SignIn');
  static const VerificationCodeType SignUp = VerificationCodeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SignUp');
  static const VerificationCodeType ChangeUserEmail = VerificationCodeType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ChangeUserEmail');

  static const $core.List<VerificationCodeType> values = <VerificationCodeType> [
    VerificationCodeTypeUnspecified,
    SignIn,
    SignUp,
    ChangeUserEmail,
  ];

  static final $core.Map<$core.int, VerificationCodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VerificationCodeType? valueOf($core.int value) => _byValue[value];

  const VerificationCodeType._($core.int v, $core.String n) : super(v, n);
}

class ItemStatusType extends $pb.ProtobufEnum {
  static const ItemStatusType ItemStatusTypeUnspecified = ItemStatusType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ItemStatusTypeUnspecified');
  static const ItemStatusType Available = ItemStatusType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Available');
  static const ItemStatusType Unavailable = ItemStatusType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Unavailable');
  static const ItemStatusType Deprecated = ItemStatusType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Deprecated');

  static const $core.List<ItemStatusType> values = <ItemStatusType> [
    ItemStatusTypeUnspecified,
    Available,
    Unavailable,
    Deprecated,
  ];

  static final $core.Map<$core.int, ItemStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ItemStatusType? valueOf($core.int value) => _byValue[value];

  const ItemStatusType._($core.int v, $core.String n) : super(v, n);
}

class BusinessStatusType extends $pb.ProtobufEnum {
  static const BusinessStatusType BusinessStatusTypeUnspecified = BusinessStatusType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BusinessStatusTypeUnspecified');
  static const BusinessStatusType BusinessAvailable = BusinessStatusType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BusinessAvailable');
  static const BusinessStatusType BusinessUnavailable = BusinessStatusType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BusinessUnavailable');

  static const $core.List<BusinessStatusType> values = <BusinessStatusType> [
    BusinessStatusTypeUnspecified,
    BusinessAvailable,
    BusinessUnavailable,
  ];

  static final $core.Map<$core.int, BusinessStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusinessStatusType? valueOf($core.int value) => _byValue[value];

  const BusinessStatusType._($core.int v, $core.String n) : super(v, n);
}

class PlatformType extends $pb.ProtobufEnum {
  static const PlatformType PlatformTypeUnspecified = PlatformType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PlatformTypeUnspecified');
  static const PlatformType IOS = PlatformType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IOS');
  static const PlatformType Android = PlatformType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Android');

  static const $core.List<PlatformType> values = <PlatformType> [
    PlatformTypeUnspecified,
    IOS,
    Android,
  ];

  static final $core.Map<$core.int, PlatformType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlatformType? valueOf($core.int value) => _byValue[value];

  const PlatformType._($core.int v, $core.String n) : super(v, n);
}

class AppType extends $pb.ProtobufEnum {
  static const AppType AppTypeUnspecified = AppType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AppTypeUnspecified');
  static const AppType App = AppType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'App');
  static const AppType BusinessApp = AppType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BusinessApp');

  static const $core.List<AppType> values = <AppType> [
    AppTypeUnspecified,
    App,
    BusinessApp,
  ];

  static final $core.Map<$core.int, AppType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AppType? valueOf($core.int value) => _byValue[value];

  const AppType._($core.int v, $core.String n) : super(v, n);
}

class OrderStatusType extends $pb.ProtobufEnum {
  static const OrderStatusType OrderStatusTypeUnspecified = OrderStatusType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OrderStatusTypeUnspecified');
  static const OrderStatusType Pending = OrderStatusType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Pending');
  static const OrderStatusType Approved = OrderStatusType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Approved');
  static const OrderStatusType Rejected = OrderStatusType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Rejected');
  static const OrderStatusType Received = OrderStatusType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Received');

  static const $core.List<OrderStatusType> values = <OrderStatusType> [
    OrderStatusTypeUnspecified,
    Pending,
    Approved,
    Rejected,
    Received,
  ];

  static final $core.Map<$core.int, OrderStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OrderStatusType? valueOf($core.int value) => _byValue[value];

  const OrderStatusType._($core.int v, $core.String n) : super(v, n);
}

class DeliveryType extends $pb.ProtobufEnum {
  static const DeliveryType DeliveryTypeUnspecified = DeliveryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DeliveryTypeUnspecified');
  static const DeliveryType ToPickUp = DeliveryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ToPickUp');
  static const DeliveryType HomeDelivery = DeliveryType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HomeDelivery');

  static const $core.List<DeliveryType> values = <DeliveryType> [
    DeliveryTypeUnspecified,
    ToPickUp,
    HomeDelivery,
  ];

  static final $core.Map<$core.int, DeliveryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeliveryType? valueOf($core.int value) => _byValue[value];

  const DeliveryType._($core.int v, $core.String n) : super(v, n);
}

class ResidenceType extends $pb.ProtobufEnum {
  static const ResidenceType ResidenceTypeUnspecified = ResidenceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ResidenceTypeUnspecified');
  static const ResidenceType House = ResidenceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'House');
  static const ResidenceType Apartment = ResidenceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Apartment');

  static const $core.List<ResidenceType> values = <ResidenceType> [
    ResidenceTypeUnspecified,
    House,
    Apartment,
  ];

  static final $core.Map<$core.int, ResidenceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResidenceType? valueOf($core.int value) => _byValue[value];

  const ResidenceType._($core.int v, $core.String n) : super(v, n);
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

