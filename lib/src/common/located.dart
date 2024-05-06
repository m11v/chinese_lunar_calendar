import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class Located extends Equatable {
  const Located({
    required this.tValue,
    this.sValue,
  });

  final String tValue;
  final String? sValue;

  static const empty = Located(
    tValue: '',
    sValue: '',
  );

  String getValue([
    bool isHant = true,
  ]) {
    return isHant ? tValue : (sValue ?? tValue);
  }

  @override
  List<Object?> get props => [
        tValue,
        sValue,
      ];
}

List<Located> getLocatedList({
  required List<String> traditional,
  required List<String> simplified,
}) =>
    IterableZip(
      [
        traditional,
        simplified, // 简体
      ],
    )
        .map(
          (e) => Located(
            tValue: e[0],
            sValue: e[1],
          ),
        )
        .toList();
