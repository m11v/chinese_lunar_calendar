import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../../utils/calculation_2_hour_period.dart';
import '../../utils/calculation_8_char.dart';

/// 时辰
class TwoHourPeriod extends Equatable {
  /// 时辰八字名
  final String nameInTheDay;

  /// 时辰列表序号
  final int twoHourPeriodIndex;

  /// 是否吉时
  final bool isLucky;

  const TwoHourPeriod({
    required this.nameInTheDay,
    required this.twoHourPeriodIndex,
    required this.isLucky,
  });

  factory TwoHourPeriod.from({required DateTime dateTime}) {
    final twoHourPeriodIndex = getTwoHourPeriodIndex(hour: dateTime.hour);
    final nameInTheDay = getTwoHour8CharFromDateTime(dateTime: dateTime);
    final isLucky = getTwoHourPeriodLuckyList(
        day8Char: getDay8Char(
      localTime: dateTime.toLocal(),
    ))[twoHourPeriodIndex];
    return TwoHourPeriod(
      nameInTheDay: nameInTheDay,
      twoHourPeriodIndex: twoHourPeriodIndex,
      isLucky: isLucky,
    );
  }

  @override
  List<Object?> get props => [
        nameInTheDay,
        twoHourPeriodIndex,
        isLucky,
      ];
}

extension TwoHourPeriodX on TwoHourPeriod {
  /// 地支名
  String get name => nameInTheDay[1];

  /// 天干名
  String get steamName => nameInTheDay[0];

  /// 时辰汉代名
  Located get nameInHanDynasty => twoHourPeriodHanName[twoHourPeriodIndex];

  /// 吉凶时名
  Located get isLuckyName => isLucky ? ji : xiong;

  /// 时辰经络
  Located get meridian => meridiansName[twoHourPeriodIndex];
}
