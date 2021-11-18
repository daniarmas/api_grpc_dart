// import 'package:api_grpc_dart/core/utils/const.dart';

// Project imports:
import 'package:api_grpc_dart/core/utils/string_utils.dart';

class Validation {
  // static String? name(String value) {
  //   if (!StringUtils.isName(value)) return invalidName;
  // }

  // static String? email(String value) {
  //   if (!StringUtils.isEmail(value)) return invalidEmail;
  // }

  static bool alias(String value) {
    if (!StringUtils.isAlias(value)) {
      return false;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return false;
    } else if (value[0] == '.' || value[0] == '_') {
      return false;
    } else if (value[value.length - 1] == '.' ||
        value[value.length - 1] == '_') {
      return false;
    }
    return true;
  }

  static bool name(String value) {
    if (!StringUtils.isName(value)) return false;
    return true;
  }

  // static String? code(String value) {
  //   if (StringUtils.isEmpty(value)) return emptyCode;
  //   if (!StringUtils.isCode(value)) return invalidCode;
  //   // if (value.length < 6) return lengthCode;
  // }
}
