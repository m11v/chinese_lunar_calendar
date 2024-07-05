import 'package:equatable/equatable.dart';

import '../../common/located.dart';
import '../../constants/cn_text.dart';
import '../../localization/localization.dart';

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

  @override
  List<Object?> get props => [
        number,
        days,
        isLeapMonth,
      ];

  @override
  bool get stringify => true;
}

extension LunarMonthX on LunarMonth {
  /// 是否大月： 大月30天，小月29天
  bool get isLongMonth => days == 30;

  /// 闰月前缀
  Located get leapMonthPrefix => isLeapMonth ? run : Located.empty;

  /// 大小月后缀
  String get monthLengthSuffix => isLongMonth ? da : xiao;

  /// 汉字阴历月
  Located get lunarMonthCN => lunarMonthNameList[number - 1];
}
