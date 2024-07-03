import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

import '../../utils/calculation_2_hour_period.dart';
import '../../utils/calculation_8_char.dart';

/// 时辰
/// 0: 子时：23点到1点，三更；
/// 1: 丑时：1点到3点，四更；
/// 2: 寅时：3点到5点，五更；
/// 3: 卯时：5点到7点；
/// 4: 辰时：7点到9点；
/// 5: 巳时：9点到11点；
/// 6: 午时：11点到13点；
/// 7: 未时：13点到15点；
/// 8: 申时：15点到17点；
/// 9: 酉时：17点到19点；
/// 10: 戌时：19点到21点，一更；
/// 11: 亥时：21点到23点，二更。
class TwoHourPeriod extends Equatable {
  /// 时辰八字名
  final String name;

  /// 时辰列表序号
  final int twoHourPeriodIndex;

  /// 是否吉时
  final bool isLucky;

  const TwoHourPeriod({
    required this.name,
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
      name: nameInTheDay,
      twoHourPeriodIndex: twoHourPeriodIndex,
      isLucky: isLucky,
    );
  }

  @override
  List<Object?> get props => [
        name,
        twoHourPeriodIndex,
        isLucky,
      ];
}

extension TwoHourPeriodJing on TwoHourPeriod {
  Jing? get jing {
    switch (twoHourPeriodIndex) {
      case 0:
      case 1:
      case 2:
        return Jing(
          number: twoHourPeriodIndex + 3,
        );
      case 10:
      case 11:
        return Jing(
          number: twoHourPeriodIndex - 9,
        );
      default:
        return null;
    }
  }
}

extension TwoHourPeriodX on TwoHourPeriod {
  /// 地支名
  String get branchName => name[1];

  /// 天干名
  String get steamName => name[0];

  /// 时辰汉代名
  Located get nameInHanDynasty => twoHourPeriodHanName[twoHourPeriodIndex];

  /// 吉凶时名
  Located get isLuckyName => isLucky ? ji : xiong;

  /// 时辰经络
  Located get meridian => meridiansName[twoHourPeriodIndex];
}
