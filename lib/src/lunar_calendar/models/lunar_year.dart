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

  /// 生成阴历年
  factory LunarYear.fromYear({
    required int lunarYearNumber,
  }) {
    /// 读取阴历月信息
    final lunarMonthInfo = lunarMonthData[lunarYearNumber - startYear];

    /// 生成普通月
    final lunarMonthList =
        List<int>.generate(12, (index) => index + 1).map((month) {
      if ((lunarMonthInfo & (1 << (month - 1))) != 0) {
        return LunarMonth(number: month, days: 30, isLeapMonth: false);
      } else {
        return LunarMonth(number: month, days: 29, isLeapMonth: false);
      }
    }).toList();

    /// 检查是否有闰月：leapMonthNumber == 0 表示当年没有闰月
    final leapMonthNumber = (lunarMonthInfo >> leapMonthNumBit) & 0xf;
    if (leapMonthNumber != 0) {
      int leapDay = 29;

      /// 从数据中读取闰月是否有30天
      if (lunarMonthInfo & (1 << monthDayBit) != 0) {
        leapDay = 30;
      }

      final leapMonth =
          LunarMonth(number: leapMonthNumber, days: leapDay, isLeapMonth: true);

      /// 插入闰月。例如：闰二月在二月的后边
      lunarMonthList.insert(leapMonth.number, leapMonth);
    }

    return LunarYear(number: lunarYearNumber, lunarMonths: lunarMonthList);
  }

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
