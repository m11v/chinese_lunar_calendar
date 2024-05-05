import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../common/located.dart';
import '../utils/tools.dart';
import 'solar_term_data.dart';
import 'solar_term_name.dart';

export 'solar_term_data.dart';
export 'solar_term_name.dart';

/// 节气
class SolarTerm extends Equatable {
  /// Name
  final Located name;

  /// UTC time
  final DateTime utc;

  SolarTerm._internal({
    required this.name,
    required this.utc,
  });

  /// Create solar term from China Standard Time(UTC+8)
  factory SolarTerm.createFromCST({
    required Located name,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
  }) {
    final utc = parseCSTToUTC(year, month, day, hour, minute, 0);
    return SolarTerm._internal(
      name: name,
      utc: utc,
    );
  }

  /// Create solar term from solar term data
  factory SolarTerm.createFromSolarTermData({
    required Located name,
    required List<int> solarTermData,
  }) {
    return SolarTerm.createFromCST(
      name: name,
      year: solarTermData[0],
      month: solarTermData[1],
      day: solarTermData[2],
      hour: solarTermData[3],
      minute: solarTermData[4],
    );
  }

  /// Local time
  DateTime get local => utc.toLocal();

  /// China Standard Time
  DateTime get cst => utc.add(Duration(hours: 8));

  /// Get China Standard Time or local time
  DateTime getTime({required bool useCSTToCalculate}) =>
      useCSTToCalculate ? cst : local;

  @override
  List<Object?> get props => [
        name,
        utc,
      ];

  @override
  String toString() =>
      'SolarTerm(name: $name, CST: $cst, UTC: $utc, Local: $local)';
}

/// 获取当年节气列表
List<SolarTerm> getSolarTerms(int year) {
  return getSolarTermsDataByYear(year: year)
      .mapIndexed(
        (index, solarTermData) => SolarTerm.createFromSolarTermData(
          name: solarTermNames[index],
          solarTermData: solarTermData,
        ),
      )
      .toList();
}

SolarTerm? get todaySolarTerm => DateTime.now().getSolarTerm();

SolarTerm? get nextSolarTerm => DateTime.now().getNextSolarTerm();

extension SolarTermDateTime on DateTime {
  /// 返回指定日期的节气
  SolarTerm? getSolarTerm() {
    final thisUtcTime = toUtc();
    return getSolarTerms(year).where((element) {
      final solarTermTime = element.utc;

      return solarTermTime.month == thisUtcTime.month &&
          solarTermTime.day == thisUtcTime.day;
    }).firstOrNull;
  }

  /// 返回指定日期的下一个节气
  SolarTerm? getNextSolarTerm() {
    final thisUtcTime = toUtc();
    return getSolarTerms(year).where((element) {
          final solarTermTime = element.utc;

          return solarTermTime.month > thisUtcTime.month ||
              (solarTermTime.month == thisUtcTime.month &&
                  solarTermTime.day > thisUtcTime.day);
        }).firstOrNull ??
        getSolarTerms(year + 1).firstOrNull;
  }
}