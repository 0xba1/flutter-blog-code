import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Creating RegExp Patterns', () {
    test('Checks if pattern matches a string', () {
      RegExp regExp = RegExp(r'hello');

      expect(regExp.hasMatch('hello'), true);
      expect(regExp.hasMatch('hello John'), true);
      expect(regExp.hasMatch('hello Amit'), true);
      expect(regExp.hasMatch('hell no'), false);
    });
  });
}
