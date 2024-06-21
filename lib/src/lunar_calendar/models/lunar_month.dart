import 'package:equatable/equatable.dart';

/// 阴历月
class LunarMonth extends Equatable {
  /// 阴历月份数字 1～12
  final int number;

  /// 天数
  final int days;

  /// 是否闰月
  final bool isLeapMonth;

  const LunarMonth({
    required this.number,
    required this.days,
    required this.isLeapMonth,
  });

  static const empty = LunarMonth(
    number: 0,
    days: 0,
    isLeapMonth: false,
  );

  @override
  List<Object?> get props => [
        number,
        days,
        isLeapMonth,
      ];

  @override
  bool get stringify => true;
}

extension LunarMonthIsLongMonth on LunarMonth {
  /// 是否大月： 大月30天，小月29天
  bool get isLongMonth => days == 30;
}
