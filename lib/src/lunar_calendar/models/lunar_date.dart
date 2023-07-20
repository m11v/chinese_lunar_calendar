import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

/// 阴历日期
class LunarDate extends Equatable {
  /// 年
  final int year;

  /// 月
  final int month;

  /// 日
  final int day;

  /// 是否闰月
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

extension LunarDateIsLongMonth on LunarDate {
  /// LunarDate 所在月是否大月
  bool get isLongMonth => getLunarYear(year)
      .months
      .firstWhere((element) =>
          element.index == month && element.isLeapMonth == isLeapMonth)
      .isLongMonth;
}

extension LunarDateCN on LunarDate {
  /// 汉字阴历年
  String get lunarYearCN =>
      year.digits.map((e) => Loc.get().upperCNNum[e]).toList().join();

  /// 闰月前缀
  String get leapMonthPrefix => isLeapMonth ? Loc.get().run : '';

  /// 大小月后缀
  String get monthLengthSuffix => isLongMonth ? Loc.get().da : Loc.get().xiao;

  /// 汉字阴历月
  String get lunarMonthCN => Loc.get().lunarMonthNameList[month - 1];

  /// 汉字阴历日
  String get lunarDayCN => Loc.get().lunarDayNameList[day - 1];

  /// 干支纪年
  String get year8Char => getYear8Char(lunarYear: year);

  /// 生肖
  String get zodiac => Loc.get().chineseZodiacNameList[(year - 4) % 12];

  /// 汉字阴历日期
  String get fullCNString {
    return '$lunarYearCN $year8Char[$zodiac]${Loc.get().nian} $leapMonthPrefix$lunarMonthCN$monthLengthSuffix$lunarDayCN';
  }
}
