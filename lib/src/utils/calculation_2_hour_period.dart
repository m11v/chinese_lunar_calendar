import 'dart:math';

import '../constants/cn_text.dart';
import '../constants/configs.dart';
import '../lunar_calendar/models/two_hour_period.dart';

/// 计算时辰序号
int getTwoHourPeriodIndex({
  required int hour,
}) {
  int index = ((hour + 1) / 2).floor();
  if (index == 12) {
    index = 0;
  }
  return index;
}

/// 根据日干支计算当日吉时
/// true 为吉，false 为凶
List<bool> getTwoHourPeriodLuckyList({
  required String day8Char,
}) {
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
