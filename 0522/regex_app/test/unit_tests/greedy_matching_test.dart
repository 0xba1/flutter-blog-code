import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Greedy Matching', () {
    test('Greedy', () {
      final greedy = RegExp(r'^(?<letters>\w+)(?<digits>\d*)$');

      final greedyMatch = greedy.firstMatch('Superman45');

      expect(greedyMatch?.namedGroup('letters'), 'Superman45');
      expect(greedyMatch?.namedGroup('digits'), '');
    });

    test('Non-greedy', () {
      final nonGreedy = RegExp(r'^(?<letters>\w+?)(?<digits>\d*)$');

      final nonGreedyMatch = nonGreedy.firstMatch('Superman45');

      expect(nonGreedyMatch?.namedGroup('letters'), 'Superman');
      expect(nonGreedyMatch?.namedGroup('digits'), '45');
    });
  });
}
