import 'dart:math';

import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';

import '../constants/cn_text.dart';
import 'calculation_8_char.dart';

/// 计算汉字星期
String getWeekDayCN(DateTime date) => weekDayCN[date.weekday - 1];

/// 根据阳历年份查表计算春节日期
/// 返回的是当地时间
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
LunarDate getLunarDate({
  required DateTime localTime,
}) {
  /// 获取当前日期与当年春节的差日
  final newYear = getChineseNewYear(localTime.year).toLocal();
  int spanDays = localTime.daysBetween(fromDate: newYear);
  LunarYear lunarYear;
  if (spanDays >= 0) {
    /// 如果春节已过, 那么阴历年和阳历年是同一年
    final year = localTime.year;
    lunarYear = getLunarYear(year);
  } else {
    /// 如果春节未过，那么阴历年是阳历年的前一年
    final year = localTime.year - 1;
    lunarYear = getLunarYear(year);
    spanDays = lunarYear.days + spanDays;
  }
  return lunarYear.getXthDay(spanDays);
}

/// 计算当日吉时
/// true 为吉，false 为凶
List<bool> getTwoHourPeriodLuckyList(DateTime dateTime) {
  /// 计算日干支
  final day8Char = getDay8Char(localTime: dateTime.toLocal());

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
