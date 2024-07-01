import 'package:chinese_lunar_calendar/src/lunar_calendar/models/lunar_month.dart';
import 'package:chinese_lunar_calendar/src/lunar_calendar/models/lunar_year.dart';
import 'package:test/test.dart';

void main() {
  group('测试LunarYear', () {
    test('测试 LunarYear.fromYear', () {
      final lunarYear2023 = LunarYear.fromYear(2023);
      expect(lunarYear2023.number, 2023);
      expect(lunarYear2023.days, 384);
      expect(lunarYear2023.hasLeapMonth, true);
      expect(lunarYear2023.leapMonth,
          LunarMonth(number: 2, days: 29, isLeapMonth: true));

      final lunarYear2022 = LunarYear.fromYear(2022);
      expect(lunarYear2022.number, 2022);
      expect(lunarYear2022.days, 355);
      expect(lunarYear2022.hasLeapMonth, false);
      expect(lunarYear2022.leapMonth, null);

      final lunarYear2024 = LunarYear.fromYear(2024);
      expect(lunarYear2024.number, 2024);
      expect(lunarYear2024.days, 354);
      expect(lunarYear2024.hasLeapMonth, false);
      expect(lunarYear2024.leapMonth, null);
    });
  });
}
