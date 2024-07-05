import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';


/// 阴历日期
class LunarDate extends Equatable {
  /// 阴历年
  final LunarYear lunarYear;

  /// 阴历月
  final LunarMonth lunarMonth;

  /// 阴历日
  final int lunarDay;

  const LunarDate({
    required this.lunarYear,
    required this.lunarMonth,
    required this.lunarDay,
  });

  /// 阳历日转换成阴历日
  /// 根据春节日期计算当前日期与大年初一的差值x，所求日期即LunarYear的第x天
  factory LunarDate.fromDateTime({
    required DateTime localTime,
  }) {
    /// 获取当前日期与当年春节的差日
    final newYear = getChineseNewYear(localTime.year).toLocal();
    int spanDays = localTime.daysBetween(fromDate: newYear);
    LunarYear lunarYear;
    if (spanDays >= 0) {
      /// 如果春节已过, 那么阴历年和阳历年是同一年
      final year = localTime.year;
      lunarYear = LunarYear.fromYear(lunarYearNumber: year);
    } else {
      /// 如果春节未过，那么阴历年是阳历年的前一年
      final year = localTime.year - 1;
      lunarYear = LunarYear.fromYear(lunarYearNumber: year);
      spanDays = lunarYear.days + spanDays;
    }
    return LunarDate.fromLunarYear(
      lunarYear: lunarYear,
      xthDay: spanDays,
    );
  }

  /// 阴历年的第X天LunarDate
  factory LunarDate.fromLunarYear({
    required LunarYear lunarYear,
    required int xthDay,
  }) {
    if (xthDay > lunarYear.days) {
      throw InvalidLunarDateException.fromXthDayInLunarYear(
          xthDay: xthDay, lunarYear: lunarYear);
    }

    int spanDays = xthDay;
    for (var i = 0; i < lunarYear.monthsCount; i++) {
      final currentMonth = lunarYear.lunarMonths[i];
      if (spanDays < currentMonth.days) {
        return LunarDate(
          lunarYear: lunarYear,
          lunarMonth: currentMonth,
          lunarDay: spanDays + 1,
        );
      } else {
        spanDays = spanDays - currentMonth.days;
      }
    }

    throw InvalidLunarDateException.fromXthDayInLunarYear(
        xthDay: xthDay, lunarYear: lunarYear);
  }

  @override
  List<Object?> get props => [
        lunarYear,
        lunarMonth,
        lunarDay,
      ];
}

extension LunarDateMoonPhase on LunarDate {
  /// 根据阴历日计算月相
  MoonPhase get moonPhase {
    int index;
    if (lunarDay == 1) {
      index = 0;
    } else if (2 <= lunarDay && lunarDay <= 6) {
      index = 1;
    } else if (7 <= lunarDay && lunarDay <= 8) {
      index = 2;
    } else if (9 <= lunarDay && lunarDay <= 14) {
      index = 3;
    } else if (lunarDay == 15) {
      index = 4;
    } else if (16 <= lunarDay && lunarDay <= 21) {
      index = 5;
    } else if (22 <= lunarDay && lunarDay <= 23) {
      index = 6;
    } else if (24 <= lunarDay && lunarDay <= 29) {
      index = 7;
    } else {
      index = 8;
    }
    return MoonPhase(
      lunarDay: lunarDay,
      index: index,
      name: phaseOfMoon[index],
    );
  }
}

extension LunarDateCN on LunarDate {
  /// 汉字阴历年
  String get lunarYearCN =>
      lunarYear.number.digits.map((e) => upperCNNum[e]).toList().join();

  /// 闰月前缀
  Located get leapMonthPrefix => lunarMonth.isLeapMonth ? run : Located.empty;

  /// 大小月后缀
  String get monthLengthSuffix => lunarMonth.isLongMonth ? da : xiao;

  /// 汉字阴历月
  Located get lunarMonthCN => lunarMonthNameList[lunarMonth.number - 1];

  /// 汉字阴历日
  String get lunarDayCN => lunarDayNameList[lunarDay - 1];

  /// 汉字阴历日期
  String get fullCNString {
    return '$lunarYearCN$nian $leapMonthPrefix$lunarMonthCN$monthLengthSuffix$lunarDayCN';
  }
}

class InvalidLunarDateException implements Exception {
  final String reason;

  const InvalidLunarDateException({required this.reason});

  factory InvalidLunarDateException.fromXthDayInLunarYear({
    required int xthDay,
    required LunarYear lunarYear,
  }) {
    return InvalidLunarDateException(
        reason: 'Try to create LunarDate from the $xthDay day in $lunarYear.');
  }
}
