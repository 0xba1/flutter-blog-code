import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Escaping characters', () {
    RegExp money = RegExp(r'\$\d+\.\d{2}');

    expect(money.hasMatch('\$10578.43'), true);
  });
}
