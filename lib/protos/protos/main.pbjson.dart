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
    const {'1': 'not_ids', '3': 2, '4': 3, '5': 9, '10': 'notIds'},
    const {'1': 'this_month', '3': 3, '4': 1, '5': 8, '9': 1, '10': 'thisMonth', '17': true},
    const {'1': 'coordinates', '3': 4, '4': 1, '5': 11, '6': '.LatLng', '10': 'coordinates'},
  ],
  '8': const [
    const {'1': '_category_fk'},
    const {'1': '_this_month'},
  ],
};

/// Descriptor for `ListBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBusinessRequestDescriptor = $convert.base64Decode('ChNMaXN0QnVzaW5lc3NSZXF1ZXN0EiQKC2NhdGVnb3J5X2ZrGAEgASgJSABSCmNhdGVnb3J5RmuIAQESFwoHbm90X2lkcxgCIAMoCVIGbm90SWRzEiIKCnRoaXNfbW9udGgYAyABKAhIAVIJdGhpc01vbnRoiAEBEikKC2Nvb3JkaW5hdGVzGAQgASgLMgcuTGF0TG5nUgtjb29yZGluYXRlc0IOCgxfY2F0ZWdvcnlfZmtCDQoLX3RoaXNfbW9udGg=');
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
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'address', '3': 5, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'email', '3': 7, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'photo', '3': 8, '4': 1, '5': 9, '10': 'photo'},
    const {'1': 'photo_url', '3': 9, '4': 1, '5': 9, '10': 'photoUrl'},
    const {'1': 'coordinates', '3': 10, '4': 1, '5': 11, '6': '.LatLng', '10': 'coordinates'},
    const {'1': 'polygon', '3': 11, '4': 3, '5': 11, '6': '.Polygon', '10': 'polygon'},
    const {'1': 'distance', '3': 12, '4': 1, '5': 1, '10': 'distance'},
  ],
};

/// Descriptor for `Business`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDescriptor = $convert.base64Decode('CghCdXNpbmVzcxIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGAoHYWRkcmVzcxgFIAEoCVIHYWRkcmVzcxIUCgVwaG9uZRgGIAEoCVIFcGhvbmUSFAoFZW1haWwYByABKAlSBWVtYWlsEhQKBXBob3RvGAggASgJUgVwaG90bxIbCglwaG90b191cmwYCSABKAlSCHBob3RvVXJsEikKC2Nvb3JkaW5hdGVzGAogASgLMgcuTGF0TG5nUgtjb29yZGluYXRlcxIiCgdwb2x5Z29uGAsgAygLMgguUG9seWdvblIHcG9seWdvbhIaCghkaXN0YW5jZRgMIAEoAVIIZGlzdGFuY2U=');
@$core.Deprecated('Use polygonDescriptor instead')
const Polygon$json = const {
  '1': 'Polygon',
  '2': const [
    const {'1': 'coordinates', '3': 1, '4': 3, '5': 1, '10': 'coordinates'},
  ],
};

/// Descriptor for `Polygon`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List polygonDescriptor = $convert.base64Decode('CgdQb2x5Z29uEiAKC2Nvb3JkaW5hdGVzGAEgAygBUgtjb29yZGluYXRlcw==');
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
