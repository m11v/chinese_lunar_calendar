import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test extensions', () {
    test('Test IntDigits', () {
      final num = 12345;
      final expectDigits = [1, 2, 3, 4, 5];

      expect(num.digits, expectDigits);
    });
  });
}
