import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

class LunarCalendar extends Equatable {
  final DateTime _dateTime;

  // 阴历日期
  final LunarDate lunarDate;

  LunarCalendar({required DateTime dateTime})
      : _dateTime = dateTime,
        lunarDate = getLunarDate(dateTime);

  @override
  List<Object?> get props => [_dateTime];
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  // DateTime春节日期
  DateTime get chineseNewYear => getChineseNewYear(_dateTime.year);

  // 汉字春节日期
  String get chineseNewYearString {
    return '${chineseNewYear.year} 年 ${chineseNewYear.month} 月 ${chineseNewYear.day} 日';
  }
}

extension LunarCalendarSolarTerms on LunarCalendar {
  Map<String, SolarTerm> get localSolarTerms => {
        for (var solarTerm in getSolarTerms(_dateTime.year))
          solarTerm.local.solarTermsKey: solarTerm
      };

  String get todayLocalSolarTerm =>
      localSolarTerms[_dateTime.solarTermsKey]?.name ?? '无';
}

extension LunarCalendarX on LunarCalendar {
  // 汉字星期
  String get weekDayCN => getWeekDayCN(_dateTime);

  // 月相
  String get phaseOfMoon => getPhaseOfMoon(lunarDay: lunarDate.day);
}
