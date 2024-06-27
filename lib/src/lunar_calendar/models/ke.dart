import 'package:equatable/equatable.dart';

import '../../constants/cn_text.dart';

/// 刻
/// 采取清代的定义，即一个时辰八刻：上四刻和下四刻
/// 例如：
/// 23:00 ～ 23:14 子初一刻
/// 23:15 ～ 23:29 子初二刻
/// 23:30 ～ 23:44 子初三刻
/// 23:45 ～ 00:59 子初四刻
/// 00:00 ～ 00:14 子正一刻
/// 00:15 ～ 00:29 子正二刻
/// 00:30 ～ 00:44 子正三刻
/// 00:45 ～ 01:59 子正四刻
class Ke extends Equatable {
  /// 刻数
  final int number;

  /// true：为上四刻；false 为下四刻
  final bool isUpper;

  const Ke({
    required this.number,
    required this.isUpper,
  });

  factory Ke.fromDateTime({
    required DateTime dateTime,
  }) {
    return Ke.fromHour(
      hour: dateTime.hour,
      minute: dateTime.minute,
    );
  }

  factory Ke.fromHour({
    required int hour,
    required int minute,
  }) {
    final isUpper = hour % 2 == 1;
    final number = (minute / 15).floor() + 1;
    return Ke(number: number, isUpper: isUpper);
  }

  @override
  List<Object?> get props => [
        number,
        isUpper,
      ];
}

extension KeX on Ke {
  String get partName => isUpper ? chu : zheng;

  String get upperNumberName => upperCNNum[number];

  String get unitName => ke;

  String get fullName => '$partName$upperNumberName';
}
