import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  var lunarCalendar = LunarCalendar(dateTime: DateTime(2000));
  print('春节: ${lunarCalendar.chineseNewYearString}');
}
