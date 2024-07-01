import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';

import '../constants/cn_text.dart';

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
