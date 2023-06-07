import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar(dateTime: DateTime(2023, 6, 6));
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print('阴历数字: ${lunarCalendar.lunarDate}');
  print('农历: ${lunarCalendar.lunarDate.fullCNString}');
}
