import 'package:chinese_lunar_calendar/src/solar_term/solar_term.dart';
import 'package:chinese_lunar_calendar/src/utils/extensions.dart';

import '../constants/cn_text.dart';
import '../lunar_calendar/lunar_calendar.dart';
import 'calculation_2_hour_period.dart';

/// 根据阴历年份数字计算年干支
String getYear8Char({
  required int lunarYear,
}) {
  return the10HeavenlyStemsAnd12EarthlyBranches[(lunarYear - 4) % 60];
}

/// 根据LunarCalendar计算年干支
String getYear8CharFromLunarCalendar({
  required LunarCalendar lunarCalendar,
}) {
  return getYear8Char(
    lunarYear: lunarCalendar.lunarDate.lunarYear.number,
  );
}

/// 根据阳历日期计算年干支
String getYear8CharFromDateTime({
  required DateTime dateTime,
}) {
  return getYear8CharFromLunarCalendar(
      lunarCalendar: LunarCalendar.from(
    utcDateTime: dateTime.toUtc(),
  ));
}

/// 根据以立春为一年之始时，调整后的阴历年份的年干支和节气计算月干支
String getMonth8Char({
  required int adjustedLunarYearByLichun,
  required DateTime localTime,
}) {
  /// 以立春为一年之始调整后的阴历年份，得到年干
  final yearStem =
      getYear8Char(lunarYear: adjustedLunarYearByLichun).substring(0, 1);

  /// 计算 adjustedMonth:
  /// 从立春开始算1月，因此小寒是12月，惊蛰是2月，清明是3月，等等，即节气所在月-1
  /// 如果这个月的节气之前的日子不算在这个月，而是算在上一个月，即节气所在月-2
  int adjustedMonth;
  final primarySolarTermDay = localTime.solarTermsInThisMonth[0].local;
  adjustedMonth = primarySolarTermDay.month - 1;
  if (localTime.millisecondsSinceEpoch <
      primarySolarTermDay.millisecondsSinceEpoch) {
    adjustedMonth -= 1;
  }
  if (adjustedMonth <= 0) {
    adjustedMonth = 12 + adjustedMonth;
  }

  /// 从年干查询表格计算月干
  final monthStem =
      yearStemToMonthStemChart[yearStem]?[adjustedMonth - 1] ?? '';

  /// 计算月支
  final monthBranch = the12EarthlyBranches[(adjustedMonth + 1) % 12];

  return '$monthStem$monthBranch';
}

/// 根据LunarCalendar计算月干支
String getMonth8CharFromLunarCalendar({
  required LunarCalendar lunarCalendar,
}) {
  return getMonth8Char(
    adjustedLunarYearByLichun: lunarCalendar.adjustedLunarYearByLichun,
    localTime: lunarCalendar.localTime,
  );
}

/// 根据DateTime计算月干支
String getMonth8CharFromDateTime({
  required DateTime dateTime,
}) {
  return getMonth8CharFromLunarCalendar(
    lunarCalendar: LunarCalendar.from(
      utcDateTime: dateTime.toUtc(),
    ),
  );
}

/// 根据当前时间与已知时间的差值，查表计算日干支
String getDay8Char({
  required DateTime localTime,
}) {
  /// 2023年5月6日的日干支是“甲子”
  DateTime start = DateTime(2023, 5, 6);
  int days = localTime.daysBetween(fromDate: start);

  /// 超过23点算第二天
  if (localTime.hour >= 23) {
    days += 1;
  }
  days = days % 60;
  if (days < 0) {
    days = 60 - days;
  }

  return the10HeavenlyStemsAnd12EarthlyBranches[days];
}

/// 根据LunarCalendar计算日干支
String getDay8CharFromLunarCalendar({
  required LunarCalendar lunarCalendar,
}) {
  return getDay8Char(
    localTime: lunarCalendar.localTime,
  );
}

String _getTwoHourPeriodBranch({
  required int hour,
}) {
  return the12EarthlyBranches[getTwoHourPeriodIndex(hour: hour)];
}

/// 根据小时、分钟和日干支计算时干支
String getTwoHour8Char({
  required int hour,
  required int minute,
  required String day8Char,
}) {
  /// 计算时支
  final twoHourBranch = _getTwoHourPeriodBranch(hour: hour);

  /// 用日干和日干时干转换表计算时干
  final dayStem = day8Char[0];
  final twoHourStem = dayStemToTwoHoursStemChart[dayStem]
          ?[getTwoHourPeriodIndex(hour: hour)] ??
      '';

  return '$twoHourStem$twoHourBranch';
}

/// 根据LunarCalendar计算时干支
String getTwoHour8CharFromLunarCalendar({
  required LunarCalendar lunaCalendar,
}) {
  final localTime = lunaCalendar.localTime;
  return getTwoHour8Char(
    hour: localTime.hour,
    minute: localTime.minute,
    day8Char: lunaCalendar.day8Char,
  );
}

/// 根据DateTime计算时干支
String getTwoHour8CharFromDateTime({
  required DateTime dateTime,
}) {
  final LunarCalendar lunarCalendar =
      LunarCalendar.from(utcDateTime: dateTime.toUtc());
  return getTwoHour8CharFromLunarCalendar(lunaCalendar: lunarCalendar);
}
