import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarDate', () {
    final lunarYear2023 = getLunarYear(2023);

    test('Test lunarYearCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 6,
        lunarDay: 6,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(lunarDate.lunarYearCN, '二零二三');
    });

    test('Test lunarMonthCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 6,
        lunarDay: 24,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(
          '${lunarDate.leapMonthPrefix.sValue}${lunarDate.lunarMonthCN.sValue}${lunarDate.monthLengthSuffix}',
          '六月小');

      final lunarDate2 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 7,
        lunarDay: 15,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate2.leapMonthPrefix.sValue}${lunarDate2.lunarMonthCN.sValue}${lunarDate2.monthLengthSuffix}',
          '七月大');

      final lunarDate3 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 2,
        lunarDay: 26,
        isLeapMonth: true,
        isLongMonth: false,
      );
      expect(
          '${lunarDate3.leapMonthPrefix.sValue}${lunarDate3.lunarMonthCN.sValue}${lunarDate3.monthLengthSuffix}',
          '闰二月小');

      final lunarDate4 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 2,
        lunarDay: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(
          '${lunarDate4.leapMonthPrefix.sValue}${lunarDate4.lunarMonthCN.sValue}${lunarDate4.monthLengthSuffix}',
          '二月大');
    });

    test('Test lunarDayCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: 2,
        lunarDay: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(lunarDate.lunarDayCN, '初十');
    });
  });
}
