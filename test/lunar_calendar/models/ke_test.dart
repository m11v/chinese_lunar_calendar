import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试刻', () {
    test('description', () {
      final ke1 = Ke.fromHour(hour: 23, minute: 05);
      expect(ke1.isUpper, true);
      expect(ke1.number, 1);

      final ke2 = Ke.fromHour(hour: 23, minute: 55);
      expect(ke2.isUpper, true);
      expect(ke2.number, 4);

      final ke3 = Ke.fromHour(hour: 00, minute: 05);
      expect(ke3.isUpper, false);
      expect(ke3.number, 1);

      final ke4 = Ke.fromHour(hour: 00, minute: 55);
      expect(ke4.isUpper, false);
      expect(ke4.number, 4);
    });
  });
}
