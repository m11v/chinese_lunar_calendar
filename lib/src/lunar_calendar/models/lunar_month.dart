import 'package:equatable/equatable.dart';

class LunarMonth extends Equatable {
  // Month index
  final int index;
  // Days in this lunar month
  final int days;
  // This lunar month is leap month or not
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
  bool get isLongMonth => days == 30;
}
