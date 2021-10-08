/// A simple library for generating random
/// and seedable username for emails or user forms
library username_generator;

import 'dart:math';

import 'package:injectable/injectable.dart';

extension StringExtension on String {
  String get twoNumber {
    if (length == 1) return '0' + this;
    return this;
  }
}

/// A Username Generator.
@Injectable()
class UsernameGenerator {
  /// A separator for the username
  String separator = '_';

  // /// A list of names for generating a random username from
  // List<String> names = seed_data.names;

  // /// A list of adjectives for generating a random username from
  // List<String> adjectives = seed_data.adjectives;

  List<String> splitDate = [];

  final Random _random = Random();

  /// Generate username from email or name, date or numbers
  String generate(String emailOrName,
      {List<String> adjectives = const [],
      DateTime? date,
      bool hasNumbers = true,
      int numberSeed = 9999,
      String prefix = '',
      String suffix = '',
      bool shortYear = true}) {
    // Check if emailOrName is email
    if (emailOrName.contains('@')) {
      emailOrName = emailOrName
          .substring(0, emailOrName.indexOf('@'))
          .replaceAll(RegExp(r'[^a-zA-Z\d]'), '');
    }

    String name = '';
    String sNameOrflName = '';
    String flName = '';
    String slName = '';

    if (date != null) {
      String day = date.day.toString().twoNumber;
      String month = date.month.toString().twoNumber;
      String year = date.year.toString();
      String shortYear = date.year.toString().substring(2, 4);
      splitDate = [day, month, year, shortYear];
    }

    emailOrName = emailOrName
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'[^a-zA-Z\d\s]'), ' ')
        .replaceAll(RegExp(r'\s{2,}'), ' ')
        .replaceAll(' ', '');

    // if (!emailOrName.contains(RegExp(r'[\.|_]'))) {
    if (emailOrName.length > 1) {
      emailOrName = _getRandomSeparatorPosition(emailOrName);
    } else {
      emailOrName = emailOrName + _getRandomSeparator();
    }
    // }

    if (emailOrName.length >= 27 && emailOrName.length < 30) {
      int numberLength = 30 - emailOrName.length;
      emailOrName =
          emailOrName + _getRandomNumber(splitDate, numberSeed, numberLength);
    } else {
      emailOrName = emailOrName + _getRandomNumber(splitDate, numberSeed, 4);
    }

    // generate date string
    var dateString = '';
    if (date != null) {
      if (shortYear) {
        dateString = date.year.toString().substring(2, 4);
      } else {
        dateString = date.year.toString();
      }
    }

    var adjective = '';
    if (adjectives.isNotEmpty) {
      adjective = _getRandomElement(adjectives);
    }

    var numberString = '';
    if (dateString == '' && hasNumbers) {
      numberString = _random.nextInt(numberSeed).toString();
    }

    return emailOrName;
  }

  /// Generate username for first and lastname
  String generateForName(String firstName,
      {String lastName = '',
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100}) {
    var names = [
      [lastName, firstName].join(' '),
      [firstName, lastName].join(' '),
      [firstName, lastName].join(),
      firstName,
      lastName
    ].where((element) => element.isNotEmpty).toList();

    String name = _getRandomElement(names);

    //${adjectives[ran_b]}${separator}${names[ran_a]}
    return generate(name,
        adjectives: adjectives, hasNumbers: hasNumbers, numberSeed: numberSeed);
  }

  /// Generates a list of username for first and lastname
  List<String> generateList(String emailOrName,
      {List<String> adjectives = const [],
      DateTime? date,
      bool hasNumbers = true,
      int numberSeed = 100,
      String prefix = '',
      String suffix = '',
      bool shortYear = true,
      int length = 1}) {
    var usernames = <String>{};
    while (usernames.length < length) {
      usernames.add(
        generate(emailOrName,
            date: date,
            adjectives: adjectives,
            hasNumbers: hasNumbers,
            numberSeed: numberSeed,
            shortYear: shortYear,
            prefix: prefix,
            suffix: suffix),
      );
    }

    return usernames.toList();
  }

  /// Generates a list of username for first and lastname
  List<String> generateListForName(String firstName,
      {String lastName = '',
      List<String> adjectives = const [],
      bool hasNumbers = true,
      int numberSeed = 100,
      int length = 1}) {
    var usernames = <String>[];
    for (var i = 0; i < length; i++) {
      usernames.add(generateForName(
        firstName,
        lastName: lastName,
        adjectives: adjectives,
        hasNumbers: hasNumbers,
        numberSeed: numberSeed,
      ));
    }

    return usernames;
  }

  String _getRandomSeparatorPosition(String name) {
    String firtPart = name.substring(0, 1);
    String secondPart = name.substring(1);

    int i = _random.nextInt(secondPart.length);
    List<String> split = secondPart.split('')..insert(i, _getRandomSeparator());
    secondPart = split.join('');
    return firtPart + secondPart;
  }

  String _getRandomNumber(List<String> list, int numberSeed, int numberlength) {
    switch (numberlength) {
      case 3:
        numberSeed = 999;
        break;
      case 2:
        numberSeed = 99;
        break;
      case 1:
        numberSeed = 9;
        break;
      default:
        numberSeed = 9999;
    }

    String date = list[(_random.nextDouble() * list.length).floor()];

    while (date.length <= _random.nextInt(numberlength)) {
      date = date + list[(_random.nextDouble() * list.length).floor()];
    }

    if (date.length <= numberSeed.toString().length) return date;
    return _random.nextInt(numberSeed).toString();
  }

  String _getRandomSeparator() {
    var separator = ['_', '', '.'];
    return separator[(_random.nextDouble() * separator.length).floor()];
  }

  /// Get a random element from the list given
  dynamic _getRandomElement(List<dynamic> list) {
    return list[(_random.nextDouble() * list.length).floor()];
  }
}
