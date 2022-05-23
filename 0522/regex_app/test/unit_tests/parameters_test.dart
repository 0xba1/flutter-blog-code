import 'package:flutter_test/flutter_test.dart';

void main() {
  group('multiline', () {
    RegExp nonMulti = RegExp(r'end$'); // multiline: false
    RegExp multi = RegExp(r'end$', multiLine: true);

    test('nonMultiline option', () {
      expect(nonMulti.hasMatch('This is the end\nThis is another line'), false);
    });
    test('multiline option', () {
      expect(multi.hasMatch('This is the end\nThis is another line'), true);
    });
  });

  group('caseSensitive', () {
    RegExp sensitive = RegExp(r'This is a pattern'); // caseSensitive: true
    RegExp insensitive = RegExp(r'This is a pattern', caseSensitive: false);

    test('caseSensitive', () {
      expect(sensitive.hasMatch('This Is A Pattern'), false);
    });

    test('nonCaseSensitive', () {
      expect(insensitive.hasMatch('This Is A Pattern'), true);
    });
  });

  group('unicode', () {
    RegExp nonUnicode = RegExp(r'\u{0221}'); // unicode: false
    RegExp unicode = RegExp(r'\u{0221}', unicode: true);

    test('non-unicode', () {
      expect(nonUnicode.hasMatch('ȡ'), false);
    });

    test('unicode', () {
      expect(unicode.hasMatch('ȡ'), true);
    });
  });

  group('dotAll', () {
    RegExp nonDotAll = RegExp(r'^.+$'); // dotAll: false
    RegExp dotAll = RegExp(r'^.+$', dotAll: true);

    test('non-dotAll', () {
      expect(
          nonDotAll.hasMatch('This is the end\nThis is another line'), false);
    });

    test('dotAll', () {
      expect(dotAll.hasMatch('This is the end\nThis is another line'), true);
    });
  });
}
