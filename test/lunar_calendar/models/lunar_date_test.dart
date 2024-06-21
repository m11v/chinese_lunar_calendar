import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarDate', () {
    test('Test lunarYearCN', () {
      final lunarDate = LunarDate(
        lunaYear: 2023,
        lunaMonth: 6,
        lunaDay: 6,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(lunarDate.lunarYearCN, '二零二三');
    });

    test('Test lunarMonthCN', () {
      final lunarDate = LunarDate(
        lunaYear: 2023,
        lunaMonth: 6,
        lunaDay: 24,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(
          '${lunarDate.leapMonthPrefix.sValue}${lunarDate.lunarMonthCN.sValue}${lunarDate.monthLengthSuffix}',
          '六月小');

      final lunarDate2 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 7,
        lunaDay: 15,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate2.leapMonthPrefix.sValue}${lunarDate2.lunarMonthCN.sValue}${lunarDate2.monthLengthSuffix}',
          '七月大');

      final lunarDate3 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 2,
        lunaDay: 26,
        isLeapMonth: true,
        isLongMonth: false,
      );
      expect(
          '${lunarDate3.leapMonthPrefix.sValue}${lunarDate3.lunarMonthCN.sValue}${lunarDate3.monthLengthSuffix}',
          '闰二月小');

      final lunarDate4 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 2,
        lunaDay: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate4.leapMonthPrefix.sValue}${lunarDate4.lunarMonthCN.sValue}${lunarDate4.monthLengthSuffix}',
          '二月大');
    });

    test('Test lunarDayCN', () {
      final lunarDate = LunarDate(
        lunaYear: 2023,
        lunaMonth: 2,
        lunaDay: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(lunarDate.lunarDayCN, '初十');
    });
  });
}
