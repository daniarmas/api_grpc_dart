///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listBusinessRequestDescriptor instead')
const ListBusinessRequest$json = const {
  '1': 'ListBusinessRequest',
  '2': const [
    const {'1': 'category_fk', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'categoryFk', '17': true},
    const {'1': 'limit', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'limit', '17': true},
    const {'1': 'not_ids', '3': 3, '4': 3, '5': 9, '10': 'notIds'},
    const {'1': 'this_month', '3': 4, '4': 1, '5': 8, '9': 2, '10': 'thisMonth', '17': true},
    const {'1': 'latitude', '3': 5, '4': 1, '5': 1, '9': 3, '10': 'latitude', '17': true},
    const {'1': 'longitude', '3': 6, '4': 1, '5': 1, '9': 4, '10': 'longitude', '17': true},
  ],
  '8': const [
    const {'1': '_category_fk'},
    const {'1': '_limit'},
    const {'1': '_this_month'},
    const {'1': '_latitude'},
    const {'1': '_longitude'},
  ],
};

/// Descriptor for `ListBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBusinessRequestDescriptor = $convert.base64Decode('ChNMaXN0QnVzaW5lc3NSZXF1ZXN0EiQKC2NhdGVnb3J5X2ZrGAEgASgJSABSCmNhdGVnb3J5RmuIAQESGQoFbGltaXQYAiABKAVIAVIFbGltaXSIAQESFwoHbm90X2lkcxgDIAMoCVIGbm90SWRzEiIKCnRoaXNfbW9udGgYBCABKAhIAlIJdGhpc01vbnRoiAEBEh8KCGxhdGl0dWRlGAUgASgBSANSCGxhdGl0dWRliAEBEiEKCWxvbmdpdHVkZRgGIAEoAUgEUglsb25naXR1ZGWIAQFCDgoMX2NhdGVnb3J5X2ZrQggKBl9saW1pdEINCgtfdGhpc19tb250aEILCglfbGF0aXR1ZGVCDAoKX2xvbmdpdHVkZQ==');
@$core.Deprecated('Use listBusinessResponseDescriptor instead')
const ListBusinessResponse$json = const {
  '1': 'ListBusinessResponse',
  '2': const [
    const {'1': 'business', '3': 1, '4': 3, '5': 11, '6': '.Business', '10': 'business'},
  ],
};

/// Descriptor for `ListBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBusinessResponseDescriptor = $convert.base64Decode('ChRMaXN0QnVzaW5lc3NSZXNwb25zZRIlCghidXNpbmVzcxgBIAMoCzIJLkJ1c2luZXNzUghidXNpbmVzcw==');
@$core.Deprecated('Use businessDescriptor instead')
const Business$json = const {
  '1': 'Business',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Business`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDescriptor = $convert.base64Decode('CghCdXNpbmVzcxIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use latLngDescriptor instead')
const LatLng$json = const {
  '1': 'LatLng',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `LatLng`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List latLngDescriptor = $convert.base64Decode('CgZMYXRMbmcSGgoIbGF0aXR1ZGUYASABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgCIAEoAVIJbG9uZ2l0dWRl');
@$core.Deprecated('Use repeatedBusinessDescriptor instead')
const RepeatedBusiness$json = const {
  '1': 'RepeatedBusiness',
  '2': const [
    const {'1': 'business', '3': 1, '4': 3, '5': 11, '6': '.Business', '10': 'business'},
  ],
};

/// Descriptor for `RepeatedBusiness`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repeatedBusinessDescriptor = $convert.base64Decode('ChBSZXBlYXRlZEJ1c2luZXNzEiUKCGJ1c2luZXNzGAEgAygLMgkuQnVzaW5lc3NSCGJ1c2luZXNz');
@$core.Deprecated('Use businessCategoryDescriptor instead')
const BusinessCategory$json = const {
  '1': 'BusinessCategory',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `BusinessCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessCategoryDescriptor = $convert.base64Decode('ChBCdXNpbmVzc0NhdGVnb3J5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');
