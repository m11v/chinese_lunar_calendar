import 'package:equatable/equatable.dart';

class Located extends Equatable {
  const Located({
    required this.tValue,
    this.sValue,
  });

  final String tValue;
  final String? sValue;

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
