import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试生肖', () {
    group('2024年立春在大年初一之前', () {
      group('生肖以农历初一起始，2024年2月10日是大年初一', () {
        test('2024年2月9日的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 9).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2024年2月10日的生肖是龙', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 10).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '龙');
        });
      });

      group('生肖以立春起始，北京时间2024年2月4日十六时二十七分立春, 立春在大年初一之前', () {
        test('2024年2月2日的生肖是兔', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2024, 2, 2).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2024年2月6日的生肖是龙', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2024, 2, 6).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '龙');
        });
      });
    });

    group('2024年立春在大年初一之后', () {
      group('生肖以农历初一起始，2023年1月22日是大年初一', () {
        test('2023年1月21日的生肖是虎', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 21).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '虎');
        });

        test('2023年1月23日的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 23).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });
      });

      group('生肖以立春起始，北京时间2023年2月4日10时43立春, 立春在大年初一之后', () {
        test('2023年2月2日的生肖是虎', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2023, 2, 2).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '虎');
        });

        test('2023年2月5日的生肖是兔', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2023, 2, 5).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });
      });
    });
  });
}
