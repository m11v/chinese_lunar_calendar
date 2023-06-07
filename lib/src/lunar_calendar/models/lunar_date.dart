import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';
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

extension LunarDateDaysInThisMonth on LunarDate {
  bool get isLongMonth => getLunarYear(year)
      .months
      .firstWhere((element) =>
          element.index == month && element.isLeapMonth == isLeapMonth)
      .isLongMonth;
}

extension LunarDateCN on LunarDate {
  String get lunarYearCN =>
      year.digits.map((e) => upperCNNum[e]).toList().join();

  String get lunarMonthCN {
    String monthCN = lunarMonthNameList[month - 1];
    if (isLeapMonth) {
      monthCN = '闰$monthCN';
    }

    if (isLongMonth) {
      monthCN = '$monthCN大';
    } else {
      monthCN = '$monthCN小';
    }
    return monthCN;
  }

  String get lunarDayCN => lunarDayNameList[day - 1];
}
