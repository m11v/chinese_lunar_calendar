import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../common/located.dart';

class Zodiac extends Equatable {
  const Zodiac({
    required this.index,
    required this.name,
  });

  /// 从 0 到11
  final int index;
  final Located name;

  @override
  List<Object?> get props => [
        index,
        name,
      ];
}

final zodiacList = getLocatedList(
  traditional: [
    '鼠', // 0
    '牛', // 1
    '虎', // 2
    '兔', // 3
    '龍', // 4
    '蛇', // 5
    '馬', // 6
    '羊', // 7
    '猴', // 8
    '雞', // 9
    '狗', // 10
    '豬', // 11
  ],
  simplified: [
    '鼠',
    '牛',
    '虎',
    '兔',
    '龙',
    '蛇',
    '马',
    '羊',
    '猴',
    '鸡',
    '狗',
    '猪',
  ],
)
    .mapIndexed((index, name) => Zodiac(
          index: index,
          name: name,
        ))
    .toList();
