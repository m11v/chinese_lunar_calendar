import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../../constants/cn_text.dart';

/// 阴历日期
class LunarDate extends Equatable {
  /// 年
  final int year;

  /// 月
  final int month;

  /// 日
  final int day;

  /// 是否闰月
  final bool isLeapMonth;

  /// 是否大月
  final bool isLongMonth;

  const LunarDate({
    required this.year,
    required this.month,
    required this.day,
    required this.isLeapMonth,
    required this.isLongMonth,
  });

  static const empty = LunarDate(
    year: 0,
    month: 0,
    day: 0,
    isLeapMonth: false,
    isLongMonth: false,
  );

  @override
  List<Object?> get props => [
        year,
        month,
        day,
        isLeapMonth,
        isLongMonth,
      ];
}

extension LunarDateCN on LunarDate {
  /// 汉字阴历年
  String get lunarYearCN =>
      year.digits.map((e) => upperCNNum[e]).toList().join();

  /// 闰月前缀
  Located get leapMonthPrefix => isLeapMonth ? run : Located.empty;

  /// 大小月后缀
  String get monthLengthSuffix => isLongMonth ? da : xiao;

  /// 汉字阴历月
  Located get lunarMonthCN => lunarMonthNameList[month - 1];

  /// 汉字阴历日
  String get lunarDayCN => lunarDayNameList[day - 1];

  /// 干支纪年
  String get year8Char => getYear8Char(lunarYear: year);

  /// 生肖
  Located get zodiac => chineseZodiacNameList[(year - 4) % 12];

  /// 汉字阴历日期
  String get fullCNString {
    return '$lunarYearCN $year8Char[$zodiac]$nian $leapMonthPrefix$lunarMonthCN$monthLengthSuffix$lunarDayCN';
  }
}
