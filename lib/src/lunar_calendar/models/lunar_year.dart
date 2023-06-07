import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class LunarYear extends Equatable {
  final List<LunarMonth> months;

  const LunarYear({
    required this.months,
  });

  @override
  List<Object?> get props => [
        months,
      ];

  @override
  bool get stringify => true;
}

extension LunarYearX on LunarYear {
  int get days => months.map((e) => e.days).reduce((a, b) => a + b);

  LunarMonth? get leapMonth =>
      months.firstWhereOrNull((element) => element.isLeapMonth);

  bool get hasLeapMonth => months.length == 13;
}
