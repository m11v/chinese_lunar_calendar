import 'package:equatable/equatable.dart';

class Located extends Equatable {
  const Located({
    required this.tValue,
    required this.sValue,
  });

  final String tValue;
  final String sValue;

  String getValue(bool isHant) {
    return isHant ? tValue : sValue;
  }

  @override
  List<Object?> get props => [
        tValue,
        sValue,
      ];
}
