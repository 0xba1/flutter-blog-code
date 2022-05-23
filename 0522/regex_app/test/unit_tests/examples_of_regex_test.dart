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
  });
}
