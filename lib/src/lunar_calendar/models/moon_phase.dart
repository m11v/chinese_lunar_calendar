import 'package:equatable/equatable.dart';

import '../../common/located.dart';

class MoonPhase extends Equatable {
  final int lunarDay;
  final int index;
  final Located name;

  const MoonPhase({
    required this.lunarDay,
    required this.index,
    required this.name,
  });

  @override
  List<Object?> get props => [
        lunarDay,
        index,
        name,
      ];
}
