import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试刻', () {
    test('测试刻', () {
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

      final ke5 = Ke.fromHour(hour: 23, minute: 00);
      expect(ke5.isUpper, true);
      expect(ke5.number, 1);

      final ke6 = Ke.fromHour(hour: 23, minute: 30);
      expect(ke6.isUpper, true);
      expect(ke6.number, 3);
    });
  });
}
