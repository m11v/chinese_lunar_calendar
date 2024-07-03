import 'package:equatable/equatable.dart';

import '../../constants/cn_text.dart';

class Jing extends Equatable {
  final int number;
  final String unit = jing;

  const Jing({
    required this.number,
  });

  @override
  List<Object?> get props => [
        number,
        unit,
      ];
}

extension JingCN on Jing {
  String get cnName => upperCNNum[number];
}
