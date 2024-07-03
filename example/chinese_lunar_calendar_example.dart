import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar.from(
    utcDateTime: DateTime(2024, 2, 6, 10, 30).toUtc(),
  );

  print('中国标准时间：${lunarCalendar.cst}');
  print('本地时间：${lunarCalendar.localTime}');
  print('使用本地时间计算');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print('生肖: ${lunarCalendar.zodiac}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.lunarYear.number}, ${lunarCalendar.lunarDate.lunarMonth.number}, ${lunarCalendar.lunarDate.lunarDay}, 闰月：${lunarCalendar.lunarDate.lunarMonth.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
  print('八字: ${lunarCalendar.eightChar}');
  print('星期：${lunarCalendar.weekday.name}');
  print('月相：${lunarCalendar.phaseOfMoon}');
  print('本年节气: ${getSolarTerms(lunarCalendar.localTime.year)}');
  print('本日节气：${lunarCalendar.localTime.getSolarTerm()}');
  print(
      '当前时辰：${lunarCalendar.twoHourPeriod.steamName}${lunarCalendar.twoHourPeriod.branchName}${lunarCalendar.ke.fullName}');

  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
          '${e.twoHourPeriodIndex}: ${e.name} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  print('本日时辰：$twoHourPeriodsString');
}
