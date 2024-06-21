import 'dart:math';

import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';

import '../constants/cn_text.dart';

/// 计算汉字星期
String getWeekDayCN(DateTime date) => weekDayCN[date.weekday - 1];

/// 计算春节日期
DateTime getChineseNewYear(int year) {
  final codeYear = lunarNewYearList[year - startYear];

  final month = (codeYear >> 5) & 0x3;
  final day = (codeYear >> 0) & 0x1f;
  return DateTime(year, month, day);
}

/// 阳历年转换成阴历年
LunarYear getLunarYear(int year) {
  /// 读取阴历月信息
  final tmp = lunarMonthData[year - startYear];

  /// 生成普通月
  final lunarMonthList =
      List<int>.generate(12, (index) => index + 1).map((month) {
    if ((tmp & (1 << (month - 1))) != 0) {
      return LunarMonth(number: month, days: 30, isLeapMonth: false);
    } else {
      return LunarMonth(number: month, days: 29, isLeapMonth: false);
    }
  }).toList();

  /// 检查是否有闰月：leapMonthNumber == 0 表示当年没有闰月
  final leapMonthNumber = (tmp >> leapMonthNumBit) & 0xf;
  if (leapMonthNumber != 0) {
    int leapDay = 29;

    /// 从数据中读取闰月是否有30天
    if (tmp & (1 << monthDayBit) != 0) {
      leapDay = 30;
    }

    final leapMonth =
        LunarMonth(number: leapMonthNumber, days: leapDay, isLeapMonth: true);

    /// 插入闰月。例如：闰二月在二月的后边
    lunarMonthList.insert(leapMonth.number, leapMonth);
  }

  return LunarYear(number: year, lunarMonths: lunarMonthList);
}

/// 阳历日转换成阴历日
LunarDate getLunarDate(DateTime date) {
  /// 获取当前日期与当年春节的差日
  final newYear = getChineseNewYear(date.year).toUtc();
  int spanDays = date.daysBetween(fromDate: newYear);
  LunarYear lunarYear;
  if (spanDays >= 0) {
    /// 如果春节已过, 那么阴历年和阳历年是同一年
    final year = date.year;
    lunarYear = getLunarYear(year);
  } else {
    /// 如果春节未过，那么阴历年是阳历年的前一年
    final year = date.year - 1;
    lunarYear = getLunarYear(year);
    spanDays = lunarYear.days + spanDays;
  }
  return lunarYear.getXthDay(spanDays);
}

/// 根据阴历年份数字计算天干记年
String getYear8Char({required int lunarYear}) {
  return the10HeavenlyStemsAnd12EarthlyBranches[(lunarYear - 4) % 60];
}

/// 根据阳历日期计算天干记年
String getYear8CharFromDateTime({required DateTime dateTime}) {
  final lunarYear = getLunarYear(dateTime.year);
  return getYear8Char(lunarYear: lunarYear.number);
}

/// 获取当月的第一个节气
SolarTerm getTheFirstSolarTerm({required int year, required int month}) {
  return getSolarTerms(year)[(month - 1) * 2];
}

/// 计算月干支
String getLunarMonth8Char(
    {required DateTime dateTime, required bool useCSTToCalculate}) {
  /// 当月节气日期
  final solarTermDate =
      getTheFirstSolarTerm(year: dateTime.year, month: dateTime.month)
          .getTime(useCSTToCalculate: useCSTToCalculate);

  /// 当月节气的日子
  final primarySolarTermDay = solarTermDate.day;

  /// 阴历年
  final lunarYear = getLunarYear(dateTime.year).number;

  int adjustedLunarYear = lunarYear;

  /// 从立春开始算阴历年，立春之前算上一年
  final lichunDay = getTheFirstSolarTerm(year: dateTime.year, month: 2)
      .getTime(useCSTToCalculate: useCSTToCalculate)
      .day;
  if ((dateTime.month < 2) ||
      (dateTime.month == 2 && dateTime.day < lichunDay)) {
    adjustedLunarYear = adjustedLunarYear - 1;
  }

  int adjustedMonth;

  /// 从立春开始算1月，因此小寒是12月，惊蛰是2月，清明是3月，等等，即节气月-1
  /// 如果这个月的节之前的日子不算在这个月，而是算在上一个月，即节气月-2
  if (dateTime.day >= primarySolarTermDay) {
    adjustedMonth = solarTermDate.month - 1;
  } else {
    adjustedMonth = solarTermDate.month - 2;
  }
  if (adjustedMonth <= 0) {
    adjustedMonth = 12 + adjustedMonth;
  }

  /// 从年干计算月干
  final yearStem = getYear8Char(lunarYear: adjustedLunarYear).substring(0, 1);
  final monthStem =
      yearStemToMonthStemChart[yearStem]?[adjustedMonth - 1] ?? '';

  /// 计算月支
  final monthBranch = the12EarthlyBranches[(adjustedMonth + 1) % 12];

  return '$monthStem$monthBranch';
}

/// 计算日干支
String getDay8Char({required DateTime dateTime}) {
  /// 2023年5月6日的日干支是“甲子”
  DateTime start = DateTime(2023, 5, 6);
  int days = dateTime.daysBetween(fromDate: start);
  days = days % 60;
  if (days < 0) {
    days = 60 - days;
  }
  return the10HeavenlyStemsAnd12EarthlyBranches[days];
}

int _getTwoHourPeriodsIndex({required int hour}) {
  int index = ((hour + 1) / 2).floor();
  if (index == 12) {
    index = 0;
  }
  return index;
}

/// 计算时辰
String getTwoHourPeriods({required int hour}) {
  return the12EarthlyBranches[_getTwoHourPeriodsIndex(hour: hour)];
}

/// 计算时干支
String getTwoHour8Char({required DateTime dateTime}) {
  // 计算时支
  final twoHourBranch = getTwoHourPeriods(hour: dateTime.hour);

  /// 用日干和日干时干转换表计算时干
  final dayStem = getDay8Char(dateTime: dateTime).substring(0, 1);
  final twoHourStem = dayStemToTwoHoursStemChart[dayStem]
          ?[_getTwoHourPeriodsIndex(hour: dateTime.hour)] ??
      '';

  return '$twoHourStem$twoHourBranch';
}

/// 计算当日吉时
/// true 为吉，false 为凶
List<bool> getTwoHourPeriodLuckyList(DateTime dateTime) {
  /// 计算日干支
  final day8Char = getDay8Char(dateTime: dateTime);

  /// 计算日干支在天干地支表中的序号
  final day8CharIndex = the10HeavenlyStemsAnd12EarthlyBranches
      .indexWhere((element) => element == day8Char);

  /// 查询时辰吉凶时间表
  final seed = twoHourPeriodLuckyTimeList[day8CharIndex];

  /// 根据查询到的时辰吉凶时间计算
  final List<bool> list = [];
  for (int i = 1; i < 13; i++) {
    var s = true;
    if ((seed & pow(2, (12 - i)).toInt()) > 0) {
      s = false;
    }
    list.add(s);
  }
  return list;
}

/// 计算时辰序号
int getTwoHourPeriodIndex(int hour) {
  return (hour / 2).floor();
}

/// 计算当日时辰列表
List<TwoHourPeriod> getTwoHourPeriodList(DateTime dateTime) {
  List<TwoHourPeriod> res = [];

  for (int hour = 0; hour < 24; hour += 2) {
    res.add(TwoHourPeriod.from(
        dateTime: DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      hour,
    )));
  }
  return res;
}

/// 根据阴历日计算月相
Located getPhaseOfMoon({required int lunarDay}) {
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
