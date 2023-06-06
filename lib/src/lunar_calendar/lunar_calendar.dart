import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

class LunarCalendar extends Equatable {
  final DateTime _dateTime;

  LunarCalendar({DateTime? dateTime}) : _dateTime = dateTime ?? DateTime.now();

  @override
  List<Object?> get props => [_dateTime];
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  DateTime get chineseNewYear => getChineseNewYear(_dateTime.year);

  String get chineseNewYearString {
    return '${chineseNewYear.year} 年 ${chineseNewYear.month} 月 ${chineseNewYear.day} 日';
  }
}
