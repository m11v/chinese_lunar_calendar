import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试生肖', () {
    group('2024年立春（2024年2月4日16时27分）在大年初一（2024年2月10日）之前', () {
      group('生肖以农历初一起始时', () {
        test('2024年2月2日(立春之前，大年初一之前）的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 2).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2024年2月6日（立春之后，大年初一之前）的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 6).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2024年2月11日（立春之后，大年初一之后）的生肖是龙', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2024, 2, 11).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '龙');
        });
      });

      group('生肖以立春起始时', () {
        test('2024年2月2日（立春之前，大年初一之前）的生肖是兔', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2024, 2, 2).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2024年2月6日（立春之后，大年初一之前）的生肖是龙', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2024, 2, 6).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '龙');
        });

        test('2024年2月11日（立春之后，大年初一之后）的生肖是龙', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2024, 2, 11).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '龙');
        });
      });
    });

    group('2023年立春（2023年2月4日10时43分）在大年初一（2023年1月22日）之后', () {
      group('生肖以农历初一起始时', () {
        test('2023年1月20日（大年初一之前，立春之前）的生肖是虎', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 20).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '虎');
        });

        test('2023年1月23日（大年初一之后，立春之前）的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 1, 23).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });

        test('2023年2月6日（大年初一之后，立春之后）的生肖是兔', () {
          final lunarCalendar =
              LunarCalendar(utcDateTime: DateTime(2023, 2, 6).toUtc());
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '兔');
        });
      });

      group('生肖以立春起始时', () {
        test('2023年1月20日（大年初一之前，立春之前）的生肖是虎', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2023, 1, 20).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '虎');
        });

        test('2023年1月23日（大年初一之后，立春之前）的生肖是虎', () {
          final lunarCalendar = LunarCalendar(
            utcDateTime: DateTime(2023, 1, 23).toUtc(),
            startZodiacFromLiChun: true,
          );
          final zodiac = lunarCalendar.zodiac;
          expect(zodiac.name.sValue, '虎');
        });

        test('2023年2月5日（大年初一之后，立春之后）的生肖是兔', () {
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
