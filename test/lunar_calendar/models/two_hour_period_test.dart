import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试更', () {
    test('测试更', () {
      expect(
          TwoHourPeriod(name: '', twoHourPeriodIndex: 0, isLucky: false)
              .jing
              ?.cnName,
          '三');
      expect(
          TwoHourPeriod(name: '', twoHourPeriodIndex: 1, isLucky: false)
              .jing
              ?.cnName,
          '四');
      expect(
          TwoHourPeriod(name: '', twoHourPeriodIndex: 2, isLucky: false)
              .jing
              ?.cnName,
          '五');
      for (int i = 3; i < 10; i++) {
        expect(
            TwoHourPeriod(name: '', twoHourPeriodIndex: i, isLucky: false)
                .jing
                ?.cnName,
            null);
      }
      expect(
          TwoHourPeriod(name: '', twoHourPeriodIndex: 10, isLucky: false)
              .jing
              ?.cnName,
          '一');
      expect(
          TwoHourPeriod(name: '', twoHourPeriodIndex: 11, isLucky: false)
              .jing
              ?.cnName,
          '二');
    });
  });
}
