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

  return LunarYear(year: year, months: lunarMonthList);
}

LunarDate getLunarDate(DateTime date) {
  // 获取当前日期与当年春节的差日
  final newYear = getChineseNewYear(date.year).toUtc();
  int spanDays = date.daysBetween(fromDate: newYear);
  if (spanDays >= 0) {
    // 如果春节已过, 那么阴历年和阳历年是同一年
    final year = date.year;
    final lunarMonthList = getLunarYear(year).months;
    for (var i = 0; i < lunarMonthList.length; i++) {
      if (spanDays < lunarMonthList[i].days) {
        return LunarDate(
            year: year,
            month: lunarMonthList[i].index,
            day: spanDays + 1,
            isLeapMonth: lunarMonthList[i].isLeapMonth);
      } else {
        spanDays = spanDays - lunarMonthList[i].days;
      }
    }
    return LunarDate.empty;
  } else {
    // 如果春节未过，那么阴历年是阳历年的前一年
    final year = date.year - 1;
    final lunarYear = getLunarYear(year);
    final lunarMonthList = getLunarYear(year).months;
    spanDays = lunarYear.days + spanDays;
    for (var i = 0; i < lunarMonthList.length; i++) {
      if (spanDays < lunarMonthList[i].days) {
        return LunarDate(
            year: year,
            month: lunarMonthList[i].index,
            day: spanDays + 1,
            isLeapMonth: lunarMonthList[i].isLeapMonth);
      } else {
        spanDays = spanDays - lunarMonthList[i].days;
      }
    }
  }
  return LunarDate.empty;
}
