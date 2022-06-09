import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Repeating and Optional Characters', () {
    test("Matches 'flavour' or 'flavor'", () {
      RegExp optional = RegExp(r'flavou?r');

      expect(optional.hasMatch("flavour"), true);
      expect(optional.hasMatch("flavor"), true);
      expect(optional.hasMatch("flavr"), false);
    });

    test("Matches 'hi' or 'hii' or 'hiii'...", () {
      RegExp oneOrMore = RegExp(r'hi+');

      expect(oneOrMore.hasMatch("hiiii"), true);
      expect(oneOrMore.hasMatch("h"), false);
    });

    test("Matches 'Sample', 'Sample1', 'Sample21', 'Sample456'", () {
      RegExp zeroOrMore = RegExp(r'Sample\d*');

      expect(zeroOrMore.hasMatch("Sample"), true);
      expect(zeroOrMore.hasMatch("Sample468"), true);
      expect(zeroOrMore.hasMatch("Sampld"), false);
    });

    test("Matches two, three or four digits", () {
      RegExp range = RegExp(r'\d{2,4}');

      expect(range.hasMatch("457"), true);
      expect(range.hasMatch("4"), false);
    });

    test("Matches five or more digits", () {
      RegExp range = RegExp(r'\d{5,}');

      expect(range.hasMatch("4789"), false);
      expect(range.hasMatch("24789"), true);
    });

    test(
        "Matches four alphanumeric characters, e.g 'look', 'ball', 'boy1', '2002'",
        () {
      RegExp precise = RegExp(r'\w{4}');

      expect(precise.hasMatch("walk"), true);
      expect(precise.hasMatch("wal"), false);
    });
  });
}
