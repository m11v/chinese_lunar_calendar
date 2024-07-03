import 'package:equatable/equatable.dart';

class Weekday extends Equatable {
  final int number;
  final String name;

  const Weekday({
    required this.number,
    required this.name,
  });

  @override
  List<Object?> get props => [
        number,
        name,
      ];
}
