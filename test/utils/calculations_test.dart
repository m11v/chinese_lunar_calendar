import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/utils/calculation_8_char.dart';
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

    test('Test getLunarYear8Char', () {
      expect(getYear8Char(lunarYear: 2023), '癸卯');
      expect(getYear8Char(lunarYear: 1970), '庚戌');
    });

    test('Test getDay8Char', () {
      expect(getDay8Char(localTime: DateTime(2023, 6, 24)), '癸丑');
      expect(getDay8Char(localTime: DateTime(2010, 6, 24)), '乙巳');
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
