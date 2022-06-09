import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Examples of Regular Expressions and Function', () {
    test('Extract file extension', () {
      String? extractExt(String fileName) {
        final pattern = RegExp(r'\.(?<ext>[0-9a-zA-Z]+)$');
        final match = pattern.firstMatch(fileName);
        return match?.namedGroup('ext');
      }

      expect(extractExt('verygoodfile.dart'), 'dart');
    });

    test('Validates email string', () {
      bool isValidEmail(String email) {
        final pattern = RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
        return pattern.hasMatch(email.trim());
      }

      final emailSamples = [
        'wonderwoman@marvel.com',
        'fast@fastai.com',
        'hoodieman@gmail.com',
        'goodmangonebad@hotmail.com'
      ];

      for (String email in emailSamples) {
        expect(isValidEmail(email), true);
      }
    });

    test('Validates email string', () {
      bool isPasswordValid(String password) {
        final containsUpperCase = RegExp(r'[A-Z]').hasMatch(password);
        final containsLowerCase = RegExp(r'[a-z]').hasMatch(password);
        final containsNumber = RegExp(r'\d').hasMatch(password);
        final containsSymbols = RegExp(r'[`~!@#$%\^&*\(\)_+\\\-={}\[\]\/.,<>;]')
            .hasMatch(password); // This may not be necessary
        final hasManyCharacters = RegExp(r'.{8,128}', dotAll: true)
            .hasMatch(password); // This is variable

        return containsUpperCase &&
            containsLowerCase &&
            containsNumber &&
            containsSymbols &&
            hasManyCharacters;
      }

      final goodPasswords = [
        '1ntToBe_100',
        'gooDy_Boy1',
        'Maximus@1',
      ];

      for (String password in goodPasswords) {
        expect(isPasswordValid(password), true);
      }

      final weakPasswords = [
        'password',
        'admin1',
        'goodBoy99',
      ];

      for (String password in weakPasswords) {
        expect(isPasswordValid(password), false);
      }
    });
  });
}
