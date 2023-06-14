import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:equatable/equatable.dart';

class SolarTerm extends Equatable {
  final String name;
  final int fromMillisecondsSinceEpoch;

  SolarTerm._internal(
      {required this.name, required this.fromMillisecondsSinceEpoch});

  factory SolarTerm.createFromCST(String name, int year, int month, int day,
      [int hour = 0, int minute = 0, int second = 0]) {
    final utc = parseCSTToUTC(year, month, day, hour, minute, second);
    return SolarTerm._internal(
        name: name, fromMillisecondsSinceEpoch: utc.millisecondsSinceEpoch);
  }

  DateTime get utc =>
      DateTime.fromMillisecondsSinceEpoch(fromMillisecondsSinceEpoch).toUtc();

  DateTime get local => utc.toLocal();

  DateTime get cst => utc.add(Duration(hours: 8));

  @override
  List<Object?> get props => [name, fromMillisecondsSinceEpoch];

  @override
  String toString() =>
      'SolarTerm(name: $name, ms: $fromMillisecondsSinceEpoch, CST: $cst, UTC: $utc, Local: $local)';
}
