import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';

DateTime getChineseNewYear(int year) {
  final codeYear = lunarNewYearList[year - startYear];

  final month = (codeYear >> 5) & 0x3;
  final day = (codeYear >> 0) & 0x1f;
  return DateTime(year, month, day);
}

LunarYear getLunarYear(int year) {
  final tmp = lunarMonthData[year - startYear];

  final lunarMonthList =
      List<int>.generate(12, (index) => index + 1).map((month) {
    if ((tmp & (1 << (month - 1))) != 0) {
      return LunarMonth(index: month, days: 30, isLeapMonth: false);
    } else {
      return LunarMonth(index: month, days: 29, isLeapMonth: false);
    }
  }).toList();

  final leapMonthIndex = (tmp >> leapMonthNumBit) & 0xf;
  if (leapMonthIndex != 0) {
    int leapDay = 29;

    if (tmp & (1 << monthDayBit) != 0) {
      leapDay = 30;
    }
    final leapMonth =
        LunarMonth(index: leapMonthIndex, days: leapDay, isLeapMonth: true);
    lunarMonthList.insert(leapMonth.index, leapMonth);
  }

  return LunarYear(months: lunarMonthList);
}
