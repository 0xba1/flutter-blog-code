import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Choice Patterns', () {
    test(
        "This would match one of 'orange', 'banana', 'pineapple', 'water melon' and 'apple'",
        () {
      RegExp fruit = RegExp(r'orange|banana|pineapple|water melon|apple');
      expect(fruit.hasMatch('banana'), true);
      expect(fruit.hasMatch('pineapple'), true);
      expect(fruit.hasMatch('yam'), false);
    });

    test("This would match one of '1 girl', '2 girls', '3 girls', '4 girls'",
        () {
      RegExp fruit = RegExp(r'1 girl|(2|3|4) girls');
      expect(fruit.hasMatch('1 girl'), true);
      expect(fruit.hasMatch('3 girls'), true);
      expect(fruit.hasMatch('3 girl'), false);
      expect(fruit.hasMatch('5 girls'), false);
    });
  });
}
