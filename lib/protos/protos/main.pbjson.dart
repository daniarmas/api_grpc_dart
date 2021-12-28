///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use searchMunicipalityTypeDescriptor instead')
const SearchMunicipalityType$json = const {
  '1': 'SearchMunicipalityType',
  '2': const [
    const {'1': 'SearchMunicipalityTypeUnspecified', '2': 0},
    const {'1': 'More', '2': 1},
    const {'1': 'NoMore', '2': 2},
  ],
};

/// Descriptor for `SearchMunicipalityType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List searchMunicipalityTypeDescriptor = $convert.base64Decode('ChZTZWFyY2hNdW5pY2lwYWxpdHlUeXBlEiUKIVNlYXJjaE11bmljaXBhbGl0eVR5cGVVbnNwZWNpZmllZBAAEggKBE1vcmUQARIKCgZOb01vcmUQAg==');
@$core.Deprecated('Use verificationCodeTypeDescriptor instead')
const VerificationCodeType$json = const {
  '1': 'VerificationCodeType',
  '2': const [
    const {'1': 'VerificationCodeTypeUnspecified', '2': 0},
    const {'1': 'SignIn', '2': 1},
    const {'1': 'SignUp', '2': 2},
    const {'1': 'ChangeUserEmail', '2': 3},
  ],
};

/// Descriptor for `VerificationCodeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List verificationCodeTypeDescriptor = $convert.base64Decode('ChRWZXJpZmljYXRpb25Db2RlVHlwZRIjCh9WZXJpZmljYXRpb25Db2RlVHlwZVVuc3BlY2lmaWVkEAASCgoGU2lnbkluEAESCgoGU2lnblVwEAISEwoPQ2hhbmdlVXNlckVtYWlsEAM=');
@$core.Deprecated('Use itemStatusTypeDescriptor instead')
const ItemStatusType$json = const {
  '1': 'ItemStatusType',
  '2': const [
    const {'1': 'ItemStatusTypeUnspecified', '2': 0},
    const {'1': 'Available', '2': 1},
    const {'1': 'Unavailable', '2': 2},
    const {'1': 'Deprecated', '2': 3},
  ],
};

/// Descriptor for `ItemStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List itemStatusTypeDescriptor = $convert.base64Decode('Cg5JdGVtU3RhdHVzVHlwZRIdChlJdGVtU3RhdHVzVHlwZVVuc3BlY2lmaWVkEAASDQoJQXZhaWxhYmxlEAESDwoLVW5hdmFpbGFibGUQAhIOCgpEZXByZWNhdGVkEAM=');
@$core.Deprecated('Use businessStatusTypeDescriptor instead')
const BusinessStatusType$json = const {
  '1': 'BusinessStatusType',
  '2': const [
    const {'1': 'BusinessStatusTypeUnspecified', '2': 0},
    const {'1': 'BusinessAvailable', '2': 1},
    const {'1': 'BusinessUnavailable', '2': 2},
  ],
};

/// Descriptor for `BusinessStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List businessStatusTypeDescriptor = $convert.base64Decode('ChJCdXNpbmVzc1N0YXR1c1R5cGUSIQodQnVzaW5lc3NTdGF0dXNUeXBlVW5zcGVjaWZpZWQQABIVChFCdXNpbmVzc0F2YWlsYWJsZRABEhcKE0J1c2luZXNzVW5hdmFpbGFibGUQAg==');
@$core.Deprecated('Use platformTypeDescriptor instead')
const PlatformType$json = const {
  '1': 'PlatformType',
  '2': const [
    const {'1': 'PlatformTypeUnspecified', '2': 0},
    const {'1': 'IOS', '2': 1},
    const {'1': 'Android', '2': 2},
  ],
};

/// Descriptor for `PlatformType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List platformTypeDescriptor = $convert.base64Decode('CgxQbGF0Zm9ybVR5cGUSGwoXUGxhdGZvcm1UeXBlVW5zcGVjaWZpZWQQABIHCgNJT1MQARILCgdBbmRyb2lkEAI=');
@$core.Deprecated('Use appTypeDescriptor instead')
const AppType$json = const {
  '1': 'AppType',
  '2': const [
    const {'1': 'AppTypeUnspecified', '2': 0},
    const {'1': 'App', '2': 1},
    const {'1': 'BusinessApp', '2': 2},
  ],
};

/// Descriptor for `AppType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List appTypeDescriptor = $convert.base64Decode('CgdBcHBUeXBlEhYKEkFwcFR5cGVVbnNwZWNpZmllZBAAEgcKA0FwcBABEg8KC0J1c2luZXNzQXBwEAI=');
@$core.Deprecated('Use orderStatusTypeDescriptor instead')
const OrderStatusType$json = const {
  '1': 'OrderStatusType',
  '2': const [
    const {'1': 'OrderStatusTypeUnspecified', '2': 0},
    const {'1': 'Pending', '2': 1},
    const {'1': 'Approved', '2': 2},
    const {'1': 'Rejected', '2': 3},
    const {'1': 'Received', '2': 4},
  ],
};

/// Descriptor for `OrderStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderStatusTypeDescriptor = $convert.base64Decode('Cg9PcmRlclN0YXR1c1R5cGUSHgoaT3JkZXJTdGF0dXNUeXBlVW5zcGVjaWZpZWQQABILCgdQZW5kaW5nEAESDAoIQXBwcm92ZWQQAhIMCghSZWplY3RlZBADEgwKCFJlY2VpdmVkEAQ=');
@$core.Deprecated('Use deliveryTypeDescriptor instead')
const DeliveryType$json = const {
  '1': 'DeliveryType',
  '2': const [
    const {'1': 'DeliveryTypeUnspecified', '2': 0},
    const {'1': 'ToPickUp', '2': 1},
    const {'1': 'HomeDelivery', '2': 2},
  ],
};

/// Descriptor for `DeliveryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deliveryTypeDescriptor = $convert.base64Decode('CgxEZWxpdmVyeVR5cGUSGwoXRGVsaXZlcnlUeXBlVW5zcGVjaWZpZWQQABIMCghUb1BpY2tVcBABEhAKDEhvbWVEZWxpdmVyeRAC');
@$core.Deprecated('Use residenceTypeDescriptor instead')
const ResidenceType$json = const {
  '1': 'ResidenceType',
  '2': const [
    const {'1': 'ResidenceTypeUnspecified', '2': 0},
    const {'1': 'House', '2': 1},
    const {'1': 'Apartment', '2': 2},
  ],
};

/// Descriptor for `ResidenceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List residenceTypeDescriptor = $convert.base64Decode('Cg1SZXNpZGVuY2VUeXBlEhwKGFJlc2lkZW5jZVR5cGVVbnNwZWNpZmllZBAAEgkKBUhvdXNlEAESDQoJQXBhcnRtZW50EAI=');
@$core.Deprecated('Use getOrderRequestDescriptor instead')
const GetOrderRequest$json = const {
  '1': 'GetOrderRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `GetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderRequestDescriptor = $convert.base64Decode('Cg9HZXRPcmRlclJlcXVlc3QSDgoCaWQYASABKAlSAmlkEjgKCWZpZWxkTWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use getOrderResponseDescriptor instead')
const GetOrderResponse$json = const {
  '1': 'GetOrderResponse',
  '2': const [
    const {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.Order', '10': 'order'},
  ],
};

/// Descriptor for `GetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderResponseDescriptor = $convert.base64Decode('ChBHZXRPcmRlclJlc3BvbnNlEhwKBW9yZGVyGAEgASgLMgYuT3JkZXJSBW9yZGVy');
@$core.Deprecated('Use listOrderRequestDescriptor instead')
const ListOrderRequest$json = const {
  '1': 'ListOrderRequest',
  '2': const [
    const {'1': 'nextPage', '3': 1, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `ListOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOrderRequestDescriptor = $convert.base64Decode('ChBMaXN0T3JkZXJSZXF1ZXN0EhoKCG5leHRQYWdlGAEgASgJUghuZXh0UGFnZRI4CglmaWVsZE1hc2sYAiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2s=');
@$core.Deprecated('Use listOrderResponseDescriptor instead')
const ListOrderResponse$json = const {
  '1': 'ListOrderResponse',
  '2': const [
    const {'1': 'orders', '3': 1, '4': 3, '5': 11, '6': '.Order', '10': 'orders'},
    const {'1': 'nextPage', '3': 2, '4': 1, '5': 9, '10': 'nextPage'},
  ],
};

/// Descriptor for `ListOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOrderResponseDescriptor = $convert.base64Decode('ChFMaXN0T3JkZXJSZXNwb25zZRIeCgZvcmRlcnMYASADKAsyBi5PcmRlclIGb3JkZXJzEhoKCG5leHRQYWdlGAIgASgJUghuZXh0UGFnZQ==');
@$core.Deprecated('Use getCartItemRequestDescriptor instead')
const GetCartItemRequest$json = const {
  '1': 'GetCartItemRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `GetCartItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCartItemRequestDescriptor = $convert.base64Decode('ChJHZXRDYXJ0SXRlbVJlcXVlc3QSDgoCaWQYASABKAlSAmlkEjgKCWZpZWxkTWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use getCartItemResponseDescriptor instead')
const GetCartItemResponse$json = const {
  '1': 'GetCartItemResponse',
  '2': const [
    const {'1': 'item', '3': 1, '4': 1, '5': 11, '6': '.Item', '10': 'item'},
  ],
};

/// Descriptor for `GetCartItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCartItemResponseDescriptor = $convert.base64Decode('ChNHZXRDYXJ0SXRlbVJlc3BvbnNlEhkKBGl0ZW0YASABKAsyBS5JdGVtUgRpdGVt');
@$core.Deprecated('Use listCartItemRequestDescriptor instead')
const ListCartItemRequest$json = const {
  '1': 'ListCartItemRequest',
  '2': const [
    const {'1': 'nextPage', '3': 1, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `ListCartItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCartItemRequestDescriptor = $convert.base64Decode('ChNMaXN0Q2FydEl0ZW1SZXF1ZXN0EhoKCG5leHRQYWdlGAEgASgJUghuZXh0UGFnZRI4CglmaWVsZE1hc2sYAiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2s=');
@$core.Deprecated('Use listCartItemResponseDescriptor instead')
const ListCartItemResponse$json = const {
  '1': 'ListCartItemResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.Item', '10': 'items'},
    const {'1': 'nextPage', '3': 2, '4': 1, '5': 9, '10': 'nextPage'},
  ],
};

/// Descriptor for `ListCartItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCartItemResponseDescriptor = $convert.base64Decode('ChRMaXN0Q2FydEl0ZW1SZXNwb25zZRIbCgVpdGVtcxgBIAMoCzIFLkl0ZW1SBWl0ZW1zEhoKCG5leHRQYWdlGAIgASgJUghuZXh0UGFnZQ==');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'fieldMask', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
    const {'1': 'updateMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'updateMask'},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'alias', '3': 5, '4': 1, '5': 9, '10': 'alias'},
    const {'1': 'fullName', '3': 6, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'thumbnail', '3': 7, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 8, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'highQualityPhoto', '3': 9, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'highQualityPhotoBlurHash', '3': 10, '4': 1, '5': 9, '10': 'highQualityPhotoBlurHash'},
    const {'1': 'lowQualityPhoto', '3': 11, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'lowQualityPhotoBlurHash', '3': 12, '4': 1, '5': 9, '10': 'lowQualityPhotoBlurHash'},
    const {'1': 'code', '3': 13, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBI4CglmaWVsZE1hc2sYASABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2sSOgoKdXBkYXRlTWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCnVwZGF0ZU1hc2sSDgoCaWQYAyABKAlSAmlkEhQKBWVtYWlsGAQgASgJUgVlbWFpbBIUCgVhbGlhcxgFIAEoCVIFYWxpYXMSGgoIZnVsbE5hbWUYBiABKAlSCGZ1bGxOYW1lEhwKCXRodW1ibmFpbBgHIAEoCVIJdGh1bWJuYWlsEiwKEXRodW1ibmFpbEJsdXJIYXNoGAggASgJUhF0aHVtYm5haWxCbHVySGFzaBIqChBoaWdoUXVhbGl0eVBob3RvGAkgASgJUhBoaWdoUXVhbGl0eVBob3RvEjoKGGhpZ2hRdWFsaXR5UGhvdG9CbHVySGFzaBgKIAEoCVIYaGlnaFF1YWxpdHlQaG90b0JsdXJIYXNoEigKD2xvd1F1YWxpdHlQaG90bxgLIAEoCVIPbG93UXVhbGl0eVBob3RvEjgKF2xvd1F1YWxpdHlQaG90b0JsdXJIYXNoGAwgASgJUhdsb3dRdWFsaXR5UGhvdG9CbHVySGFzaBISCgRjb2RlGA0gASgJUgRjb2Rl');
@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = const {
  '1': 'UpdateUserResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode('ChJVcGRhdGVVc2VyUmVzcG9uc2USGQoEdXNlchgBIAEoCzIFLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use listSessionRequestDescriptor instead')
const ListSessionRequest$json = const {
  '1': 'ListSessionRequest',
  '2': const [
    const {'1': 'fieldMask', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `ListSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionRequestDescriptor = $convert.base64Decode('ChJMaXN0U2Vzc2lvblJlcXVlc3QSOAoJZmllbGRNYXNrGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IJZmllbGRNYXNr');
@$core.Deprecated('Use listSessionResponseDescriptor instead')
const ListSessionResponse$json = const {
  '1': 'ListSessionResponse',
  '2': const [
    const {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.Session', '10': 'sessions'},
  ],
};

/// Descriptor for `ListSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSessionResponseDescriptor = $convert.base64Decode('ChNMaXN0U2Vzc2lvblJlc3BvbnNlEiQKCHNlc3Npb25zGAEgAygLMgguU2Vzc2lvblIIc2Vzc2lvbnM=');
@$core.Deprecated('Use signOutRequestDescriptor instead')
const SignOutRequest$json = const {
  '1': 'SignOutRequest',
  '2': const [
    const {'1': 'all', '3': 1, '4': 1, '5': 8, '10': 'all'},
    const {'1': 'authorizationTokenFk', '3': 2, '4': 1, '5': 9, '10': 'authorizationTokenFk'},
  ],
};

/// Descriptor for `SignOutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signOutRequestDescriptor = $convert.base64Decode('Cg5TaWduT3V0UmVxdWVzdBIQCgNhbGwYASABKAhSA2FsbBIyChRhdXRob3JpemF0aW9uVG9rZW5GaxgCIAEoCVIUYXV0aG9yaXphdGlvblRva2VuRms=');
@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = const {
  '1': 'RefreshTokenRequest',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode('ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiIKDHJlZnJlc2hUb2tlbhgBIAEoCVIMcmVmcmVzaFRva2VuEjgKCWZpZWxkTWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = const {
  '1': 'RefreshTokenResponse',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '10': 'authorizationToken'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode('ChRSZWZyZXNoVG9rZW5SZXNwb25zZRIiCgxyZWZyZXNoVG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbhIuChJhdXRob3JpemF0aW9uVG9rZW4YAiABKAlSEmF1dGhvcml6YXRpb25Ub2tlbg==');
@$core.Deprecated('Use searchItemRequestDescriptor instead')
const SearchItemRequest$json = const {
  '1': 'SearchItemRequest',
  '2': const [
    const {'1': 'nextPage', '3': 1, '4': 1, '5': 5, '10': 'nextPage'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'provinceFk', '3': 3, '4': 1, '5': 9, '10': 'provinceFk'},
    const {'1': 'municipalityFk', '3': 4, '4': 1, '5': 9, '10': 'municipalityFk'},
    const {'1': 'searchMunicipalityType', '3': 5, '4': 1, '5': 14, '6': '.SearchMunicipalityType', '10': 'searchMunicipalityType'},
    const {'1': 'location', '3': 6, '4': 1, '5': 11, '6': '.Point', '10': 'location'},
    const {'1': 'fieldMask', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `SearchItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchItemRequestDescriptor = $convert.base64Decode('ChFTZWFyY2hJdGVtUmVxdWVzdBIaCghuZXh0UGFnZRgBIAEoBVIIbmV4dFBhZ2USEgoEbmFtZRgCIAEoCVIEbmFtZRIeCgpwcm92aW5jZUZrGAMgASgJUgpwcm92aW5jZUZrEiYKDm11bmljaXBhbGl0eUZrGAQgASgJUg5tdW5pY2lwYWxpdHlGaxJPChZzZWFyY2hNdW5pY2lwYWxpdHlUeXBlGAUgASgOMhcuU2VhcmNoTXVuaWNpcGFsaXR5VHlwZVIWc2VhcmNoTXVuaWNpcGFsaXR5VHlwZRIiCghsb2NhdGlvbhgGIAEoCzIGLlBvaW50Ughsb2NhdGlvbhI4CglmaWVsZE1hc2sYByABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2s=');
@$core.Deprecated('Use searchItemResponseDescriptor instead')
const SearchItemResponse$json = const {
  '1': 'SearchItemResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.SearchItem', '10': 'items'},
    const {'1': 'searchMunicipalityType', '3': 2, '4': 1, '5': 14, '6': '.SearchMunicipalityType', '10': 'searchMunicipalityType'},
    const {'1': 'nextPage', '3': 3, '4': 1, '5': 5, '10': 'nextPage'},
  ],
};

/// Descriptor for `SearchItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchItemResponseDescriptor = $convert.base64Decode('ChJTZWFyY2hJdGVtUmVzcG9uc2USIQoFaXRlbXMYASADKAsyCy5TZWFyY2hJdGVtUgVpdGVtcxJPChZzZWFyY2hNdW5pY2lwYWxpdHlUeXBlGAIgASgOMhcuU2VhcmNoTXVuaWNpcGFsaXR5VHlwZVIWc2VhcmNoTXVuaWNpcGFsaXR5VHlwZRIaCghuZXh0UGFnZRgDIAEoBVIIbmV4dFBhZ2U=');
@$core.Deprecated('Use listItemRequestDescriptor instead')
const ListItemRequest$json = const {
  '1': 'ListItemRequest',
  '2': const [
    const {'1': 'nextPage', '3': 1, '4': 1, '5': 9, '10': 'nextPage'},
    const {'1': 'businessFk', '3': 2, '4': 1, '5': 9, '10': 'businessFk'},
    const {'1': 'fieldMask', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `ListItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listItemRequestDescriptor = $convert.base64Decode('Cg9MaXN0SXRlbVJlcXVlc3QSGgoIbmV4dFBhZ2UYASABKAlSCG5leHRQYWdlEh4KCmJ1c2luZXNzRmsYAiABKAlSCmJ1c2luZXNzRmsSOAoJZmllbGRNYXNrGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IJZmllbGRNYXNr');
@$core.Deprecated('Use listItemResponseDescriptor instead')
const ListItemResponse$json = const {
  '1': 'ListItemResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.Item', '10': 'items'},
    const {'1': 'nextPage', '3': 2, '4': 1, '5': 9, '10': 'nextPage'},
  ],
};

/// Descriptor for `ListItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listItemResponseDescriptor = $convert.base64Decode('ChBMaXN0SXRlbVJlc3BvbnNlEhsKBWl0ZW1zGAEgAygLMgUuSXRlbVIFaXRlbXMSGgoIbmV4dFBhZ2UYAiABKAlSCG5leHRQYWdl');
@$core.Deprecated('Use getItemRequestDescriptor instead')
const GetItemRequest$json = const {
  '1': 'GetItemRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'location', '3': 2, '4': 1, '5': 11, '6': '.Point', '10': 'location'},
    const {'1': 'fieldMask', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `GetItemRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getItemRequestDescriptor = $convert.base64Decode('Cg5HZXRJdGVtUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSIgoIbG9jYXRpb24YAiABKAsyBi5Qb2ludFIIbG9jYXRpb24SOAoJZmllbGRNYXNrGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IJZmllbGRNYXNr');
@$core.Deprecated('Use getItemResponseDescriptor instead')
const GetItemResponse$json = const {
  '1': 'GetItemResponse',
  '2': const [
    const {'1': 'item', '3': 1, '4': 1, '5': 11, '6': '.Item', '10': 'item'},
  ],
};

/// Descriptor for `GetItemResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getItemResponseDescriptor = $convert.base64Decode('Cg9HZXRJdGVtUmVzcG9uc2USGQoEaXRlbRgBIAEoCzIFLkl0ZW1SBGl0ZW0=');
@$core.Deprecated('Use feedRequestDescriptor instead')
const FeedRequest$json = const {
  '1': 'FeedRequest',
  '2': const [
    const {'1': 'location', '3': 1, '4': 1, '5': 11, '6': '.Point', '10': 'location'},
    const {'1': 'provinceFk', '3': 2, '4': 1, '5': 9, '10': 'provinceFk'},
    const {'1': 'municipalityFk', '3': 3, '4': 1, '5': 9, '10': 'municipalityFk'},
    const {'1': 'searchMunicipalityType', '3': 4, '4': 1, '5': 14, '6': '.SearchMunicipalityType', '10': 'searchMunicipalityType'},
    const {'1': 'nextPage', '3': 5, '4': 1, '5': 5, '10': 'nextPage'},
    const {'1': 'fieldMask', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `FeedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedRequestDescriptor = $convert.base64Decode('CgtGZWVkUmVxdWVzdBIiCghsb2NhdGlvbhgBIAEoCzIGLlBvaW50Ughsb2NhdGlvbhIeCgpwcm92aW5jZUZrGAIgASgJUgpwcm92aW5jZUZrEiYKDm11bmljaXBhbGl0eUZrGAMgASgJUg5tdW5pY2lwYWxpdHlGaxJPChZzZWFyY2hNdW5pY2lwYWxpdHlUeXBlGAQgASgOMhcuU2VhcmNoTXVuaWNpcGFsaXR5VHlwZVIWc2VhcmNoTXVuaWNpcGFsaXR5VHlwZRIaCghuZXh0UGFnZRgFIAEoBVIIbmV4dFBhZ2USOAoJZmllbGRNYXNrGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IJZmllbGRNYXNr');
@$core.Deprecated('Use feedResponseDescriptor instead')
const FeedResponse$json = const {
  '1': 'FeedResponse',
  '2': const [
    const {'1': 'businesses', '3': 1, '4': 3, '5': 11, '6': '.Business', '10': 'businesses'},
    const {'1': 'isCache', '3': 2, '4': 1, '5': 8, '10': 'isCache'},
    const {'1': 'searchMunicipalityType', '3': 3, '4': 1, '5': 14, '6': '.SearchMunicipalityType', '10': 'searchMunicipalityType'},
    const {'1': 'nextPage', '3': 4, '4': 1, '5': 5, '10': 'nextPage'},
  ],
};

/// Descriptor for `FeedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedResponseDescriptor = $convert.base64Decode('CgxGZWVkUmVzcG9uc2USKQoKYnVzaW5lc3NlcxgBIAMoCzIJLkJ1c2luZXNzUgpidXNpbmVzc2VzEhgKB2lzQ2FjaGUYAiABKAhSB2lzQ2FjaGUSTwoWc2VhcmNoTXVuaWNpcGFsaXR5VHlwZRgDIAEoDjIXLlNlYXJjaE11bmljaXBhbGl0eVR5cGVSFnNlYXJjaE11bmljaXBhbGl0eVR5cGUSGgoIbmV4dFBhZ2UYBCABKAVSCG5leHRQYWdl');
@$core.Deprecated('Use getBusinessRequestDescriptor instead')
const GetBusinessRequest$json = const {
  '1': 'GetBusinessRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fieldMask', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `GetBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessRequestDescriptor = $convert.base64Decode('ChJHZXRCdXNpbmVzc1JlcXVlc3QSDgoCaWQYASABKAlSAmlkEjgKCWZpZWxkTWFzaxgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use getBusinessResponseDescriptor instead')
const GetBusinessResponse$json = const {
  '1': 'GetBusinessResponse',
  '2': const [
    const {'1': 'business', '3': 1, '4': 1, '5': 11, '6': '.Business', '10': 'business'},
  ],
};

/// Descriptor for `GetBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessResponseDescriptor = $convert.base64Decode('ChNHZXRCdXNpbmVzc1Jlc3BvbnNlEiUKCGJ1c2luZXNzGAEgASgLMgkuQnVzaW5lc3NSCGJ1c2luZXNz');
@$core.Deprecated('Use getPresignedPutUserAvatarRequestDescriptor instead')
const GetPresignedPutUserAvatarRequest$json = const {
  '1': 'GetPresignedPutUserAvatarRequest',
  '2': const [
    const {'1': 'objectName', '3': 1, '4': 1, '5': 9, '10': 'objectName'},
  ],
};

/// Descriptor for `GetPresignedPutUserAvatarRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPresignedPutUserAvatarRequestDescriptor = $convert.base64Decode('CiBHZXRQcmVzaWduZWRQdXRVc2VyQXZhdGFyUmVxdWVzdBIeCgpvYmplY3ROYW1lGAEgASgJUgpvYmplY3ROYW1l');
@$core.Deprecated('Use getPresignedPutUserAvatarResponseDescriptor instead')
const GetPresignedPutUserAvatarResponse$json = const {
  '1': 'GetPresignedPutUserAvatarResponse',
  '2': const [
    const {'1': 'highQualityPhoto', '3': 1, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'lowQualityPhoto', '3': 2, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'thumbnailPhoto', '3': 3, '4': 1, '5': 9, '10': 'thumbnailPhoto'},
    const {'1': 'highQualityPhotoName', '3': 4, '4': 1, '5': 9, '10': 'highQualityPhotoName'},
    const {'1': 'lowQualityPhotoName', '3': 5, '4': 1, '5': 9, '10': 'lowQualityPhotoName'},
    const {'1': 'thumbnailPhotoName', '3': 6, '4': 1, '5': 9, '10': 'thumbnailPhotoName'},
  ],
};

/// Descriptor for `GetPresignedPutUserAvatarResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPresignedPutUserAvatarResponseDescriptor = $convert.base64Decode('CiFHZXRQcmVzaWduZWRQdXRVc2VyQXZhdGFyUmVzcG9uc2USKgoQaGlnaFF1YWxpdHlQaG90bxgBIAEoCVIQaGlnaFF1YWxpdHlQaG90bxIoCg9sb3dRdWFsaXR5UGhvdG8YAiABKAlSD2xvd1F1YWxpdHlQaG90bxImCg50aHVtYm5haWxQaG90bxgDIAEoCVIOdGh1bWJuYWlsUGhvdG8SMgoUaGlnaFF1YWxpdHlQaG90b05hbWUYBCABKAlSFGhpZ2hRdWFsaXR5UGhvdG9OYW1lEjAKE2xvd1F1YWxpdHlQaG90b05hbWUYBSABKAlSE2xvd1F1YWxpdHlQaG90b05hbWUSLgoSdGh1bWJuYWlsUGhvdG9OYW1lGAYgASgJUhJ0aHVtYm5haWxQaG90b05hbWU=');
@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'alias', '3': 2, '4': 1, '5': 9, '10': 'alias'},
    const {'1': 'fullName', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'code', '3': 5, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode('Cg1TaWduVXBSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIUCgVhbGlhcxgCIAEoCVIFYWxpYXMSGgoIZnVsbE5hbWUYAyABKAlSCGZ1bGxOYW1lEhIKBGNvZGUYBSABKAlSBGNvZGU=');
@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = const {
  '1': 'SignUpResponse',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '10': 'authorizationToken'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode('Cg5TaWduVXBSZXNwb25zZRIiCgxyZWZyZXNoVG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbhIuChJhdXRob3JpemF0aW9uVG9rZW4YAiABKAlSEmF1dGhvcml6YXRpb25Ub2tlbhIZCgR1c2VyGAMgASgLMgUuVXNlclIEdXNlcg==');
@$core.Deprecated('Use userExistsStreamRequestDescriptor instead')
const UserExistsStreamRequest$json = const {
  '1': 'UserExistsStreamRequest',
  '2': const [
    const {'1': 'alias', '3': 1, '4': 1, '5': 9, '10': 'alias'},
  ],
};

/// Descriptor for `UserExistsStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExistsStreamRequestDescriptor = $convert.base64Decode('ChdVc2VyRXhpc3RzU3RyZWFtUmVxdWVzdBIUCgVhbGlhcxgBIAEoCVIFYWxpYXM=');
@$core.Deprecated('Use userExistsStreamResponseDescriptor instead')
const UserExistsStreamResponse$json = const {
  '1': 'UserExistsStreamResponse',
  '2': const [
    const {'1': 'isValid', '3': 1, '4': 1, '5': 8, '10': 'isValid'},
  ],
};

/// Descriptor for `UserExistsStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExistsStreamResponseDescriptor = $convert.base64Decode('ChhVc2VyRXhpc3RzU3RyZWFtUmVzcG9uc2USGAoHaXNWYWxpZBgBIAEoCFIHaXNWYWxpZA==');
@$core.Deprecated('Use userExistsRequestDescriptor instead')
const UserExistsRequest$json = const {
  '1': 'UserExistsRequest',
  '2': const [
    const {'1': 'alias', '3': 1, '4': 1, '5': 9, '10': 'alias'},
  ],
};

/// Descriptor for `UserExistsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExistsRequestDescriptor = $convert.base64Decode('ChFVc2VyRXhpc3RzUmVxdWVzdBIUCgVhbGlhcxgBIAEoCVIFYWxpYXM=');
@$core.Deprecated('Use checkSessionResponseDescriptor instead')
const CheckSessionResponse$json = const {
  '1': 'CheckSessionResponse',
  '2': const [
    const {'1': 'ipAddresses', '3': 1, '4': 3, '5': 9, '10': 'ipAddresses'},
  ],
};

/// Descriptor for `CheckSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkSessionResponseDescriptor = $convert.base64Decode('ChRDaGVja1Nlc3Npb25SZXNwb25zZRIgCgtpcEFkZHJlc3NlcxgBIAMoCVILaXBBZGRyZXNzZXM=');
@$core.Deprecated('Use checkSessionRequestDescriptor instead')
const CheckSessionRequest$json = const {
  '1': 'CheckSessionRequest',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '10': 'authorizationToken'},
  ],
};

/// Descriptor for `CheckSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkSessionRequestDescriptor = $convert.base64Decode('ChNDaGVja1Nlc3Npb25SZXF1ZXN0EiIKDHJlZnJlc2hUb2tlbhgBIAEoCVIMcmVmcmVzaFRva2VuEi4KEmF1dGhvcml6YXRpb25Ub2tlbhgCIAEoCVISYXV0aG9yaXphdGlvblRva2Vu');
@$core.Deprecated('Use createVerificationCodeRequestDescriptor instead')
const CreateVerificationCodeRequest$json = const {
  '1': 'CreateVerificationCodeRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.VerificationCodeType', '10': 'type'},
    const {'1': 'fieldMask', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `CreateVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createVerificationCodeRequestDescriptor = $convert.base64Decode('Ch1DcmVhdGVWZXJpZmljYXRpb25Db2RlUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSKQoEdHlwZRgCIAEoDjIVLlZlcmlmaWNhdGlvbkNvZGVUeXBlUgR0eXBlEjgKCWZpZWxkTWFzaxgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use createVerificationCodeResponseDescriptor instead')
const CreateVerificationCodeResponse$json = const {
  '1': 'CreateVerificationCodeResponse',
  '2': const [
    const {'1': 'verificationCode', '3': 1, '4': 1, '5': 11, '6': '.VerificationCode', '10': 'verificationCode'},
  ],
};

/// Descriptor for `CreateVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createVerificationCodeResponseDescriptor = $convert.base64Decode('Ch5DcmVhdGVWZXJpZmljYXRpb25Db2RlUmVzcG9uc2USPQoQdmVyaWZpY2F0aW9uQ29kZRgBIAEoCzIRLlZlcmlmaWNhdGlvbkNvZGVSEHZlcmlmaWNhdGlvbkNvZGU=');
@$core.Deprecated('Use listVerificationCodeRequestDescriptor instead')
const ListVerificationCodeRequest$json = const {
  '1': 'ListVerificationCodeRequest',
  '2': const [
    const {'1': 'fieldMask', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `ListVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVerificationCodeRequestDescriptor = $convert.base64Decode('ChtMaXN0VmVyaWZpY2F0aW9uQ29kZVJlcXVlc3QSOAoJZmllbGRNYXNrGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLkZpZWxkTWFza1IJZmllbGRNYXNr');
@$core.Deprecated('Use listVerificationCodeResponseDescriptor instead')
const ListVerificationCodeResponse$json = const {
  '1': 'ListVerificationCodeResponse',
  '2': const [
    const {'1': 'verificationCodes', '3': 1, '4': 3, '5': 11, '6': '.VerificationCode', '10': 'verificationCodes'},
  ],
};

/// Descriptor for `ListVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVerificationCodeResponseDescriptor = $convert.base64Decode('ChxMaXN0VmVyaWZpY2F0aW9uQ29kZVJlc3BvbnNlEj8KEXZlcmlmaWNhdGlvbkNvZGVzGAEgAygLMhEuVmVyaWZpY2F0aW9uQ29kZVIRdmVyaWZpY2F0aW9uQ29kZXM=');
@$core.Deprecated('Use deleteVerificationCodeRequestDescriptor instead')
const DeleteVerificationCodeRequest$json = const {
  '1': 'DeleteVerificationCodeRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteVerificationCodeRequestDescriptor = $convert.base64Decode('Ch1EZWxldGVWZXJpZmljYXRpb25Db2RlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use getVerificationCodeRequestDescriptor instead')
const GetVerificationCodeRequest$json = const {
  '1': 'GetVerificationCodeRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'fieldMask', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `GetVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVerificationCodeRequestDescriptor = $convert.base64Decode('ChpHZXRWZXJpZmljYXRpb25Db2RlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEY29kZRgCIAEoCVIEY29kZRI4CglmaWVsZE1hc2sYBSABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2s=');
@$core.Deprecated('Use getVerificationCodeResponseDescriptor instead')
const GetVerificationCodeResponse$json = const {
  '1': 'GetVerificationCodeResponse',
  '2': const [
    const {'1': 'verificationCode', '3': 1, '4': 1, '5': 11, '6': '.VerificationCode', '10': 'verificationCode'},
  ],
};

/// Descriptor for `GetVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVerificationCodeResponseDescriptor = $convert.base64Decode('ChtHZXRWZXJpZmljYXRpb25Db2RlUmVzcG9uc2USPQoQdmVyaWZpY2F0aW9uQ29kZRgBIAEoCzIRLlZlcmlmaWNhdGlvbkNvZGVSEHZlcmlmaWNhdGlvbkNvZGU=');
@$core.Deprecated('Use updateVerificationCodeRequestDescriptor instead')
const UpdateVerificationCodeRequest$json = const {
  '1': 'UpdateVerificationCodeRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.VerificationCodeType', '10': 'type'},
    const {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'fieldMask', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `UpdateVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVerificationCodeRequestDescriptor = $convert.base64Decode('Ch1VcGRhdGVWZXJpZmljYXRpb25Db2RlUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSEgoEY29kZRgCIAEoCVIEY29kZRIUCgVlbWFpbBgDIAEoCVIFZW1haWwSKQoEdHlwZRgEIAEoDjIVLlZlcmlmaWNhdGlvbkNvZGVUeXBlUgR0eXBlEhoKCGRldmljZUlkGAUgASgJUghkZXZpY2VJZBI4CglmaWVsZE1hc2sYBiABKAsyGi5nb29nbGUucHJvdG9idWYuRmllbGRNYXNrUglmaWVsZE1hc2s=');
@$core.Deprecated('Use updateVerificationCodeResponseDescriptor instead')
const UpdateVerificationCodeResponse$json = const {
  '1': 'UpdateVerificationCodeResponse',
  '2': const [
    const {'1': 'verificationCode', '3': 1, '4': 1, '5': 11, '6': '.VerificationCode', '10': 'verificationCode'},
  ],
};

/// Descriptor for `UpdateVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVerificationCodeResponseDescriptor = $convert.base64Decode('Ch5VcGRhdGVWZXJpZmljYXRpb25Db2RlUmVzcG9uc2USPQoQdmVyaWZpY2F0aW9uQ29kZRgBIAEoCzIRLlZlcmlmaWNhdGlvbkNvZGVSEHZlcmlmaWNhdGlvbkNvZGU=');
@$core.Deprecated('Use signInRequestDescriptor instead')
const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'fieldMask', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.FieldMask', '10': 'fieldMask'},
  ],
};

/// Descriptor for `SignInRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInRequestDescriptor = $convert.base64Decode('Cg1TaWduSW5SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBISCgRjb2RlGAIgASgJUgRjb2RlEjgKCWZpZWxkTWFzaxgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5GaWVsZE1hc2tSCWZpZWxkTWFzaw==');
@$core.Deprecated('Use signInResponseDescriptor instead')
const SignInResponse$json = const {
  '1': 'SignInResponse',
  '2': const [
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '10': 'authorizationToken'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `SignInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInResponseDescriptor = $convert.base64Decode('Cg5TaWduSW5SZXNwb25zZRIiCgxyZWZyZXNoVG9rZW4YASABKAlSDHJlZnJlc2hUb2tlbhIuChJhdXRob3JpemF0aW9uVG9rZW4YAiABKAlSEmF1dGhvcml6YXRpb25Ub2tlbhIZCgR1c2VyGAMgASgLMgUuVXNlclIEdXNlcg==');
@$core.Deprecated('Use hostnameRequestDescriptor instead')
const HostnameRequest$json = const {
  '1': 'HostnameRequest',
};

/// Descriptor for `HostnameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostnameRequestDescriptor = $convert.base64Decode('Cg9Ib3N0bmFtZVJlcXVlc3Q=');
@$core.Deprecated('Use hostnameResponseDescriptor instead')
const HostnameResponse$json = const {
  '1': 'HostnameResponse',
  '2': const [
    const {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `HostnameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostnameResponseDescriptor = $convert.base64Decode('ChBIb3N0bmFtZVJlc3BvbnNlEhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZQ==');
@$core.Deprecated('Use healthCheckRequestDescriptor instead')
const HealthCheckRequest$json = const {
  '1': 'HealthCheckRequest',
  '2': const [
    const {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
  ],
};

/// Descriptor for `HealthCheckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckRequestDescriptor = $convert.base64Decode('ChJIZWFsdGhDaGVja1JlcXVlc3QSGAoHc2VydmljZRgBIAEoCVIHc2VydmljZQ==');
@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse$json = const {
  '1': 'HealthCheckResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.HealthCheckResponse.ServingStatus', '10': 'status'},
  ],
  '4': const [HealthCheckResponse_ServingStatus$json],
};

@$core.Deprecated('Use healthCheckResponseDescriptor instead')
const HealthCheckResponse_ServingStatus$json = const {
  '1': 'ServingStatus',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'SERVING', '2': 1},
    const {'1': 'NOT_SERVING', '2': 2},
  ],
};

/// Descriptor for `HealthCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckResponseDescriptor = $convert.base64Decode('ChNIZWFsdGhDaGVja1Jlc3BvbnNlEjoKBnN0YXR1cxgBIAEoDjIiLkhlYWx0aENoZWNrUmVzcG9uc2UuU2VydmluZ1N0YXR1c1IGc3RhdHVzIjoKDVNlcnZpbmdTdGF0dXMSCwoHVU5LTk9XThAAEgsKB1NFUlZJTkcQARIPCgtOT1RfU0VSVklORxAC');
@$core.Deprecated('Use orderDescriptor instead')
const Order$json = const {
  '1': 'Order',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.OrderStatusType', '10': 'status'},
    const {'1': 'deliveryDate', '3': 3, '4': 1, '5': 9, '10': 'deliveryDate'},
    const {'1': 'deliveryType', '3': 4, '4': 1, '5': 14, '6': '.DeliveryType', '10': 'deliveryType'},
    const {'1': 'residenceType', '3': 5, '4': 1, '5': 14, '6': '.ResidenceType', '10': 'residenceType'},
    const {'1': 'buildingNumber', '3': 6, '4': 1, '5': 9, '10': 'buildingNumber'},
    const {'1': 'houseNumber', '3': 7, '4': 1, '5': 9, '10': 'houseNumber'},
    const {'1': 'coordinates', '3': 8, '4': 1, '5': 11, '6': '.Point', '10': 'coordinates'},
    const {'1': 'price', '3': 9, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'businessFk', '3': 10, '4': 1, '5': 9, '10': 'businessFk'},
    const {'1': 'userFk', '3': 11, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'deviceFk', '3': 12, '4': 1, '5': 9, '10': 'deviceFk'},
    const {'1': 'appVersion', '3': 13, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'createTime', '3': 14, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 15, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode('CgVPcmRlchIOCgJpZBgBIAEoCVICaWQSKAoGc3RhdHVzGAIgASgOMhAuT3JkZXJTdGF0dXNUeXBlUgZzdGF0dXMSIgoMZGVsaXZlcnlEYXRlGAMgASgJUgxkZWxpdmVyeURhdGUSMQoMZGVsaXZlcnlUeXBlGAQgASgOMg0uRGVsaXZlcnlUeXBlUgxkZWxpdmVyeVR5cGUSNAoNcmVzaWRlbmNlVHlwZRgFIAEoDjIOLlJlc2lkZW5jZVR5cGVSDXJlc2lkZW5jZVR5cGUSJgoOYnVpbGRpbmdOdW1iZXIYBiABKAlSDmJ1aWxkaW5nTnVtYmVyEiAKC2hvdXNlTnVtYmVyGAcgASgJUgtob3VzZU51bWJlchIoCgtjb29yZGluYXRlcxgIIAEoCzIGLlBvaW50Ugtjb29yZGluYXRlcxIUCgVwcmljZRgJIAEoAVIFcHJpY2USHgoKYnVzaW5lc3NGaxgKIAEoCVIKYnVzaW5lc3NGaxIWCgZ1c2VyRmsYCyABKAlSBnVzZXJGaxIaCghkZXZpY2VGaxgMIAEoCVIIZGV2aWNlRmsSHgoKYXBwVmVyc2lvbhgNIAEoCVIKYXBwVmVyc2lvbhIeCgpjcmVhdGVUaW1lGA4gASgJUgpjcmVhdGVUaW1lEh4KCnVwZGF0ZVRpbWUYDyABKAlSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use cartItemDescriptor instead')
const CartItem$json = const {
  '1': 'CartItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'itemFk', '3': 2, '4': 1, '5': 9, '10': 'itemFk'},
    const {'1': 'price', '3': 3, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'userFk', '3': 4, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'authorizationTokenFk', '3': 5, '4': 1, '5': 9, '10': 'authorizationTokenFk'},
    const {'1': 'createTim', '3': 6, '4': 1, '5': 9, '10': 'createTim'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `CartItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cartItemDescriptor = $convert.base64Decode('CghDYXJ0SXRlbRIOCgJpZBgBIAEoCVICaWQSFgoGaXRlbUZrGAIgASgJUgZpdGVtRmsSFAoFcHJpY2UYAyABKAFSBXByaWNlEhYKBnVzZXJGaxgEIAEoCVIGdXNlckZrEjIKFGF1dGhvcml6YXRpb25Ub2tlbkZrGAUgASgJUhRhdXRob3JpemF0aW9uVG9rZW5GaxIcCgljcmVhdGVUaW0YBiABKAlSCWNyZWF0ZVRpbRIeCgp1cGRhdGVUaW1lGAcgASgJUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fullName', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'alias', '3': 3, '4': 1, '5': 9, '10': 'alias'},
    const {'1': 'highQualityPhoto', '3': 4, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'highQualityPhotoBlurHash', '3': 5, '4': 1, '5': 9, '10': 'highQualityPhotoBlurHash'},
    const {'1': 'lowQualityPhoto', '3': 6, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'lowQualityPhotoBlurHash', '3': 7, '4': 1, '5': 9, '10': 'lowQualityPhotoBlurHash'},
    const {'1': 'thumbnail', '3': 8, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 9, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'userAddress', '3': 10, '4': 3, '5': 11, '6': '.UserAddress', '10': 'userAddress'},
    const {'1': 'email', '3': 11, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'permissions', '3': 12, '4': 3, '5': 11, '6': '.UserPermission', '10': 'permissions'},
    const {'1': 'createTime', '3': 13, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 14, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIaCghmdWxsTmFtZRgCIAEoCVIIZnVsbE5hbWUSFAoFYWxpYXMYAyABKAlSBWFsaWFzEioKEGhpZ2hRdWFsaXR5UGhvdG8YBCABKAlSEGhpZ2hRdWFsaXR5UGhvdG8SOgoYaGlnaFF1YWxpdHlQaG90b0JsdXJIYXNoGAUgASgJUhhoaWdoUXVhbGl0eVBob3RvQmx1ckhhc2gSKAoPbG93UXVhbGl0eVBob3RvGAYgASgJUg9sb3dRdWFsaXR5UGhvdG8SOAoXbG93UXVhbGl0eVBob3RvQmx1ckhhc2gYByABKAlSF2xvd1F1YWxpdHlQaG90b0JsdXJIYXNoEhwKCXRodW1ibmFpbBgIIAEoCVIJdGh1bWJuYWlsEiwKEXRodW1ibmFpbEJsdXJIYXNoGAkgASgJUhF0aHVtYm5haWxCbHVySGFzaBIuCgt1c2VyQWRkcmVzcxgKIAMoCzIMLlVzZXJBZGRyZXNzUgt1c2VyQWRkcmVzcxIUCgVlbWFpbBgLIAEoCVIFZW1haWwSMQoLcGVybWlzc2lvbnMYDCADKAsyDy5Vc2VyUGVybWlzc2lvblILcGVybWlzc2lvbnMSHgoKY3JlYXRlVGltZRgNIAEoCVIKY3JlYXRlVGltZRIeCgp1cGRhdGVUaW1lGA4gASgJUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use businessDescriptor instead')
const Business$json = const {
  '1': 'Business',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'highQualityPhoto', '3': 7, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'highQualityPhotoBlurHash', '3': 8, '4': 1, '5': 9, '10': 'highQualityPhotoBlurHash'},
    const {'1': 'lowQualityPhoto', '3': 9, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'lowQualityPhotoBlurHash', '3': 10, '4': 1, '5': 9, '10': 'lowQualityPhotoBlurHash'},
    const {'1': 'thumbnail', '3': 11, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 12, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'isOpen', '3': 13, '4': 1, '5': 8, '10': 'isOpen'},
    const {'1': 'deliveryPrice', '3': 14, '4': 1, '5': 1, '10': 'deliveryPrice'},
    const {'1': 'polygon', '3': 15, '4': 3, '5': 11, '6': '.Polygon', '10': 'polygon'},
    const {'1': 'coordinates', '3': 16, '4': 1, '5': 11, '6': '.Point', '10': 'coordinates'},
    const {'1': 'leadDayTime', '3': 17, '4': 1, '5': 5, '10': 'leadDayTime'},
    const {'1': 'leadHoursTime', '3': 18, '4': 1, '5': 5, '10': 'leadHoursTime'},
    const {'1': 'leadMinutesTime', '3': 19, '4': 1, '5': 5, '10': 'leadMinutesTime'},
    const {'1': 'toPickUp', '3': 20, '4': 1, '5': 8, '10': 'toPickUp'},
    const {'1': 'homeDelivery', '3': 21, '4': 1, '5': 8, '10': 'homeDelivery'},
    const {'1': 'businessBrandFk', '3': 22, '4': 1, '5': 9, '10': 'businessBrandFk'},
    const {'1': 'provinceFk', '3': 23, '4': 1, '5': 9, '10': 'provinceFk'},
    const {'1': 'municipalityFk', '3': 24, '4': 1, '5': 9, '10': 'municipalityFk'},
    const {'1': 'distance', '3': 25, '4': 1, '5': 1, '10': 'distance'},
    const {'1': 'status', '3': 26, '4': 1, '5': 14, '6': '.BusinessStatusType', '10': 'status'},
    const {'1': 'cursor', '3': 27, '4': 1, '5': 5, '10': 'cursor'},
  ],
};

/// Descriptor for `Business`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDescriptor = $convert.base64Decode('CghCdXNpbmVzcxIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzcxIUCgVwaG9uZRgFIAEoCVIFcGhvbmUSFAoFZW1haWwYBiABKAlSBWVtYWlsEioKEGhpZ2hRdWFsaXR5UGhvdG8YByABKAlSEGhpZ2hRdWFsaXR5UGhvdG8SOgoYaGlnaFF1YWxpdHlQaG90b0JsdXJIYXNoGAggASgJUhhoaWdoUXVhbGl0eVBob3RvQmx1ckhhc2gSKAoPbG93UXVhbGl0eVBob3RvGAkgASgJUg9sb3dRdWFsaXR5UGhvdG8SOAoXbG93UXVhbGl0eVBob3RvQmx1ckhhc2gYCiABKAlSF2xvd1F1YWxpdHlQaG90b0JsdXJIYXNoEhwKCXRodW1ibmFpbBgLIAEoCVIJdGh1bWJuYWlsEiwKEXRodW1ibmFpbEJsdXJIYXNoGAwgASgJUhF0aHVtYm5haWxCbHVySGFzaBIWCgZpc09wZW4YDSABKAhSBmlzT3BlbhIkCg1kZWxpdmVyeVByaWNlGA4gASgBUg1kZWxpdmVyeVByaWNlEiIKB3BvbHlnb24YDyADKAsyCC5Qb2x5Z29uUgdwb2x5Z29uEigKC2Nvb3JkaW5hdGVzGBAgASgLMgYuUG9pbnRSC2Nvb3JkaW5hdGVzEiAKC2xlYWREYXlUaW1lGBEgASgFUgtsZWFkRGF5VGltZRIkCg1sZWFkSG91cnNUaW1lGBIgASgFUg1sZWFkSG91cnNUaW1lEigKD2xlYWRNaW51dGVzVGltZRgTIAEoBVIPbGVhZE1pbnV0ZXNUaW1lEhoKCHRvUGlja1VwGBQgASgIUgh0b1BpY2tVcBIiCgxob21lRGVsaXZlcnkYFSABKAhSDGhvbWVEZWxpdmVyeRIoCg9idXNpbmVzc0JyYW5kRmsYFiABKAlSD2J1c2luZXNzQnJhbmRGaxIeCgpwcm92aW5jZUZrGBcgASgJUgpwcm92aW5jZUZrEiYKDm11bmljaXBhbGl0eUZrGBggASgJUg5tdW5pY2lwYWxpdHlGaxIaCghkaXN0YW5jZRgZIAEoAVIIZGlzdGFuY2USKwoGc3RhdHVzGBogASgOMhMuQnVzaW5lc3NTdGF0dXNUeXBlUgZzdGF0dXMSFgoGY3Vyc29yGBsgASgFUgZjdXJzb3I=');
@$core.Deprecated('Use itemDescriptor instead')
const Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.ItemStatusType', '10': 'status'},
    const {'1': 'availability', '3': 6, '4': 1, '5': 5, '10': 'availability'},
    const {'1': 'businessFk', '3': 7, '4': 1, '5': 9, '10': 'businessFk'},
    const {'1': 'businessItemCategoryFk', '3': 8, '4': 1, '5': 9, '10': 'businessItemCategoryFk'},
    const {'1': 'highQualityPhoto', '3': 9, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'highQualityPhotoBlurHash', '3': 10, '4': 1, '5': 9, '10': 'highQualityPhotoBlurHash'},
    const {'1': 'lowQualityPhoto', '3': 11, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'lowQualityPhotoBlurHash', '3': 12, '4': 1, '5': 9, '10': 'lowQualityPhotoBlurHash'},
    const {'1': 'thumbnail', '3': 13, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 14, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'photos', '3': 15, '4': 3, '5': 11, '6': '.ItemPhoto', '10': 'photos'},
    const {'1': 'createTime', '3': 16, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 17, '4': 1, '5': 9, '10': 'updateTime'},
    const {'1': 'cursor', '3': 18, '4': 1, '5': 5, '10': 'cursor'},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode('CgRJdGVtEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIUCgVwcmljZRgEIAEoAVIFcHJpY2USJwoGc3RhdHVzGAUgASgOMg8uSXRlbVN0YXR1c1R5cGVSBnN0YXR1cxIiCgxhdmFpbGFiaWxpdHkYBiABKAVSDGF2YWlsYWJpbGl0eRIeCgpidXNpbmVzc0ZrGAcgASgJUgpidXNpbmVzc0ZrEjYKFmJ1c2luZXNzSXRlbUNhdGVnb3J5RmsYCCABKAlSFmJ1c2luZXNzSXRlbUNhdGVnb3J5RmsSKgoQaGlnaFF1YWxpdHlQaG90bxgJIAEoCVIQaGlnaFF1YWxpdHlQaG90bxI6ChhoaWdoUXVhbGl0eVBob3RvQmx1ckhhc2gYCiABKAlSGGhpZ2hRdWFsaXR5UGhvdG9CbHVySGFzaBIoCg9sb3dRdWFsaXR5UGhvdG8YCyABKAlSD2xvd1F1YWxpdHlQaG90bxI4Chdsb3dRdWFsaXR5UGhvdG9CbHVySGFzaBgMIAEoCVIXbG93UXVhbGl0eVBob3RvQmx1ckhhc2gSHAoJdGh1bWJuYWlsGA0gASgJUgl0aHVtYm5haWwSLAoRdGh1bWJuYWlsQmx1ckhhc2gYDiABKAlSEXRodW1ibmFpbEJsdXJIYXNoEiIKBnBob3RvcxgPIAMoCzIKLkl0ZW1QaG90b1IGcGhvdG9zEh4KCmNyZWF0ZVRpbWUYECABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgRIAEoCVIKdXBkYXRlVGltZRIWCgZjdXJzb3IYEiABKAVSBmN1cnNvcg==');
@$core.Deprecated('Use searchItemDescriptor instead')
const SearchItem$json = const {
  '1': 'SearchItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'price', '3': 3, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.ItemStatusType', '10': 'status'},
    const {'1': 'thumbnail', '3': 5, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 6, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'businessName', '3': 7, '4': 1, '5': 9, '10': 'businessName'},
    const {'1': 'cursor', '3': 8, '4': 1, '5': 5, '10': 'cursor'},
  ],
};

/// Descriptor for `SearchItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchItemDescriptor = $convert.base64Decode('CgpTZWFyY2hJdGVtEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBXByaWNlGAMgASgBUgVwcmljZRInCgZzdGF0dXMYBCABKA4yDy5JdGVtU3RhdHVzVHlwZVIGc3RhdHVzEhwKCXRodW1ibmFpbBgFIAEoCVIJdGh1bWJuYWlsEiwKEXRodW1ibmFpbEJsdXJIYXNoGAYgASgJUhF0aHVtYm5haWxCbHVySGFzaBIiCgxidXNpbmVzc05hbWUYByABKAlSDGJ1c2luZXNzTmFtZRIWCgZjdXJzb3IYCCABKAVSBmN1cnNvcg==');
@$core.Deprecated('Use itemPhotoDescriptor instead')
const ItemPhoto$json = const {
  '1': 'ItemPhoto',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'itemFk', '3': 2, '4': 1, '5': 9, '10': 'itemFk'},
    const {'1': 'highQualityPhoto', '3': 3, '4': 1, '5': 9, '10': 'highQualityPhoto'},
    const {'1': 'highQualityPhotoBlurHash', '3': 4, '4': 1, '5': 9, '10': 'highQualityPhotoBlurHash'},
    const {'1': 'lowQualityPhoto', '3': 5, '4': 1, '5': 9, '10': 'lowQualityPhoto'},
    const {'1': 'lowQualityPhotoBlurHash', '3': 6, '4': 1, '5': 9, '10': 'lowQualityPhotoBlurHash'},
    const {'1': 'thumbnail', '3': 7, '4': 1, '5': 9, '10': 'thumbnail'},
    const {'1': 'thumbnailBlurHash', '3': 8, '4': 1, '5': 9, '10': 'thumbnailBlurHash'},
    const {'1': 'createTime', '3': 9, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 10, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `ItemPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemPhotoDescriptor = $convert.base64Decode('CglJdGVtUGhvdG8SDgoCaWQYASABKAlSAmlkEhYKBml0ZW1GaxgCIAEoCVIGaXRlbUZrEioKEGhpZ2hRdWFsaXR5UGhvdG8YAyABKAlSEGhpZ2hRdWFsaXR5UGhvdG8SOgoYaGlnaFF1YWxpdHlQaG90b0JsdXJIYXNoGAQgASgJUhhoaWdoUXVhbGl0eVBob3RvQmx1ckhhc2gSKAoPbG93UXVhbGl0eVBob3RvGAUgASgJUg9sb3dRdWFsaXR5UGhvdG8SOAoXbG93UXVhbGl0eVBob3RvQmx1ckhhc2gYBiABKAlSF2xvd1F1YWxpdHlQaG90b0JsdXJIYXNoEhwKCXRodW1ibmFpbBgHIAEoCVIJdGh1bWJuYWlsEiwKEXRodW1ibmFpbEJsdXJIYXNoGAggASgJUhF0aHVtYm5haWxCbHVySGFzaBIeCgpjcmVhdGVUaW1lGAkgASgJUgpjcmVhdGVUaW1lEh4KCnVwZGF0ZVRpbWUYCiABKAlSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use bannedUserDescriptor instead')
const BannedUser$json = const {
  '1': 'BannedUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'userFk', '3': 3, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'moderatorAuthorizationTokenFk', '3': 5, '4': 1, '5': 9, '10': 'moderatorAuthorizationTokenFk'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `BannedUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bannedUserDescriptor = $convert.base64Decode('CgpCYW5uZWRVc2VyEg4KAmlkGAEgASgJUgJpZBIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SFgoGdXNlckZrGAMgASgJUgZ1c2VyRmsSFAoFZW1haWwYBCABKAlSBWVtYWlsEkQKHW1vZGVyYXRvckF1dGhvcml6YXRpb25Ub2tlbkZrGAUgASgJUh1tb2RlcmF0b3JBdXRob3JpemF0aW9uVG9rZW5GaxIeCgpjcmVhdGVUaW1lGAYgASgJUgpjcmVhdGVUaW1lEh4KCnVwZGF0ZVRpbWUYByABKAlSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use bannedDeviceDescriptor instead')
const BannedDevice$json = const {
  '1': 'BannedDevice',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'deviceFk', '3': 3, '4': 1, '5': 9, '10': 'deviceFk'},
    const {'1': 'deviceId', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'moderatorAuthorizationTokenFk', '3': 5, '4': 1, '5': 9, '10': 'moderatorAuthorizationTokenFk'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `BannedDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bannedDeviceDescriptor = $convert.base64Decode('CgxCYW5uZWREZXZpY2USDgoCaWQYASABKAlSAmlkEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIaCghkZXZpY2VGaxgDIAEoCVIIZGV2aWNlRmsSGgoIZGV2aWNlSWQYBCABKAlSCGRldmljZUlkEkQKHW1vZGVyYXRvckF1dGhvcml6YXRpb25Ub2tlbkZrGAUgASgJUh1tb2RlcmF0b3JBdXRob3JpemF0aW9uVG9rZW5GaxIeCgpjcmVhdGVUaW1lGAYgASgJUgpjcmVhdGVUaW1lEh4KCnVwZGF0ZVRpbWUYByABKAlSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use authorizationTokenDescriptor instead')
const AuthorizationToken$json = const {
  '1': 'AuthorizationToken',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'refreshTokenFk', '3': 2, '4': 1, '5': 9, '10': 'refreshTokenFk'},
    const {'1': 'deviceFk', '3': 3, '4': 1, '5': 9, '10': 'deviceFk'},
    const {'1': 'userFk', '3': 4, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'valid', '3': 5, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'app', '3': 6, '4': 1, '5': 14, '6': '.AppType', '10': 'app'},
    const {'1': 'appVersion', '3': 7, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'createTime', '3': 8, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 9, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `AuthorizationToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationTokenDescriptor = $convert.base64Decode('ChJBdXRob3JpemF0aW9uVG9rZW4SDgoCaWQYASABKAlSAmlkEiYKDnJlZnJlc2hUb2tlbkZrGAIgASgJUg5yZWZyZXNoVG9rZW5GaxIaCghkZXZpY2VGaxgDIAEoCVIIZGV2aWNlRmsSFgoGdXNlckZrGAQgASgJUgZ1c2VyRmsSFAoFdmFsaWQYBSABKAhSBXZhbGlkEhoKA2FwcBgGIAEoDjIILkFwcFR5cGVSA2FwcBIeCgphcHBWZXJzaW9uGAcgASgJUgphcHBWZXJzaW9uEh4KCmNyZWF0ZVRpbWUYCCABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgJIAEoCVIKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'platform', '3': 2, '4': 1, '5': 14, '6': '.PlatformType', '10': 'platform'},
    const {'1': 'systemVersion', '3': 3, '4': 1, '5': 9, '10': 'systemVersion'},
    const {'1': 'model', '3': 4, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'app', '3': 5, '4': 1, '5': 14, '6': '.AppType', '10': 'app'},
    const {'1': 'appVersion', '3': 6, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'actual', '3': 7, '4': 1, '5': 8, '10': 'actual'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode('CgdTZXNzaW9uEg4KAmlkGAEgASgJUgJpZBIpCghwbGF0Zm9ybRgCIAEoDjINLlBsYXRmb3JtVHlwZVIIcGxhdGZvcm0SJAoNc3lzdGVtVmVyc2lvbhgDIAEoCVINc3lzdGVtVmVyc2lvbhIUCgVtb2RlbBgEIAEoCVIFbW9kZWwSGgoDYXBwGAUgASgOMgguQXBwVHlwZVIDYXBwEh4KCmFwcFZlcnNpb24YBiABKAlSCmFwcFZlcnNpb24SFgoGYWN0dWFsGAcgASgIUgZhY3R1YWw=');
@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = const {
  '1': 'RefreshToken',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'userFk', '3': 2, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'deviceFk', '3': 3, '4': 1, '5': 9, '10': 'deviceFk'},
    const {'1': 'valid', '3': 4, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'expirationTime', '3': 5, '4': 1, '5': 9, '10': 'expirationTime'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode('CgxSZWZyZXNoVG9rZW4SDgoCaWQYASABKAlSAmlkEhYKBnVzZXJGaxgCIAEoCVIGdXNlckZrEhoKCGRldmljZUZrGAMgASgJUghkZXZpY2VGaxIUCgV2YWxpZBgEIAEoCFIFdmFsaWQSJgoOZXhwaXJhdGlvblRpbWUYBSABKAlSDmV4cGlyYXRpb25UaW1lEh4KCmNyZWF0ZVRpbWUYBiABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgHIAEoCVIKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = const {
  '1': 'Device',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'platform', '3': 2, '4': 1, '5': 14, '6': '.PlatformType', '10': 'platform'},
    const {'1': 'systemVersion', '3': 3, '4': 1, '5': 9, '10': 'systemVersion'},
    const {'1': 'deviceId', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'firebaseCloudMessagingId', '3': 5, '4': 1, '5': 9, '10': 'firebaseCloudMessagingId'},
    const {'1': 'model', '3': 6, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'createTime', '3': 7, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 8, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode('CgZEZXZpY2USDgoCaWQYASABKAlSAmlkEikKCHBsYXRmb3JtGAIgASgOMg0uUGxhdGZvcm1UeXBlUghwbGF0Zm9ybRIkCg1zeXN0ZW1WZXJzaW9uGAMgASgJUg1zeXN0ZW1WZXJzaW9uEhoKCGRldmljZUlkGAQgASgJUghkZXZpY2VJZBI6ChhmaXJlYmFzZUNsb3VkTWVzc2FnaW5nSWQYBSABKAlSGGZpcmViYXNlQ2xvdWRNZXNzYWdpbmdJZBIUCgVtb2RlbBgGIAEoCVIFbW9kZWwSHgoKY3JlYXRlVGltZRgHIAEoCVIKY3JlYXRlVGltZRIeCgp1cGRhdGVUaW1lGAggASgJUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use userAddressDescriptor instead')
const UserAddress$json = const {
  '1': 'UserAddress',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'tag', '3': 2, '4': 1, '5': 9, '10': 'tag'},
    const {'1': 'residenceType', '3': 3, '4': 1, '5': 14, '6': '.UserAddress.UserAddressType', '10': 'residenceType'},
    const {'1': 'buildingNumber', '3': 4, '4': 1, '5': 9, '10': 'buildingNumber'},
    const {'1': 'houseNumber', '3': 5, '4': 1, '5': 9, '10': 'houseNumber'},
    const {'1': 'coordinates', '3': 6, '4': 1, '5': 11, '6': '.Point', '10': 'coordinates'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'userFk', '3': 8, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'provinceFk', '3': 9, '4': 1, '5': 9, '10': 'provinceFk'},
    const {'1': 'municipalityFk', '3': 10, '4': 1, '5': 9, '10': 'municipalityFk'},
    const {'1': 'createTime', '3': 11, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 12, '4': 1, '5': 9, '10': 'updateTime'},
  ],
  '4': const [UserAddress_UserAddressType$json],
};

@$core.Deprecated('Use userAddressDescriptor instead')
const UserAddress_UserAddressType$json = const {
  '1': 'UserAddressType',
  '2': const [
    const {'1': 'UNSPECIFIED', '2': 0},
    const {'1': 'HOUSE', '2': 1},
    const {'1': 'APARTAMENT', '2': 2},
  ],
};

/// Descriptor for `UserAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAddressDescriptor = $convert.base64Decode('CgtVc2VyQWRkcmVzcxIOCgJpZBgBIAEoCVICaWQSEAoDdGFnGAIgASgJUgN0YWcSQgoNcmVzaWRlbmNlVHlwZRgDIAEoDjIcLlVzZXJBZGRyZXNzLlVzZXJBZGRyZXNzVHlwZVINcmVzaWRlbmNlVHlwZRImCg5idWlsZGluZ051bWJlchgEIAEoCVIOYnVpbGRpbmdOdW1iZXISIAoLaG91c2VOdW1iZXIYBSABKAlSC2hvdXNlTnVtYmVyEigKC2Nvb3JkaW5hdGVzGAYgASgLMgYuUG9pbnRSC2Nvb3JkaW5hdGVzEiAKC2Rlc2NyaXB0aW9uGAcgASgJUgtkZXNjcmlwdGlvbhIWCgZ1c2VyRmsYCCABKAlSBnVzZXJGaxIeCgpwcm92aW5jZUZrGAkgASgJUgpwcm92aW5jZUZrEiYKDm11bmljaXBhbGl0eUZrGAogASgJUg5tdW5pY2lwYWxpdHlGaxIeCgpjcmVhdGVUaW1lGAsgASgJUgpjcmVhdGVUaW1lEh4KCnVwZGF0ZVRpbWUYDCABKAlSCnVwZGF0ZVRpbWUiPQoPVXNlckFkZHJlc3NUeXBlEg8KC1VOU1BFQ0lGSUVEEAASCQoFSE9VU0UQARIOCgpBUEFSVEFNRU5UEAI=');
@$core.Deprecated('Use userPermissionDescriptor instead')
const UserPermission$json = const {
  '1': 'UserPermission',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'permissionFk', '3': 3, '4': 1, '5': 9, '10': 'permissionFk'},
    const {'1': 'userFk', '3': 4, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'businessFk', '3': 5, '4': 1, '5': 9, '10': 'businessFk'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `UserPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPermissionDescriptor = $convert.base64Decode('Cg5Vc2VyUGVybWlzc2lvbhIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIiCgxwZXJtaXNzaW9uRmsYAyABKAlSDHBlcm1pc3Npb25GaxIWCgZ1c2VyRmsYBCABKAlSBnVzZXJGaxIeCgpidXNpbmVzc0ZrGAUgASgJUgpidXNpbmVzc0ZrEh4KCmNyZWF0ZVRpbWUYBiABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgHIAEoCVIKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use polygonDescriptor instead')
const Polygon$json = const {
  '1': 'Polygon',
  '2': const [
    const {'1': 'coordinates', '3': 1, '4': 3, '5': 1, '10': 'coordinates'},
  ],
};

/// Descriptor for `Polygon`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List polygonDescriptor = $convert.base64Decode('CgdQb2x5Z29uEiAKC2Nvb3JkaW5hdGVzGAEgAygBUgtjb29yZGluYXRlcw==');
@$core.Deprecated('Use verificationCodeDescriptor instead')
const VerificationCode$json = const {
  '1': 'VerificationCode',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.VerificationCodeType', '10': 'type'},
    const {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `VerificationCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verificationCodeDescriptor = $convert.base64Decode('ChBWZXJpZmljYXRpb25Db2RlEg4KAmlkGAEgASgJUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIpCgR0eXBlGAQgASgOMhUuVmVyaWZpY2F0aW9uQ29kZVR5cGVSBHR5cGUSGgoIZGV2aWNlSWQYBSABKAlSCGRldmljZUlkEh4KCmNyZWF0ZVRpbWUYBiABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgHIAEoCVIKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use pointDescriptor instead')
const Point$json = const {
  '1': 'Point',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `Point`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointDescriptor = $convert.base64Decode('CgVQb2ludBIaCghsYXRpdHVkZRgBIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAIgASgBUglsb25naXR1ZGU=');
