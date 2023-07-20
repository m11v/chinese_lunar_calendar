import 'package:equatable/equatable.dart';

import '../../localization/loc.dart';

/// 刻
/// 采取清代的定义，即一个时辰八刻：上四刻和下四刻
/// 例如：
/// 23:00 ～ 23:15 子初一刻
/// 23:15 ～ 23:30 子初二刻
/// 23:30 ～ 23:45 子初三刻
/// 23:45 ～ 00:00 子初四刻
/// 00:00 ～ 00:15 子正一刻
/// 00:15 ～ 00:30 子正二刻
/// 00:30 ～ 00:45 子正三刻
/// 00:45 ～ 01:00 子正四刻
class Ke extends Equatable {
  /// 刻数
  final int number;

  /// true：为上四刻；false 为下四刻
  final bool isUpper;

  const Ke({required this.number, required this.isUpper});

  factory Ke.from({required DateTime dateTime}) {
    final isUpper = dateTime.hour % 2 == 1;
    final number = (dateTime.minute / 15).floor() + 1;
    return Ke(number: number, isUpper: isUpper);
  }

  @override
  List<Object?> get props => [number, isUpper];
}

extension KeX on Ke {
  String get partName => isUpper ? Loc.get().chu : Loc.get().zheng;
  String get numberName => '${Loc.get().upperCNNum[number]}${Loc.get().ke}';
  String get unitName => Loc.get().ke;
  String get name => '$partName $numberName';
}
