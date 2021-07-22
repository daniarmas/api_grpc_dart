///
//  Generated code. Do not modify.
//  source: protos/main.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class VerificationCodeType extends $pb.ProtobufEnum {
  static const VerificationCodeType UNSPECIFIED = VerificationCodeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPECIFIED');
  static const VerificationCodeType SIGN_IN = VerificationCodeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIGN_IN');
  static const VerificationCodeType SIGN_UP = VerificationCodeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIGN_UP');
  static const VerificationCodeType CHANGE_USER_EMAIL = VerificationCodeType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_USER_EMAIL');

  static const $core.List<VerificationCodeType> values = <VerificationCodeType> [
    UNSPECIFIED,
    SIGN_IN,
    SIGN_UP,
    CHANGE_USER_EMAIL,
  ];

  static final $core.Map<$core.int, VerificationCodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VerificationCodeType? valueOf($core.int value) => _byValue[value];

  const VerificationCodeType._($core.int v, $core.String n) : super(v, n);
}

