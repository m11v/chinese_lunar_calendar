import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';

// 计算汉字星期
String getWeekDayCN(DateTime date) => weekDayCN[date.weekday - 1];

// 计算春节日期
DateTime getChineseNewYear(int year) {
  final codeYear = lunarNewYearList[year - startYear];

  final month = (codeYear >> 5) & 0x3;
  final day = (codeYear >> 0) & 0x1f;
  return DateTime(year, month, day);
}

// 阳历年转换成阴历年
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

// 阳历日转换成阴历日
LunarDate getLunarDate(DateTime date) {
  // 获取当前日期与当年春节的差日
  final newYear = getChineseNewYear(date.year).toUtc();
  int spanDays = date.daysBetween(fromDate: newYear);
  LunarYear lunarYear;
  if (spanDays >= 0) {
    // 如果春节已过, 那么阴历年和阳历年是同一年
    final year = date.year;
    lunarYear = getLunarYear(year);
  } else {
    // 如果春节未过，那么阴历年是阳历年的前一年
    final year = date.year - 1;
    lunarYear = getLunarYear(year);
    spanDays = lunarYear.days + spanDays;
  }
  return lunarYear.getXthDay(spanDays);
}

// 计算六十天干地支
List<String> heavenlyStemsEarthlyBranches() {
  final List<String> list = [];
  for (int i = 0; i < 60; i++) {
    list.add(the10HeavenlyStems[i % 10] + the12EarthlyBranches[i % 12]);
  }
  return list;
}

// 根据阴历年计算天干记年
String getLunarYear8Char({required int lunarYear}) {
  return the10HeavenlyStemsAnd12EarthlyBranches[(lunarYear - 4) % 60];
}
