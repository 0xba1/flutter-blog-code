import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Word and String Boundaries', () {
    test("Matches a string that has a separate word 'stand'", () {
      RegExp word1 = RegExp(r'\bstand\b');
      expect(word1.hasMatch('I understand'), false);
      expect(word1.hasMatch('You have understanding'), false);
      expect(word1.hasMatch('I am standing'), false);
      expect(word1.hasMatch('I stand'), true);
    });

    test("Matches a string that contains 'stand' at the beginning of a word",
        () {
      RegExp word2 = RegExp(r'\bstand');
      expect(word2.hasMatch('I understand'), false);
      expect(word2.hasMatch('You have understanding'), false);
      expect(word2.hasMatch('I am standing'), true);
      expect(word2.hasMatch('I stand'), true);
    });

    test("Matches a string that contains 'stand' at the end of a word", () {
      RegExp word3 = RegExp(r'stand\b');
      expect(word3.hasMatch('I understand'), true);
      expect(word3.hasMatch('You have understanding'), false);
      expect(word3.hasMatch('I am standing'), false);
      expect(word3.hasMatch('I stand'), true);
    });
  });
}
