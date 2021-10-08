import 'dart:math';

import 'package:intl/intl.dart';

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

  static bool isNumeric(String? value) {
    if (isEmpty(value)) return false;
    return RegExp(r'^(0|[1-9][0-9]*)$').hasMatch(value!);
  }

  static String generateNumber() {
    var randomNumber = Random();
    var next = randomNumber.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    return next.toInt().toString();
  }

  static bool isAlias(String? value) {
    if (isEmpty(value)) return false;
    return RegExp(r'^[\w\.\_]+$').hasMatch(value!);
  }

  static String formatDateTime(DateTime time) {
    late String month;
    if (time.month == 1) {
      month = 'Enero';
    } else if (time.month == 2) {
      month = 'Febrero';
    } else if (time.month == 3) {
      month = 'Marzo';
    } else if (time.month == 4) {
      month = 'Abril';
    } else if (time.month == 5) {
      month = 'Mayo';
    } else if (time.month == 6) {
      month = 'Junio';
    } else if (time.month == 7) {
      month = 'Julio';
    } else if (time.month == 8) {
      month = 'Agosto';
    } else if (time.month == 9) {
      month = 'Septiembre';
    } else if (time.month == 10) {
      month = 'Octubre';
    } else if (time.month == 11) {
      month = 'Noviembre';
    } else if (time.month == 12) {
      month = 'Diciembre';
    }
    return '${time.day} de $month del ${time.year} a las ${DateFormat.jm().format(time)}';
  }
}
