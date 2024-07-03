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
