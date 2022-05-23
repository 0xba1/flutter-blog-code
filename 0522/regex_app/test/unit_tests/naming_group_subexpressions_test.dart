import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
      "Here there are two named group subexpressions; 'number' and 'animal' ('s' is optional)",
      () {
    RegExp named = RegExp(r'(?<number>\d+) (?<animal>cat|dog|cow|pig)s?');

    test('Named subexpressions', () {
      RegExpMatch? match1 = named.firstMatch('5 dogs');

      expect(match1?.namedGroup('number'), '5');
      expect(match1?.namedGroup('animal'), 'dog');
    });

    test('Named subexpressions', () {
      RegExpMatch? match2 = named.firstMatch('10 cats');

      expect(match2?.namedGroup('number'), '10');
      expect(match2?.namedGroup('animal'), 'cat');
    });

    test('Named subexpressions', () {
      RegExpMatch? match3 = named.firstMatch('1 pig');

      expect(match3?.namedGroup('number'), '1');
      expect(match3?.namedGroup('animal'), 'pig');
    });
  });
}
