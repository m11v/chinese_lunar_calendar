import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../constants/cn_text.dart';

class LunarCalendar extends Equatable {
  /// UTC 时间
  final DateTime _utc;

  /// true: 使用中国标准时间计算; false: 使用本地时间计算
  final bool useCSTToCalculate;

  /// true: 生肖从立春开始; false: 生肖从农历初一开始
  final bool startZodiacFromLiChun;

  /// 阴历日期
  LunarDate get lunarDate => getLunarDate(dateTime);

  LunarCalendar({
    required DateTime utcDateTime,
    bool useCSTToCalculateLunarDate = false,
    this.startZodiacFromLiChun = false,
  })  : useCSTToCalculate = useCSTToCalculateLunarDate,
        _utc = utcDateTime;

  @override
  List<Object?> get props => [
        _utc,
        useCSTToCalculate,
        startZodiacFromLiChun,
      ];
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

extension LunarCalendarAdjusted on LunarCalendar {
  /// 以立春为一年之始时，调整后的阴历年份
  int get adjustedLunarYearByLichun {
    final local = localTime.millisecondsSinceEpoch;
    final localLichun = localTime.lichun.local.millisecondsSinceEpoch;
    final localChuyi = chineseNewYear.toLocal().millisecondsSinceEpoch;

    int adjustedYear = lunarDate.lunarYear.number;

    /// 立春在初一之前
    if (localLichun < localChuyi) {
      /// 日期在立春之后，在初一之前，需要+1
      if (local < localChuyi && local > localLichun) {
        adjustedYear += 1;
      }
    } else {
      /// 立春在初一之后
      /// 日期在初一之后，立春之前，需要 -1
      if (local > localChuyi && local < localLichun) {
        adjustedYear -= 1;
      }
    }

    return adjustedYear;
  }
}

extension LunarCalendarZodiac on LunarCalendar {
  Zodiac get zodiac {
    var yearNumber = lunarDate.lunarYear.number;

    if (startZodiacFromLiChun) {
      yearNumber = adjustedLunarYearByLichun;
    }

    return zodiacList[(yearNumber - 4) % 12];
  }
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  /// 本地大年初一（春节）日期
  DateTime get chineseNewYear => getChineseNewYear(localTime.year);

  /// 汉字春节日期
  String get chineseNewYearString {
    return '${chineseNewYear.year}$nian${chineseNewYear.month}$yue${chineseNewYear.day}$ri';
  }
}

/// 八字相关扩展
extension LunarCalendar8Char on LunarCalendar {
  /// 年干支
  String get year8Char => getYear8Char(lunarYear: lunarDate.lunarYear.number);

  /// 月干支
  String get month8Char => getMonth8Char(lunarCalendar: this);

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
  Located get phaseOfMoon => getPhaseOfMoon(lunarDay: lunarDate.lunarDay);
}
