import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Grouping Subexpressions', () {
    test("Matches 'boo' with zero or more occurrences of 'hoo'", () {
      RegExp sub1 = RegExp(r'boo(hoo)*');
      expect(sub1.hasMatch('boo'), true);
      expect(sub1.hasMatch('boohoo'), true);
      expect(sub1.hasMatch('boohoohoo'), true);
      expect(sub1.hasMatch('hoo'), false);
    });

    test(
        "' like to' is optional. This would match 'What would you like to say' and also 'What would you say'",
        () {
      RegExp sub2 = RegExp(r'What would you( like to)? say');
      expect(sub2.hasMatch('What would you like to say'), true);
      expect(sub2.hasMatch('What would you say'), true);
      expect(sub2.hasMatch('What you say'), false);
    });

    test("This would match between 3 and 5 occurrences of 'Meow '", () {
      RegExp sub3 = RegExp(r'(Meow ?){3,5}');
      expect(sub3.hasMatch('Meow'), false);
      expect(sub3.hasMatch('Meow Meow Meow'), true);
      expect(sub3.hasMatch('Meow Meow Meow Meow'), true);
    });
  });
}
