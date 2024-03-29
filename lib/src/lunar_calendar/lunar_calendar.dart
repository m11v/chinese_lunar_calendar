import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

class LunarCalendar extends Equatable {
  /// UTC 时间
  final DateTime _utc;

  /// true: 使用中国标准时间计算; false: 使用本地时间计算
  final bool useCSTToCalculate;

  /// 阴历日期
  LunarDate get lunarDate => getLunarDate(dateTime);

  LunarCalendar({
    required DateTime utcDateTime,
    bool useCSTToCalculateLunarDate = false,
    bool isSimplifiedCN = true,
  })  : useCSTToCalculate = useCSTToCalculateLunarDate,
        _utc = utcDateTime {
    Loc.create(isSimplifiedCN: isSimplifiedCN);
  }

  @override
  List<Object?> get props => [_utc, useCSTToCalculate];
}

extension LunarCalendarTime on LunarCalendar {
  /// 本地时间
  DateTime get localTime {
    return _utc.toLocal();
  }

  /// 中国标准时间
  DateTime get cst {
    return utcToCST(utc: _utc);
  }

  /// 计算用时间
  DateTime get dateTime => useCSTToCalculate ? cst : localTime;
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  /// DateTime春节日期
  DateTime get chineseNewYear => getChineseNewYear(dateTime.year);

  /// 汉字春节日期
  String get chineseNewYearString {
    return '${chineseNewYear.year}${Loc.get().nian}${chineseNewYear.month}${Loc.get().yue}${chineseNewYear.day}${Loc.get().ri}';
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
}

/// 八字相关扩展
extension LunarCalendar8Char on LunarCalendar {
  /// 年干支
  String get year8Char => getYear8CharFromDateTime(dateTime: dateTime);

  /// 月干支
  String get month8Char => getLunarMonth8Char(
      dateTime: dateTime, useCSTToCalculate: useCSTToCalculate);

  /// 日干支
  String get day8Char => getDay8Char(dateTime: dateTime);

  /// 时干支
  String get twoHour8Char => getTwoHour8Char(dateTime: dateTime);

  /// 八字
  String get eightChar => '$year8Char $month8Char $day8Char $twoHour8Char';
}

/// 时辰相关扩展
extension LunarCalendarTwoHourPeriod on LunarCalendar {
  /// 时辰
  TwoHourPeriod get twoHourPeriod => TwoHourPeriod.from(dateTime: dateTime);

  /// 本日时辰列表
  List<TwoHourPeriod> get twoHourPeriodList => getTwoHourPeriodList(dateTime);
}

extension LunarCalendarX on LunarCalendar {
  /// 汉字星期
  String get weekDayCN => getWeekDayCN(dateTime);

  /// 月相
  String get phaseOfMoon => getPhaseOfMoon(lunarDay: lunarDate.day);
}
