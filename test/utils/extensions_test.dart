import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test extensions', () {
    test('Test IntDigits', () {
      final num = 12345;
      final expectDigits = [1, 2, 3, 4, 5];

      expect(num.digits, expectDigits);
    });

    test('Test LastTwoDigitsString', () {
      expect(0.lastTwoDigitsString, '00');
      expect(3.lastTwoDigitsString, '03');
      expect(34.lastTwoDigitsString, '34');
      expect(345.lastTwoDigitsString, '45');
      expect(3456.lastTwoDigitsString, '56');
    });
  });
}
