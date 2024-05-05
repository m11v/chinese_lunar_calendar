import 'package:chinese_lunar_calendar/src/solar_term/solar_term_data.dart';
import 'package:test/test.dart';

void main() {
  group('Test solar term data', () {
    group('Test solar term data by year', () {
      final dataLists = supportedSolarTermsYear
          .map(
            (year) => getSolarTermsDataByYear(
              year: year,
            ),
          )
          .toList();

      test('There are 24 solar terms in each year', () {
        for (int i = 0; i < supportedSolarTermsYear.length; i++) {
          expect(dataLists[i].length, 24);
        }
      });

      test(
          'Each solar term data array contains 5 items which indicate year, month, day, hour, and minute',
          () {
        for (int i = 0; i < supportedSolarTermsYear.length; i++) {
          final year = supportedSolarTermsYear[i];
          final dataList = dataLists[i];
          for (List<int> data in dataList) {
            expect(data.length, 5);

            /// year
            expect(data[0], year);

            /// month
            expect(data[1] <= 12 && data[1] >= 1, true);

            /// day
            expect(data[2] <= 31 && data[1] >= 1, true);

            /// hour
            expect(data[3] <= 23 && data[1] >= 0, true);

            /// minute
            expect(data[4] <= 59 && data[1] >= 0, true);
          }
        }
      });
    });
  });
}
