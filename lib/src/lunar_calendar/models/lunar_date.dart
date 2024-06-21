import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../../constants/cn_text.dart';

/// 阴历日期
class LunarDate extends Equatable {
  /// 阴历年
  final LunarYear lunarYear;

  /// 阴历月
  final int lunarMonth;

  /// 阴历日
  final int lunarDay;

  /// 是否闰月
  final bool isLeapMonth;

  /// 是否大月
  final bool isLongMonth;

  const LunarDate({
    required this.lunarYear,
    required this.lunarMonth,
    required this.lunarDay,
    required this.isLeapMonth,
    required this.isLongMonth,
  });

  static const empty = LunarDate(
    lunarYear: LunarYear.empty,
    lunarMonth: 0,
    lunarDay: 0,
    isLeapMonth: false,
    isLongMonth: false,
  );

  @override
  List<Object?> get props => [
        lunarYear,
        lunarMonth,
        lunarDay,
        isLeapMonth,
        isLongMonth,
      ];
}

extension LunarDateCN on LunarDate {
  /// 汉字阴历年
  String get lunarYearCN =>
      lunarYear.number.digits.map((e) => upperCNNum[e]).toList().join();

  /// 闰月前缀
  Located get leapMonthPrefix => isLeapMonth ? run : Located.empty;

  /// 大小月后缀
  String get monthLengthSuffix => isLongMonth ? da : xiao;

  /// 汉字阴历月
  Located get lunarMonthCN => lunarMonthNameList[lunarMonth - 1];

  /// 汉字阴历日
  String get lunarDayCN => lunarDayNameList[lunarDay - 1];

  /// 干支纪年
  String get year8Char => getYear8Char(lunarYear: lunarYear.number);

  /// 生肖
  Located get zodiac => chineseZodiacNameList[(lunarYear.number - 4) % 12];

  /// 汉字阴历日期
  String get fullCNString {
    return '$lunarYearCN $year8Char[$zodiac]$nian $leapMonthPrefix$lunarMonthCN$monthLengthSuffix$lunarDayCN';
  }
}
