///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verificationCodeTypeDescriptor instead')
const VerificationCodeType$json = const {
  '1': 'VerificationCodeType',
  '2': const [
    const {'1': 'VERIFICATION_CODE_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'SIGN_IN', '2': 1},
    const {'1': 'SIGN_UP', '2': 2},
    const {'1': 'CHANGE_USER_EMAIL', '2': 3},
  ],
};

/// Descriptor for `VerificationCodeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List verificationCodeTypeDescriptor = $convert.base64Decode('ChRWZXJpZmljYXRpb25Db2RlVHlwZRImCiJWRVJJRklDQVRJT05fQ09ERV9UWVBFX1VOU1BFQ0lGSUVEEAASCwoHU0lHTl9JThABEgsKB1NJR05fVVAQAhIVChFDSEFOR0VfVVNFUl9FTUFJTBAD');
@$core.Deprecated('Use platformTypeDescriptor instead')
const PlatformType$json = const {
  '1': 'PlatformType',
  '2': const [
    const {'1': 'PLATFORM_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'IOS', '2': 1},
    const {'1': 'ANDROID', '2': 2},
  ],
};

/// Descriptor for `PlatformType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List platformTypeDescriptor = $convert.base64Decode('CgxQbGF0Zm9ybVR5cGUSHQoZUExBVEZPUk1fVFlQRV9VTlNQRUNJRklFRBAAEgcKA0lPUxABEgsKB0FORFJPSUQQAg==');
@$core.Deprecated('Use appTypeDescriptor instead')
const AppType$json = const {
  '1': 'AppType',
  '2': const [
    const {'1': 'APP_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'APP', '2': 1},
    const {'1': 'BUSINESS_APP', '2': 2},
  ],
};

/// Descriptor for `AppType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List appTypeDescriptor = $convert.base64Decode('CgdBcHBUeXBlEhgKFEFQUF9UWVBFX1VOU1BFQ0lGSUVEEAASBwoDQVBQEAESEAoMQlVTSU5FU1NfQVBQEAI=');
@$core.Deprecated('Use userExistsRequestDescriptor instead')
const UserExistsRequest$json = const {
  '1': 'UserExistsRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `UserExistsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userExistsRequestDescriptor = $convert.base64Decode('ChFVc2VyRXhpc3RzUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');
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
    const {'1': 'refreshToken', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refreshToken', '17': true},
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'authorizationToken', '17': true},
  ],
  '8': const [
    const {'1': '_refreshToken'},
    const {'1': '_authorizationToken'},
  ],
};

/// Descriptor for `CheckSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkSessionRequestDescriptor = $convert.base64Decode('ChNDaGVja1Nlc3Npb25SZXF1ZXN0EicKDHJlZnJlc2hUb2tlbhgBIAEoCUgAUgxyZWZyZXNoVG9rZW6IAQESMwoSYXV0aG9yaXphdGlvblRva2VuGAIgASgJSAFSEmF1dGhvcml6YXRpb25Ub2tlbogBAUIPCg1fcmVmcmVzaFRva2VuQhUKE19hdXRob3JpemF0aW9uVG9rZW4=');
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
    const {'1': 'verificationCode', '3': 1, '4': 3, '5': 11, '6': '.VerificationCode', '10': 'verificationCode'},
  ],
};

/// Descriptor for `ListVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVerificationCodeResponseDescriptor = $convert.base64Decode('ChxMaXN0VmVyaWZpY2F0aW9uQ29kZVJlc3BvbnNlEj0KEHZlcmlmaWNhdGlvbkNvZGUYASADKAsyES5WZXJpZmljYXRpb25Db2RlUhB2ZXJpZmljYXRpb25Db2Rl');
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
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fullName', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'photo', '3': 3, '4': 1, '5': 9, '10': 'photo'},
    const {'1': 'photoUrl', '3': 4, '4': 1, '5': 9, '10': 'photoUrl'},
    const {'1': 'userAddress', '3': 5, '4': 3, '5': 11, '6': '.UserAddress', '10': 'userAddress'},
    const {'1': 'legalAge', '3': 6, '4': 1, '5': 8, '10': 'legalAge'},
    const {'1': 'email', '3': 7, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'permissions', '3': 8, '4': 3, '5': 11, '6': '.UserPermission', '10': 'permissions'},
    const {'1': 'createTime', '3': 9, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 10, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIaCghmdWxsTmFtZRgCIAEoCVIIZnVsbE5hbWUSFAoFcGhvdG8YAyABKAlSBXBob3RvEhoKCHBob3RvVXJsGAQgASgJUghwaG90b1VybBIuCgt1c2VyQWRkcmVzcxgFIAMoCzIMLlVzZXJBZGRyZXNzUgt1c2VyQWRkcmVzcxIaCghsZWdhbEFnZRgGIAEoCFIIbGVnYWxBZ2USFAoFZW1haWwYByABKAlSBWVtYWlsEjEKC3Blcm1pc3Npb25zGAggAygLMg8uVXNlclBlcm1pc3Npb25SC3Blcm1pc3Npb25zEh4KCmNyZWF0ZVRpbWUYCSABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgKIAEoCVIKdXBkYXRlVGltZQ==');
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
    const {'1': 'authorizationToken', '3': 2, '4': 1, '5': 9, '10': 'authorizationToken'},
    const {'1': 'refreshTokenFk', '3': 3, '4': 1, '5': 9, '10': 'refreshTokenFk'},
    const {'1': 'deviceFk', '3': 4, '4': 1, '5': 9, '10': 'deviceFk'},
    const {'1': 'userFk', '3': 5, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'valid', '3': 6, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'app', '3': 7, '4': 1, '5': 14, '6': '.AppType', '10': 'app'},
    const {'1': 'appVersion', '3': 8, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'createTime', '3': 9, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 10, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `AuthorizationToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationTokenDescriptor = $convert.base64Decode('ChJBdXRob3JpemF0aW9uVG9rZW4SDgoCaWQYASABKAlSAmlkEi4KEmF1dGhvcml6YXRpb25Ub2tlbhgCIAEoCVISYXV0aG9yaXphdGlvblRva2VuEiYKDnJlZnJlc2hUb2tlbkZrGAMgASgJUg5yZWZyZXNoVG9rZW5GaxIaCghkZXZpY2VGaxgEIAEoCVIIZGV2aWNlRmsSFgoGdXNlckZrGAUgASgJUgZ1c2VyRmsSFAoFdmFsaWQYBiABKAhSBXZhbGlkEhoKA2FwcBgHIAEoDjIILkFwcFR5cGVSA2FwcBIeCgphcHBWZXJzaW9uGAggASgJUgphcHBWZXJzaW9uEh4KCmNyZWF0ZVRpbWUYCSABKAlSCmNyZWF0ZVRpbWUSHgoKdXBkYXRlVGltZRgKIAEoCVIKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = const {
  '1': 'RefreshToken',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'userFk', '3': 3, '4': 1, '5': 9, '10': 'userFk'},
    const {'1': 'valid', '3': 4, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'expirationTime', '3': 5, '4': 1, '5': 9, '10': 'expirationTime'},
    const {'1': 'createTime', '3': 6, '4': 1, '5': 9, '10': 'createTime'},
    const {'1': 'updateTime', '3': 7, '4': 1, '5': 9, '10': 'updateTime'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode('CgxSZWZyZXNoVG9rZW4SDgoCaWQYASABKAlSAmlkEiIKDHJlZnJlc2hUb2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEhYKBnVzZXJGaxgDIAEoCVIGdXNlckZrEhQKBXZhbGlkGAQgASgIUgV2YWxpZBImCg5leHBpcmF0aW9uVGltZRgFIAEoCVIOZXhwaXJhdGlvblRpbWUSHgoKY3JlYXRlVGltZRgGIAEoCVIKY3JlYXRlVGltZRIeCgp1cGRhdGVUaW1lGAcgASgJUgp1cGRhdGVUaW1l');
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
    const {'1': 'coordinates', '3': 6, '4': 1, '5': 11, '6': '.LatLng', '10': 'coordinates'},
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
final $typed_data.Uint8List userAddressDescriptor = $convert.base64Decode('CgtVc2VyQWRkcmVzcxIOCgJpZBgBIAEoCVICaWQSEAoDdGFnGAIgASgJUgN0YWcSQgoNcmVzaWRlbmNlVHlwZRgDIAEoDjIcLlVzZXJBZGRyZXNzLlVzZXJBZGRyZXNzVHlwZVINcmVzaWRlbmNlVHlwZRImCg5idWlsZGluZ051bWJlchgEIAEoCVIOYnVpbGRpbmdOdW1iZXISIAoLaG91c2VOdW1iZXIYBSABKAlSC2hvdXNlTnVtYmVyEikKC2Nvb3JkaW5hdGVzGAYgASgLMgcuTGF0TG5nUgtjb29yZGluYXRlcxIgCgtkZXNjcmlwdGlvbhgHIAEoCVILZGVzY3JpcHRpb24SFgoGdXNlckZrGAggASgJUgZ1c2VyRmsSHgoKcHJvdmluY2VGaxgJIAEoCVIKcHJvdmluY2VGaxImCg5tdW5pY2lwYWxpdHlGaxgKIAEoCVIObXVuaWNpcGFsaXR5RmsSHgoKY3JlYXRlVGltZRgLIAEoCVIKY3JlYXRlVGltZRIeCgp1cGRhdGVUaW1lGAwgASgJUgp1cGRhdGVUaW1lIj0KD1VzZXJBZGRyZXNzVHlwZRIPCgtVTlNQRUNJRklFRBAAEgkKBUhPVVNFEAESDgoKQVBBUlRBTUVOVBAC');
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
