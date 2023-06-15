import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

class LunarCalendar extends Equatable {
  // UTC 时间
  final DateTime _utc;

  // true: 使用中国标准时间计算; false: 使用本地时间计算
  final bool useCSTToCalculate;

  // 阴历日期
  LunarDate get lunarDate => getLunarDate(dateTime);

  LunarCalendar({
    required DateTime utcDateTime,
    bool useCSTToCalculateLunarDate = false,
  })  : useCSTToCalculate = useCSTToCalculateLunarDate,
        _utc = utcDateTime;

  @override
  List<Object?> get props => [_utc, useCSTToCalculate];
}

extension LunarCalendarTime on LunarCalendar {
  // 本地时间
  DateTime get localTime {
    return _utc.toLocal();
  }

  // 中国标准时间
  DateTime get cst {
    return utcToCST(utc: _utc);
  }

  // 计算用时间
  DateTime get dateTime => useCSTToCalculate ? cst : localTime;
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  // DateTime春节日期
  DateTime get chineseNewYear => getChineseNewYear(dateTime.year);

  // 汉字春节日期
  String get chineseNewYearString {
    return '${chineseNewYear.year} 年 ${chineseNewYear.month} 月 ${chineseNewYear.day} 日';
  }
}

extension LunarCalendarSolarTerms on LunarCalendar {
  Map<String, SolarTerm> get solarTerms => {
        for (var solarTerm in getSolarTerms(dateTime.year))
          (solarTerm
              .getTime(useCSTToCalculate: useCSTToCalculate)
              .solarTermsKey): solarTerm
      };

  SolarTerm? get todaySolarTerm => solarTerms[dateTime.solarTermsKey];

  /// 使用节气修正月份：这个月的节气之前的日子不算在这个月，而是算在上一个月
  int get adjustedMonthBySolarTerm {
    /// 当月的第一个节气日期
    final primarySolarTermDate =
        getTheFirstSolarTerm(year: dateTime.year, month: dateTime.month)
            .getTime(useCSTToCalculate: useCSTToCalculate);

    /// 当月节气的日子
    final primarySolarTermDay = primarySolarTermDate.day;

    /// 从立春开始算1月，因此小寒是12月，惊蛰是2月，清明是3月，等等，即节气月-1
    /// 如果这个月的节之前的日子不算在这个月，而是算在上一个月，即节气月-2
    if (dateTime.day >= primarySolarTermDay) {
      return primarySolarTermDate.month - 1;
    } else {
      return primarySolarTermDate.month - 2;
    }
  }
}

extension LunarCalendarX on LunarCalendar {
  // 汉字星期
  String get weekDayCN => getWeekDayCN(dateTime);

  // 月相
  String get phaseOfMoon => getPhaseOfMoon(lunarDay: lunarDate.day);

  String get lunarMonth8Char => getLunarMonth8Char(
      dateTime: dateTime, useCSTToCalculate: useCSTToCalculate);
}
