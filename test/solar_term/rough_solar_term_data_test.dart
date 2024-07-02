import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:chinese_lunar_calendar/src/solar_term/solar_term.dart';
import 'package:chinese_lunar_calendar/src/solar_term/solar_term_data.dart';
import 'package:test/test.dart';

void main() {
  group('Test rough solar term data', () {
    test('Test convert solar term data to solar term data format', () {
      for (int year = 2023; year <= 2026; year++) {
        final data = getSolarTermsDataByYearFromRoughData(year: year);

        final supportYear = supportedSolarTermsYear[year - 2023];
        final expectedList = getSolarTermsDataByYear(year: supportYear);

        expect(
          data.map((e) => e.sublist(0, 3)),
          expectedList.map((e) => e.sublist(0, 3)),
        );
      }
    });
  });
}
