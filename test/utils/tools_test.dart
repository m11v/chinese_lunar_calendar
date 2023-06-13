import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test tools', () {
    test('Test parseCSTToUTC', () {
      expect(
          parseCSTToUTC(2023, 6, 14, 1, 25), DateTime.utc(2023, 6, 13, 17, 25));
    });
  });
}
