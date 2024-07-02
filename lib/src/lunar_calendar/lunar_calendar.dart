import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../constants/cn_text.dart';
import '../utils/calculation_2_hour_period.dart';
import '../utils/calculation_8_char.dart';

class LunarCalendar extends Equatable {
  /// UTC 时间
  final DateTime utc;

  /// true: 生肖从立春开始; false: 生肖从农历初一开始
  final bool startZodiacFromLiChun;

  /// 阴历日期
  late final LunarDate lunarDate;

  /// 本地大年初一（春节）日期
  late final DateTime chineseNewYear;

  /// 以立春为一年之始时，调整后的阴历年份
  late final int adjustedLunarYearByLichun;

  /// 生肖
  late final Zodiac zodiac;

  LunarCalendar._internal({
    required this.utc,
    required this.startZodiacFromLiChun,
  });

  factory LunarCalendar.from({
    required DateTime utcDateTime,
    startZodiacFromLiChun = false,
  }) {
    final localTime = utcDateTime.toLocal();
    final chineseNewYear = getChineseNewYear(localTime.year);
    final lunarDate = LunarDate.fromDateTime(localTime: localTime);
    final adjustedLunarYearByLichun = _getAdjustedLunarYearNumberByLiChun(
        localTime: localTime,
        chineseNewYear: chineseNewYear,
        lunarYearNumber: lunarDate.lunarYear.number);

    final zodiacYearNumber = startZodiacFromLiChun
        ? adjustedLunarYearByLichun
        : lunarDate.lunarYear.number;
    final zodiac = zodiacList[(zodiacYearNumber - 4) % 12];

    return LunarCalendar._internal(
      utc: utcDateTime,
      startZodiacFromLiChun: startZodiacFromLiChun,
    )
      ..lunarDate = lunarDate
      ..chineseNewYear = chineseNewYear
      ..adjustedLunarYearByLichun = adjustedLunarYearByLichun
      ..zodiac = zodiac;
  }

  @override
  List<Object?> get props => [
        utc,
        startZodiacFromLiChun,
        lunarDate,
        chineseNewYear,
      ];
}

/// 本程序遵循通用标准，以正月初一零时零分作为农历年的交替时刻
/// 参见：https://www.hko.gov.hk/sc/%E5%A4%A9%E6%B0%94%E9%9A%8F%E7%AC%94/101852/%E5%86%9C%E5%8E%86%E5%B9%B4%E7%9A%84%E5%B9%B2%E6%94%AF%E4%BA%A4%E6%9B%BF
/// 然而在计算月干支及生肖时，需要以立春为一年之始时，调整后的阴历年份作为参数。
int _getAdjustedLunarYearNumberByLiChun({
  required DateTime localTime,
  required DateTime chineseNewYear,
  required int lunarYearNumber,
}) {
  final local = localTime.millisecondsSinceEpoch;
  final localLichun = localTime.lichun.local.millisecondsSinceEpoch;
  final localChuyi = chineseNewYear.millisecondsSinceEpoch;

  int adjustedYear = lunarYearNumber;

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

extension LunarCalendarTime on LunarCalendar {
  /// 本地时间
  DateTime get localTime {
    return utc.toLocal();
  }

  /// 中国标准时间
  DateTime get cst {
    return utcToCST(utc: utc);
  }
}

extension LunarCalendarChineseNewYear on LunarCalendar {
  /// 汉字春节日期
  String get chineseNewYearString {
    return '${chineseNewYear.year}$nian${chineseNewYear.month}$yue${chineseNewYear.day}$ri';
  }
}

/// 八字相关扩展
extension LunarCalendar8Char on LunarCalendar {
  /// 年干支
  String get year8Char => getYear8CharFromLunarCalendar(lunarCalendar: this);

  /// 月干支
  String get month8Char => getMonth8CharFromLunarCalendar(lunarCalendar: this);

  /// 日干支
  String get day8Char => getDay8CharFromLunarCalendar(lunarCalendar: this);

  /// 时干支
  String get twoHour8Char =>
      getTwoHour8CharFromLunarCalendar(lunaCalendar: this);

  /// 八字
  String get eightChar => '$year8Char $month8Char $day8Char $twoHour8Char';
}

/// 时辰相关扩展
extension LunarCalendarTwoHourPeriod on LunarCalendar {
  /// 时辰
  TwoHourPeriod get twoHourPeriod => TwoHourPeriod.from(dateTime: localTime);

  /// 本日时辰列表
  List<TwoHourPeriod> get twoHourPeriodList => getTwoHourPeriodList(localTime);

  /// 时辰吉凶列表
  List<bool> get twoHourPeriodLuckyList =>
      getTwoHourPeriodLuckyList(day8Char: day8Char);
}

extension LunarCalendarX on LunarCalendar {
  /// 汉字星期
  String get weekDayCN => getWeekDayCN(localTime);

  /// 月相
  Located get phaseOfMoon => getPhaseOfMoon(lunarDay: lunarDate.lunarDay);
}
