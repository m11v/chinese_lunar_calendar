import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

/// 时辰
class TwoHourPeriod extends Equatable {
  /// 时辰八字名
  final String nameInTheDay;

  /// 时辰列表序号
  final int twoHourPeriodIndex;

  /// 是否吉时
  final bool isLucky;

  /// 刻：1时辰分8刻，包括上四刻和下四刻
  final Ke ke;

  const TwoHourPeriod({
    required this.nameInTheDay,
    required this.twoHourPeriodIndex,
    required this.isLucky,
    required this.ke,
  });

  factory TwoHourPeriod.from({required DateTime dateTime}) {
    final twoHourPeriodIndex = getTwoHourPeriodIndex(dateTime.hour);
    final nameInTheDay = getTwoHour8Char(dateTime: dateTime);
    final isLucky = getTwoHourPeriodLuckyList(dateTime)[twoHourPeriodIndex];
    return TwoHourPeriod(
      nameInTheDay: nameInTheDay,
      twoHourPeriodIndex: twoHourPeriodIndex,
      isLucky: isLucky,
      ke: Ke.from(dateTime: dateTime),
    );
  }

  @override
  List<Object?> get props => [nameInTheDay, twoHourPeriodIndex, isLucky, ke];
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
