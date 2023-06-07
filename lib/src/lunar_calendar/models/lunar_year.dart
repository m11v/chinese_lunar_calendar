import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../constants/configs.dart';

class LunarYear extends Equatable {
  final int year;
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
  int get days => months.map((e) => e.days).reduce((a, b) => a + b);

  LunarMonth? get leapMonth =>
      months.firstWhereOrNull((element) => element.isLeapMonth);

  int get monthsCount => months.length;

  bool get hasLeapMonth => monthsCount == 13;

  String get zodiac => chineseZodiacNameList[(year - 4) % 12];
}

extension LunarYearXthDay on LunarYear {
  LunarDate getXthDay(int xthDay) {
    if (xthDay > days) {
      return LunarDate.empty;
    }

    int spanDays = xthDay;
    for (var i = 0; i < monthsCount; i++) {
      final currentMonth = months[i];
      if (spanDays < currentMonth.days) {
        return LunarDate(
            year: year,
            month: currentMonth.index,
            day: spanDays + 1,
            isLeapMonth: currentMonth.isLeapMonth);
      } else {
        spanDays = spanDays - currentMonth.days;
      }
    }
    return LunarDate.empty;
  }
}
