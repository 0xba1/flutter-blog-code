import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Character range', () {
    test("Matches only 'a' and 'Y'", () {
      RegExp range1 = RegExp(r'[aY]');

      expect(range1.hasMatch("a"), true);
      expect(range1.hasMatch("Y"), true);
      expect(range1.hasMatch("y"), false);
      expect(range1.hasMatch("b"), false);
    });

    test("Matches all characters except 'a' and 'Y'", () {
      RegExp range2 = RegExp(r'[^aY]');

      expect(range2.hasMatch("a"), false);
      expect(range2.hasMatch("Y"), false);
      expect(range2.hasMatch("y"), true);
      expect(range2.hasMatch("b"), true);
    });

    test("Matches only one of 'c', 'd', 'e', 'f', '2', '3', '4', '5'", () {
      RegExp range3 = RegExp(r'[c-f2-5]');

      expect(range3.hasMatch("b"), false);
      expect(range3.hasMatch("f"), true);
      expect(range3.hasMatch("4"), true);
    });

    test("Matches all characters except 'c', 'd', 'e', 'f', '2', '3', '4', '5'",
        () {
      RegExp range4 = RegExp(r'[^c-f2-5]');

      expect(range4.hasMatch("b"), true);
      expect(range4.hasMatch("f"), false);
      expect(range4.hasMatch("4"), false);
    });
  });
}
