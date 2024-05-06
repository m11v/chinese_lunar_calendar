import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarDate', () {
    test('Test lunarYearCN', () {
      final lunarDate = LunarDate(
        year: 2023,
        month: 6,
        day: 6,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(lunarDate.lunarYearCN, '二零二三');
    });

    test('Test lunarMonthCN', () {
      final lunarDate = LunarDate(
        year: 2023,
        month: 6,
        day: 24,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(
          '${lunarDate.leapMonthPrefix.sValue}${lunarDate.lunarMonthCN.sValue}${lunarDate.monthLengthSuffix}',
          '六月小');

      final lunarDate2 = LunarDate(
        year: 2023,
        month: 7,
        day: 15,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate2.leapMonthPrefix.sValue}${lunarDate2.lunarMonthCN.sValue}${lunarDate2.monthLengthSuffix}',
          '七月大');

      final lunarDate3 = LunarDate(
        year: 2023,
        month: 2,
        day: 26,
        isLeapMonth: true,
        isLongMonth: false,
      );
      expect(
          '${lunarDate3.leapMonthPrefix.sValue}${lunarDate3.lunarMonthCN.sValue}${lunarDate3.monthLengthSuffix}',
          '闰二月小');

      final lunarDate4 = LunarDate(
        year: 2023,
        month: 2,
        day: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate4.leapMonthPrefix.sValue}${lunarDate4.lunarMonthCN.sValue}${lunarDate4.monthLengthSuffix}',
          '二月大');
    });

    test('Test lunarDayCN', () {
      final lunarDate = LunarDate(
        year: 2023,
        month: 2,
        day: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(lunarDate.lunarDayCN, '初十');
    });
  });
}
