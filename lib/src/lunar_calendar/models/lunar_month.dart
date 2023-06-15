import 'package:equatable/equatable.dart';

/// 阴历月
class LunarMonth extends Equatable {
  /// 月份数字
  final int index;

  /// 天数
  final int days;

  /// 是否闰月
  final bool isLeapMonth;

  const LunarMonth({
    required this.index,
    required this.days,
    required this.isLeapMonth,
  });

  @override
  List<Object?> get props => [index, days, isLeapMonth];

  @override
  bool get stringify => true;
}

extension LunarMonthIsLongMonth on LunarMonth {
  /// 是否大月： 大月30天，小月29天
  bool get isLongMonth => days == 30;
}
