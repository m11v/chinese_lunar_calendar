import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

/// 节气
class SolarTerm extends Equatable {
  /// Solar term name
  final String name;

  /// UTC time
  final DateTime utc;

  SolarTerm._internal({required this.name, required this.utc});

  /// Create solar term from China Standard Time(UTC+8)
  factory SolarTerm.createFromCST(String name, int year, int month, int day,
      [int hour = 0, int minute = 0, int second = 0]) {
    final utc = parseCSTToUTC(year, month, day, hour, minute, second);
    return SolarTerm._internal(name: name, utc: utc);
  }

  /// Local time
  DateTime get local => utc.toLocal();

  /// China Standard Time
  DateTime get cst => utc.add(Duration(hours: 8));

  /// Get China Standard Time or local time
  DateTime getTime({required bool useCSTToCalculate}) =>
      useCSTToCalculate ? cst : local;

  @override
  List<Object?> get props => [name, utc];

  @override
  String toString() =>
      'SolarTerm(name: $name, CST: $cst, UTC: $utc, Local: $local)';
}
