import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar(dateTime: DateTime(2023, 6, 6));
  print('2023年6月6日');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.year}, ${lunarCalendar.lunarDate.month}, ${lunarCalendar.lunarDate.day}, 闰月：${lunarCalendar.lunarDate.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
}
