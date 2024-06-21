import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test calculations', () {
    test('Test getChineseNewYear', () {
      final newYear2000 = DateTime(2000, 2, 5);
      expect(getChineseNewYear(2000), newYear2000);

      final newYear2003 = DateTime(2003, 2, 1);
      expect(getChineseNewYear(2003), newYear2003);

      final newYear2033 = DateTime(2033, 1, 31);
      expect(getChineseNewYear(2033), newYear2033);
    });

    test('Test getLunarYear', () {
      final lunarYear2023 = getLunarYear(2023);
      expect(lunarYear2023.year, 2023);
      expect(lunarYear2023.days, 384);
      expect(lunarYear2023.hasLeapMonth, true);
      expect(lunarYear2023.leapMonth,
          LunarMonth(number: 2, days: 29, isLeapMonth: true));

      final lunarYear2022 = getLunarYear(2022);
      expect(lunarYear2022.year, 2022);
      expect(lunarYear2022.days, 355);
      expect(lunarYear2022.hasLeapMonth, false);
      expect(lunarYear2022.leapMonth, null);

      final lunarYear2024 = getLunarYear(2024);
      expect(lunarYear2024.year, 2024);
      expect(lunarYear2024.days, 354);
      expect(lunarYear2024.hasLeapMonth, false);
      expect(lunarYear2024.leapMonth, null);
    });

    test('Test getLunarDate', () {
      final date1 = DateTime(2023, 12, 30);
      final expectLunarDate1 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 11,
        lunaDay: 18,
        isLeapMonth: false,
        isLongMonth: false,
      );
      getLunarDate(date1);
      expect(getLunarDate(date1), expectLunarDate1);

      final date2 = DateTime(2023, 3, 13);
      final expectLunarDate2 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 2,
        lunaDay: 22,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(getLunarDate(date2), expectLunarDate2);

      final date3 = DateTime(2023, 3, 26);
      final expectLunarDate3 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 2,
        lunaDay: 5,
        isLeapMonth: true,
        isLongMonth: false,
      );
      expect(getLunarDate(date3), expectLunarDate3);

      final date4 = DateTime(2023, 1, 1);
      final expectLunarDate4 = LunarDate(
        lunaYear: 2022,
        lunaMonth: 12,
        lunaDay: 10,
        isLeapMonth: false,
        isLongMonth: true,
      );
      expect(getLunarDate(date4), expectLunarDate4);

      final date5 = DateTime(2023, 11, 5);
      final expectLunarDate5 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 9,
        lunaDay: 22,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(getLunarDate(date5), expectLunarDate5);

      final date6 = DateTime(2023, 11, 6);
      final expectLunarDate6 = LunarDate(
        lunaYear: 2023,
        lunaMonth: 9,
        lunaDay: 23,
        isLeapMonth: false,
        isLongMonth: false,
      );
      expect(getLunarDate(date6), expectLunarDate6);
    });

    test('Test getLunarYear8Char', () {
      expect(getYear8Char(lunarYear: 2023), '癸卯');
      expect(getYear8Char(lunarYear: 1970), '庚戌');
    });

    test('Test getYear8CharFromDateTime', () {
      expect(getYear8CharFromDateTime(dateTime: DateTime(2023)), '癸卯');
      expect(getYear8CharFromDateTime(dateTime: DateTime(1970)), '庚戌');
    });

    test('Test getLunarMonth8Char', () {
      expect(
          getLunarMonth8Char(
              dateTime: DateTime(2023, 6, 24), useCSTToCalculate: false),
          '戊午');
    });

    test('Test getDay8Char', () {
      expect(getDay8Char(dateTime: DateTime(2023, 6, 24)), '癸丑');
      expect(getDay8Char(dateTime: DateTime(2010, 6, 24)), '乙巳');
    });

    test('Test getTwoHourPeriods', () {
      final List<String> list = [];
      final expectList = [
        '子',
        '丑',
        '丑',
        '寅',
        '寅',
        '卯',
        '卯',
        '辰',
        '辰',
        '巳',
        '巳',
        '午',
        '午',
        '未',
        '未',
        '申',
        '申',
        '酉',
        '酉',
        '戌',
        '戌',
        '亥',
        '亥',
        '子'
      ];
      for (int i = 0; i < 24; i++) {
        list.add(getTwoHourPeriods(hour: i));
      }
      expect(list, expectList);
    });

    test('Test getWeekDayCN', () {
      expect(getWeekDayCN(DateTime(2023, 6, 4)), '星期日');

      expect(getWeekDayCN(DateTime(2023, 6, 6)), '星期二');
    });

    test('Test getPhaseOfMoon', () {
      final List<String> list = [];
      for (var i = 1; i <= 30; i++) {
        list.add(getPhaseOfMoon(lunarDay: i).getValue(false));
      }

      final List<String> expectList = [
        '朔',
        '上蛾眉月',
        '上蛾眉月',
        '上蛾眉月',
        '上蛾眉月',
        '上蛾眉月',
        '上弦月',
        '上弦月',
        '渐盈凸月',
        '渐盈凸月',
        '渐盈凸月',
        '渐盈凸月',
        '渐盈凸月',
        '渐盈凸月',
        '望',
        '渐亏凸月',
        '渐亏凸月',
        '渐亏凸月',
        '渐亏凸月',
        '渐亏凸月',
        '渐亏凸月',
        '下弦月',
        '下弦月',
        '下蛾眉月',
        '下蛾眉月',
        '下蛾眉月',
        '下蛾眉月',
        '下蛾眉月',
        '下蛾眉月',
        '晦'
      ];
      expect(list, expectList);
    });
  });
}
