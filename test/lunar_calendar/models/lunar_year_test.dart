import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarYear', () {
    test('Test zodiac', () {
      final lunarYear = getLunarYear(2023);
      expect(lunarYear.zodiac, '兔');
    });
  });
}
