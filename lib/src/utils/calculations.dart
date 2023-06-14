import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';
import 'package:chinese_lunar_calendar/src/constants/solar_terms.dart';
import 'package:chinese_lunar_calendar/src/lunar_calendar/models/solar_term.dart';

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

// 获取当年节气
List<SolarTerm> getSolarTerms(int year) {
  return solarTermsTimeByYear['$year'] ?? List.empty();
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

// 根据阴历日计算月相
String getPhaseOfMoon({required int lunarDay}) {
  if (lunarDay == 1) {
    return phaseOfMoon[0];
  } else if (2 <= lunarDay && lunarDay <= 6) {
    return phaseOfMoon[1];
  } else if (7 <= lunarDay && lunarDay <= 8) {
    return phaseOfMoon[2];
  } else if (9 <= lunarDay && lunarDay <= 14) {
    return phaseOfMoon[3];
  } else if (lunarDay == 15) {
    return phaseOfMoon[4];
  } else if (16 <= lunarDay && lunarDay <= 21) {
    return phaseOfMoon[5];
  } else if (22 <= lunarDay && lunarDay <= 23) {
    return phaseOfMoon[6];
  } else if (24 <= lunarDay && lunarDay <= 29) {
    return phaseOfMoon[7];
  } else {
    return phaseOfMoon[8];
  }
}
