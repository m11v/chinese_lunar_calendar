import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/constants/configs.dart';
import 'package:equatable/equatable.dart';

/// 时辰
class TwoHourPeriod extends Equatable {
  /// 时辰八字名
  final String nameInTheDay;

  /// 时辰列表序号
  final int twoHourPeriodIndex;

  /// 是否吉时
  final bool isLucky;

  const TwoHourPeriod(
      {required this.nameInTheDay,
      required this.twoHourPeriodIndex,
      required this.isLucky});

  factory TwoHourPeriod.from({required DateTime dateTime}) {
    final twoHourPeriodIndex = getTwoHourPeriodIndex(dateTime.hour);
    final nameInTheDay = getTwoHour8Char(dateTime: dateTime);
    final isLucky = getTwoHourPeriodLuckyList(dateTime)[twoHourPeriodIndex];
    return TwoHourPeriod(
        nameInTheDay: nameInTheDay,
        twoHourPeriodIndex: twoHourPeriodIndex,
        isLucky: isLucky);
  }

  @override
  List<Object?> get props => [nameInTheDay, twoHourPeriodIndex, isLucky];
}

extension TwoHourPeriodX on TwoHourPeriod {
  /// 地支名
  String get name => the12EarthlyBranches[twoHourPeriodIndex];

  /// 时辰汉代名
  String get nameInHanDynasty => twoHourPeriodHanName[twoHourPeriodIndex];

  /// 吉凶时名
  String get isLuckyName => isLucky ? '吉' : '凶';
}
