import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test LunarDate', () {
    final lunarYear2023 = LunarYear.fromYear(2023);
    final lunarYear2022 = LunarYear.fromYear(2022);

    test('Test LunarDate.fromDateTime', () {
      final date1 = DateTime(2023, 12, 30);
      final expectLunarDate1 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(11),
        lunarDay: 18,
      );
      expect(LunarDate.fromDateTime(localTime: date1), expectLunarDate1);

      final date2 = DateTime(2023, 3, 13);
      final expectLunarDate2 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(2),
        lunarDay: 22,
      );
      expect(LunarDate.fromDateTime(localTime: date2), expectLunarDate2);

      final date3 = DateTime(2023, 3, 26);
      final expectLunarDate3 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.leapMonth!,
        lunarDay: 5,
      );
      expect(LunarDate.fromDateTime(localTime: date3), expectLunarDate3);

      final date4 = DateTime(2023, 1, 1);
      final expectLunarDate4 = LunarDate(
        lunarYear: lunarYear2022,
        lunarMonth: lunarYear2022.getNonLeapLunarMonthFromNumber(12),
        lunarDay: 10,
      );
      expect(LunarDate.fromDateTime(localTime: date4), expectLunarDate4);

      final date5 = DateTime(2023, 11, 5);
      final expectLunarDate5 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(9),
        lunarDay: 22,
      );
      expect(LunarDate.fromDateTime(localTime: date5), expectLunarDate5);

      final date6 = DateTime(2023, 11, 6);
      final expectLunarDate6 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(9),
        lunarDay: 23,
      );
      expect(LunarDate.fromDateTime(localTime: date6), expectLunarDate6);
    });

    test('Test lunarYearCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(6),
        lunarDay: 6,
      );
      expect(lunarDate.lunarYearCN, '二零二三');
    });

    test('Test lunarMonthCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(6),
        lunarDay: 24,
      );
      expect(
          '${lunarDate.leapMonthPrefix.sValue}${lunarDate.lunarMonthCN.sValue}${lunarDate.monthLengthSuffix}',
          '六月小');

      final lunarDate2 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(7),
        lunarDay: 15,
      );
      expect(
          '${lunarDate2.leapMonthPrefix.sValue}${lunarDate2.lunarMonthCN.sValue}${lunarDate2.monthLengthSuffix}',
          '七月大');

      final lunarDate3 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.leapMonth!,
        lunarDay: 26,
      );
      expect(
          '${lunarDate3.leapMonthPrefix.sValue}${lunarDate3.lunarMonthCN.sValue}${lunarDate3.monthLengthSuffix}',
          '闰二月小');

      final lunarDate4 = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(2),
        lunarDay: 10,
      );
      expect(
          '${lunarDate4.leapMonthPrefix.sValue}${lunarDate4.lunarMonthCN.sValue}${lunarDate4.monthLengthSuffix}',
          '二月大');
    });

    test('Test lunarDayCN', () {
      final lunarDate = LunarDate(
        lunarYear: lunarYear2023,
        lunarMonth: lunarYear2023.getNonLeapLunarMonthFromNumber(2),
        lunarDay: 10,
      );
      expect(lunarDate.lunarDayCN, '初十');
    });
  });
}
