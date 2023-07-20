import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar(
      utcDateTime: DateTime(2023, 6, 5, 10, 30).toUtc(), isSimplifiedCN: true);

  print('中国标准时间：${lunarCalendar.cst}');
  print('本地时间：${lunarCalendar.localTime}');
  print(lunarCalendar.useCSTToCalculate ? '使用中国标准时间计算：' : '使用本地时间计算');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.year}, ${lunarCalendar.lunarDate.month}, ${lunarCalendar.lunarDate.day}, 闰月：${lunarCalendar.lunarDate.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
  print('八字: ${lunarCalendar.eightChar}');
  print('星期：${lunarCalendar.weekDayCN}');
  print('月相：${lunarCalendar.phaseOfMoon}');
  print(
      '本年节气: ${lunarCalendar.solarTerms.values.map((value) => '${value.name}: ${value.getTime(useCSTToCalculate: lunarCalendar.useCSTToCalculate)}').toList()}');
  print('本日节气：${lunarCalendar.todaySolarTerm}');
  print(
      '当前时辰：${lunarCalendar.twoHourPeriod.steamName}${lunarCalendar.twoHourPeriod.name}${lunarCalendar.twoHourPeriod.ke.name}');

  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
          '${e.twoHourPeriodIndex}: ${e.nameInTheDay} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  print('本日时辰：$twoHourPeriodsString');
}
