import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar(
    utcDateTime: DateTime(2024, 2, 6, 10, 30).toUtc(),
  );

  print('中国标准时间：${lunarCalendar.cst}');
  print('本地时间：${lunarCalendar.localTime}');
  print(lunarCalendar.useCSTToCalculate ? '使用中国标准时间计算：' : '使用本地时间计算');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print('生肖: ${lunarCalendar.zodiac}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.lunarYear.number}, ${lunarCalendar.lunarDate.lunarMonth.number}, ${lunarCalendar.lunarDate.lunarDay}, 闰月：${lunarCalendar.lunarDate.lunarMonth.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
  print('八字: ${lunarCalendar.eightChar}');
  print('星期：${lunarCalendar.weekDayCN}');
  print('月相：${lunarCalendar.phaseOfMoon}');
  print('本年节气: ${getSolarTerms(lunarCalendar.dateTime.year)}');
  print('本日节气：${lunarCalendar.dateTime.getSolarTerm()}');
  print(
      '当前时辰：${lunarCalendar.twoHourPeriod.steamName}${lunarCalendar.twoHourPeriod.name}${lunarCalendar.twoHourPeriod.ke.name}');

  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
          '${e.twoHourPeriodIndex}: ${e.nameInTheDay} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  print('本日时辰：$twoHourPeriodsString');
}
