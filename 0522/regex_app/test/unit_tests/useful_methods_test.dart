import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegExp.hasMatch', () {
    test('', () {
      RegExp regExp = RegExp(r'love');
      expect(regExp.hasMatch('I love you.'), true);
      expect(regExp.hasMatch('I hate you.'), false);
    });
  });

  group('RegExp.firstMatch and RegExp.allMatches', () {
    RegExp regExp =
        RegExp(r'(?<record>(?<number>\d+) (?<animal>cat|dog|cow|pig)s?)');
    String records = '5 cats, 4 dogs, 9 cows and 15 pigs';

    test('RegExp.firstMatch', () {
      RegExpMatch? firstMatch = regExp.firstMatch(records);

      expect(firstMatch?.namedGroup('record'), '5 cats');
      expect(firstMatch?.namedGroup('number'), '5');
      expect(firstMatch?.namedGroup('animal'), 'cat');
      expect(firstMatch?[0], '5 cats');
      expect(firstMatch?[1], '5 cats');
      expect(firstMatch?[2], '5');
      expect(firstMatch?[3], 'cat');
    });

    test('RegExp.allMatches', () {
      Iterable<RegExpMatch> allMatches = regExp.allMatches(records);
      final recordResults = ['5 cats', '4 dogs', '9 cows', '15 pigs'];
      final numberResults = ['5', '4', '9', '15'];
      final animalResults = ['cat', 'dog', 'cow', 'pig'];

      for (int i = 0; i < allMatches.length; i++) {
        expect(allMatches.elementAt(i).namedGroup('record'), recordResults[i]);
        expect(allMatches.elementAt(i).namedGroup('number'), numberResults[i]);
        expect(allMatches.elementAt(i).namedGroup('animal'), animalResults[i]);
      }
    });

    test('RegExp.allMatches With Start Index', () {
      Iterable<RegExpMatch> allMatches = regExp.allMatches(records, 8);
      final recordResults = ['4 dogs', '9 cows', '15 pigs'];
      final numberResults = ['4', '9', '15'];
      final animalResults = ['dog', 'cow', 'pig'];

      for (int i = 0; i < allMatches.length; i++) {
        expect(allMatches.elementAt(i).namedGroup('record'), recordResults[i]);
        expect(allMatches.elementAt(i).namedGroup('number'), numberResults[i]);
        expect(allMatches.elementAt(i).namedGroup('animal'), animalResults[i]);
      }
    });

    test('RegExpMatch', () {
      RegExp regExp = RegExp(r'\d(\d(\d)(\d))(\d(\d(\d)(\d)))\d');
      RegExpMatch? match = regExp.firstMatch('012345678');

      expect(match?[0], '012345678');
      expect(match?[1], '123');
      expect(match?[2], '2');
      expect(match?[3], '3');
      expect(match?[4], '4567');
      expect(match?[5], '567');
      expect(match?[6], '6');
      expect(match?[7], '7');
    });
  });

  group('String methods', () {
    test('String.replaceFirst', () {
      RegExp pattern = RegExp(r'origin');
      String originString = 'This is the origin string';
      String replace = 'first';

      expect(
        originString.replaceFirst(pattern, replace),
        'This is the first string',
      );
    });

    test('String.replaceAll', () {
      RegExp pattern = RegExp(r'\b\w+\b');
      String originString = 'Almost all information will be lost';
      String replace = 'lost';

      expect(
        originString.replaceAll(pattern, replace),
        'lost lost lost lost lost lost',
      );
    });

    test('String.replaceFirstMapped', () {
      RegExp regExp = RegExp(r'(\w+)\s(\w+)');
      String lastFirst = 'Smith John';

      String firstLast = lastFirst.replaceFirstMapped(
        regExp,
        (Match m) => '${m[2]} ${m[1]}',
      );

      expect(firstLast, 'John Smith');
    });

    test('String.replaceAllMapped', () {
      RegExp regExp = RegExp(r'(\w+)\s(\w+)');
      String lastFirst = 'Smith John\nNakamura Hikaru\nAdebayo Peter\nMa Long';

      String firstLast = lastFirst.replaceAllMapped(
        regExp,
        (Match m) => '${m[2]} ${m[1]}',
      );

      expect(firstLast, 'John Smith\nHikaru Nakamura\nPeter Adebayo\nLong Ma');
    });
  });
}
