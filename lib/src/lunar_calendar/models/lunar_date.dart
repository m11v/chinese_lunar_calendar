import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../../constants/cn_text.dart';

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

  static const empty = LunarDate(
    lunarYear: LunarYear.empty,
    lunarMonth: LunarMonth.empty,
    lunarDay: 0,
  );

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
      lunarYear = getLunarYear(year);
    } else {
      /// 如果春节未过，那么阴历年是阳历年的前一年
      final year = localTime.year - 1;
      lunarYear = getLunarYear(year);
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
      return LunarDate.empty;
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
    return LunarDate.empty;
  }

  @override
  List<Object?> get props => [
        lunarYear,
        lunarMonth,
        lunarDay,
      ];
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
