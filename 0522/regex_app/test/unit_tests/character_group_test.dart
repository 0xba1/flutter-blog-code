import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Character Groups', () {
    test('\\d', () {
      RegExp digitRegExp = RegExp(r'\d');

      expect(digitRegExp.hasMatch("I'm on cloud 9"), true);
      expect(digitRegExp.hasMatch("I'm on cloud nine"), false);
    });

    test('\\w', () {
      RegExp alphaNumericRegExp = RegExp(r'\w');

      expect(alphaNumericRegExp.hasMatch("I'm on cloud 9"), true);
      expect(alphaNumericRegExp.hasMatch("I'm on cloud nine"), true);
      expect(alphaNumericRegExp.hasMatch("       \n\t"), false);
    });

    test('\\s', () {
      RegExp whitespaceRegExp = RegExp(r'\s');

      expect(whitespaceRegExp.hasMatch("I'moncloud9"), false);
      expect(whitespaceRegExp.hasMatch("I'moncloudnine"), false);
      expect(whitespaceRegExp.hasMatch("       \n\t"), true);
    });

    test('\\D', () {
      RegExp nondigitRegExp = RegExp(r'\D');

      expect(nondigitRegExp.hasMatch("1237854895"), false);
      expect(nondigitRegExp.hasMatch("I'm on cloud nine"), true);
      expect(nondigitRegExp.hasMatch("       \n\t"), true);
    });

    test('\\W', () {
      RegExp nonAlphaNumericRegExp = RegExp(r'\W');

      expect(nonAlphaNumericRegExp.hasMatch("1237854895"), false);
      expect(nonAlphaNumericRegExp.hasMatch("Imoncloudnine"), false);
      expect(nonAlphaNumericRegExp.hasMatch("       \n\t"), true);
    });

    test('\\S', () {
      RegExp nonWhitespaceRegExp = RegExp(r'\S');

      expect(nonWhitespaceRegExp.hasMatch("1237854895"), true);
      expect(nonWhitespaceRegExp.hasMatch("I'm on cloud nine"), true);
      expect(nonWhitespaceRegExp.hasMatch("       \n\t"), false);
    });

    test('.', () {
      RegExp dotRegExp = RegExp(r'.');

      expect(dotRegExp.hasMatch("1237854895"), true);
      expect(dotRegExp.hasMatch("I'm on cloud nine"), true);
      expect(dotRegExp.hasMatch("       \n\t"), true);
      expect(dotRegExp.hasMatch("\n"), false);
    });
  });
}
