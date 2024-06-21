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
    return '$lunarYearCN[${lunarYear.zodiac}]$nian $leapMonthPrefix$lunarMonthCN$monthLengthSuffix$lunarDayCN';
  }
}
