import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test solar term', () {
    group('Test solar term data time extension', () {
      test('Test getSolarTerm', () {
        /// UTC 时间2024年5月4日没有节气
        expect(
          DateTime.parse('2024-05-04 17:18:20Z').getSolarTerm(),
          null,
        );

        /// UTC 时间2024-05-05 00:10:00.000Z立夏
        expect(
          DateTime.parse('2024-05-05 17:18:20Z').getSolarTerm()?.name.sValue,
          '立夏',
        );
      });

      test('Test getNextSolarTerm', () {
        /// UTC 时间2023年12月30日下一个节气是小寒
        expect(
          DateTime.parse('2023-12-30 17:18:20Z')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '小寒',
        );

        /// UTC 时间2024年5月4日下一个节气是立夏
        expect(
          DateTime.parse('2024-05-04 17:18:20Z')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '立夏',
        );

        /// UTC 时间2024年5月5日下一个节气是小满
        expect(
          DateTime.parse('2024-05-05 17:18:20Z')
              .getNextSolarTerm()
              ?.name
              .sValue,
          '小满',
        );
      });
    });
  });
}
