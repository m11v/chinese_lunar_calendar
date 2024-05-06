import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test localization', () {
    test('Test localization', () {
      expect(run.getValue(false), '闰');

      expect(run.getValue(), '閏');
    });
  });
}
