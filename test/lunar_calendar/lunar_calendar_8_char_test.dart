import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试八字', () {
    group('2024年立春（2024年2月4日16时27分）在大年初一（2024年2月10日）之前', () {
      group('八字以农历初一起始时', () {
        test('2024年2月2日(立春之前，大年初一之前）的年月日八字是癸卯乙丑丙申', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 2).toUtc());
          expect(lunarCalendar.year8Char, '癸卯');
          expect(lunarCalendar.month8Char, '乙丑');
          expect(lunarCalendar.day8Char, '丙申');
        });

        test('2024年2月6日（立春之后，大年初一之前）的年月日八字是癸卯丙寅庚子', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 6).toUtc());
          expect(lunarCalendar.year8Char, '癸卯');
          expect(lunarCalendar.month8Char, '丙寅');
          expect(lunarCalendar.day8Char, '庚子');
        });

        test('2024年2月11日（立春之后，大年初一之后）的年月日八字是甲辰丙寅乙巳', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 11).toUtc());
          expect(lunarCalendar.year8Char, '甲辰');
          expect(lunarCalendar.month8Char, '丙寅');
          expect(lunarCalendar.day8Char, '乙巳');
        });
      });
    });

    group('2023年立春（2023年2月4日10时43分）在大年初一（2023年1月22日）之后', () {
      group('生肖以农历初一起始时', () {
        test('2023年1月20日（大年初一之前，立春之前）的年月日八字是壬寅癸丑戊寅', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 20).toUtc());
          expect(lunarCalendar.year8Char, '壬寅');
          expect(lunarCalendar.month8Char, '癸丑');
          expect(lunarCalendar.day8Char, '戊寅');
        });

        test('2023年1月23日（大年初一之后，立春之前）的年月日八字是癸卯癸丑辛巳', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 23).toUtc());
          expect(lunarCalendar.year8Char, '癸卯');
          expect(lunarCalendar.month8Char, '癸丑');
          expect(lunarCalendar.day8Char, '辛巳');
        });

        test('2023年2月6日（大年初一之后，立春之后）的年月日八字是癸卯甲寅乙未', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 2, 6).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(lunarCalendar.year8Char, '癸卯');
          expect(lunarCalendar.month8Char, '甲寅');
          expect(lunarCalendar.day8Char, '乙未');
        });
      });
    });
  });
}
