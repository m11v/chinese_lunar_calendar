import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

/// 阴历年
class LunarYear extends Equatable {
  /// 年份
  final int year;

  /// 月列表：有闰月时每年13个月，无闰月时每年12个月
  final List<LunarMonth> months;

  const LunarYear({
    required this.year,
    required this.months,
  });

  @override
  List<Object?> get props => [
        year,
        months,
      ];

  @override
  bool get stringify => true;
}

extension LunarYearX on LunarYear {
  /// 天数
  int get days => months.map((e) => e.days).reduce((a, b) => a + b);

  /// 闰月
  LunarMonth? get leapMonth =>
      months.firstWhereOrNull((element) => element.isLeapMonth);

  /// 月数量
  int get monthsCount => months.length;

  /// 是否有闰月
  bool get hasLeapMonth => monthsCount == 13;

  /// 生肖
  Located get zodiac => chineseZodiacNameList[(year - 4) % 12];
}

extension LunarYearXthDay on LunarYear {
  /// 计算阴历年的第X天
  LunarDate getXthDay(int xthDay) {
    if (xthDay > days) {
      return LunarDate.empty;
    }

    int spanDays = xthDay;
    for (var i = 0; i < monthsCount; i++) {
      final currentMonth = months[i];
      if (spanDays < currentMonth.days) {
        return LunarDate(
          lunaYear: year,
          lunaMonth: currentMonth.index,
          lunaDay: spanDays + 1,
          isLeapMonth: currentMonth.isLeapMonth,
          isLongMonth: currentMonth.isLongMonth,
        );
      } else {
        spanDays = spanDays - currentMonth.days;
      }
    }
    return LunarDate.empty;
  }
}
