import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

/// 阴历年
class LunarYear extends Equatable {
  /// 阴历年份数字
  final int number;

  /// 月列表：有闰月时每年13个月，无闰月时每年12个月
  final List<LunarMonth> lunarMonths;

  const LunarYear({
    required this.number,
    required this.lunarMonths,
  });

  static const empty = LunarYear(
    number: 0,
    lunarMonths: [],
  );

  @override
  List<Object?> get props => [
        number,
        lunarMonths,
      ];

  @override
  bool get stringify => true;
}

extension LunarYearX on LunarYear {
  /// 天数
  int get days => lunarMonths.map((e) => e.days).reduce((a, b) => a + b);

  /// 闰月
  LunarMonth? get leapMonth =>
      lunarMonths.firstWhereOrNull((element) => element.isLeapMonth);

  /// 非闰月阴历月
  LunarMonth getNonLeapLunarMonthFromNumber(int number) {
    return lunarMonths.where((it) => it.number == number).toList().first;
  }

  /// 月数量
  int get monthsCount => lunarMonths.length;

  /// 是否有闰月
  bool get hasLeapMonth => monthsCount == 13;
}
