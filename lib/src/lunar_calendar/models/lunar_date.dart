import 'package:equatable/equatable.dart';

class LunarDate extends Equatable {
  final int year;
  final int month;
  final int day;
  final bool isLeapMonth;

  const LunarDate(
      {required this.year,
      required this.month,
      required this.day,
      required this.isLeapMonth});

  static const empty = LunarDate(year: 0, month: 0, day: 0, isLeapMonth: false);

  @override
  List<Object?> get props => [year, month, day, isLeapMonth];

  @override
  bool get stringify => true;
}

extension LunarDateCN on LunarDate {
  // String get lunarYearCN {
  //   final yearString = year.toString();
  //   String yearCN;
  //   for(var i = 0; i< yearString.length; i++) {
  //     yearCN  = yearCN + int.parse(source)
  //   }
  // }
}
