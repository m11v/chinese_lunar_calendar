import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test solar term', () {
    group('Test solar term data time extension', () {
      test('Test getSolarTerm', () {
        /// PST时间2024年5月3日没有节气
        expect(
          DateTime.parse('2024-05-03 17:18:20-07').getSolarTerm(),
          null,
        );

        /// PST时间2024年5月4日立夏
        expect(
          DateTime.parse('2024-05-04 17:18:20-07').getSolarTerm()?.name.sValue,
          '立夏',
        );
      });

      test('Test getNextSolarTerm', () {
        /// PST时间2023年12月30日下一个节气是小寒
        expect(
          DateTime.parse('2023-12-30 17:18:20-07')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '小寒',
        );

        /// PST时间2024年5月3日下一个节气是立夏
        expect(
          DateTime.parse('2024-05-03 17:18:20-07')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '立夏',
        );

        /// PST时间2024年5月4日下一个节气是小满
        expect(
          DateTime.parse('2024-05-04 17:18:20-07')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '小满',
        );

        /// PST时间2024年5月5日下一个节气是小满
        expect(
          DateTime.parse('2024-05-05 17:18:20-07')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '小满',
        );
      });
    });
  });
}
