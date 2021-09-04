import 'dart:math';

extension StringExtension on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

class StringUtils {
  static bool isEmpty(String? s) => s == null || s.trim().isEmpty;
  static bool isNotEmpty(String? s) => !isEmpty(s);

  static bool isEmail(String? value) {
    if (isEmpty(value)) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
  }

  static String generateNumber() {
    var randomNumber = Random();
    var next = randomNumber.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    return next.toInt().toString();
  }
}
