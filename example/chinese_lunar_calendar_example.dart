import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar(dateTime: DateTime(2023, 6, 6));
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print('阴历: ${lunarCalendar.lunarDate}');
}
