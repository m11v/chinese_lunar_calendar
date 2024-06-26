import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试以立春为始时，调整后的阴历年份', () {
    group('2024年立春（2024年2月4日16时27分）在大年初一（2024年2月10日）之前', () {
      test(
          '2024年2月2日(立春之前，大年初一之前）的lunarYear是2023，adjustedLunarYearByLichun是2023',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2024, 2, 2).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2023);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2023);
      });

      test(
          '2024年2月6日（立春之后，大年初一之前）的lunarYear是2023，adjustedLunarYearByLichun是2024',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2024, 2, 6).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2023);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2024);
      });

      test(
          '2024年2月11日（立春之后，大年初一之后）的lunarYear是2024，adjustedLunarYearByLichun是2024',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2024, 2, 11).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2024);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2024);
      });
    });

    group('2023年立春（2023年2月4日10时43分）在大年初一（2023年1月22日）之后', () {
      test(
          '2023年1月20日（大年初一之前，立春之前）的lunarYear是2022，adjustedLunarYearByLichun是2022',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2023, 1, 20).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2022);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2022);
      });

      test(
          '2023年1月23日（大年初一之后，立春之前）的lunarYear是2023，adjustedLunarYearByLichun是2022',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2023, 1, 23).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2023);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2022);
      });

      test(
          '2023年2月6日（大年初一之后，立春之后）的lunarYear是2023，adjustedLunarYearByLichun是2023',
          () {
        final lunarCalendar =
            LunarCalendar(utcDateTime: DateTime(2023, 2, 6).toUtc());
        expect(lunarCalendar.lunarDate.lunarYear.number, 2023);
        expect(lunarCalendar.adjustedLunarYearByLichun, 2023);
      });
    });
  });
}
