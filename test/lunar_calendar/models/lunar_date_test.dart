import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarDate', () {
    test('Test lunarYearCN', () {
      final lunarDate =
          LunarDate(year: 2023, month: 6, day: 6, isLeapMonth: false);
      expect(lunarDate.lunarYearCN, '二零二三');
    });

    test('Test lunarMonthCN', () {
      final lunarDate =
          LunarDate(year: 2023, month: 6, day: 24, isLeapMonth: false);
      expect(
          '${lunarDate.leapMonthPrefix}${lunarDate.lunarMonthCN}${lunarDate.monthLengthSuffix}',
          '六月小');

      final lunarDate2 =
          LunarDate(year: 2023, month: 7, day: 15, isLeapMonth: false);
      expect(
          '${lunarDate2.leapMonthPrefix}${lunarDate2.lunarMonthCN}${lunarDate2.monthLengthSuffix}',
          '七月大');

      final lunarDate3 =
          LunarDate(year: 2023, month: 2, day: 26, isLeapMonth: true);
      expect(
          '${lunarDate3.leapMonthPrefix}${lunarDate3.lunarMonthCN}${lunarDate3.monthLengthSuffix}',
          '闰二月小');

      final lunarDate4 =
          LunarDate(year: 2023, month: 2, day: 10, isLeapMonth: false);
      expect(
          '${lunarDate4.leapMonthPrefix}${lunarDate4.lunarMonthCN}${lunarDate4.monthLengthSuffix}',
          '二月大');
    });

    test('Test lunarDayCN', () {
      final lunarDate =
          LunarDate(year: 2023, month: 2, day: 10, isLeapMonth: false);
      expect(lunarDate.lunarDayCN, '初十');
    });
  });
}
