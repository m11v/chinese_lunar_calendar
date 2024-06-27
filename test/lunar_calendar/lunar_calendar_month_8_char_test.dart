import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('测试月八字', () {
    /// 测试时间： 2023年x月2日10点30
    final year2023 = [
      '壬子',
      '癸丑',
      '甲寅',
      '乙卯',
      '丙辰',
      '丁巳',
      '戊午',
      '己未',
      '庚申',
      '辛酉',
      '壬戌',
      '癸亥',
    ];

    test('测试2023年月八字', () {
      for (int i = 1; i < 13; i++) {
        final lc = LunarCalendar.from(
          utcDateTime: DateTime(2023, i, 2, 10, 30).toUtc(),
        );
        expect(lc.month8Char, year2023[i - 1]);
      }
    });

    /// 测试时间： 2024年x月2日10点30
    final year2024 = [
      '甲子',
      '乙丑',
      '丙寅',
      '丁卯',
      '戊辰',
      '己巳',
      '庚午',
      '辛未',
      '壬申',
      '癸酉',
      '甲戌',
      '乙亥',
    ];

    test('测试2024年月八字', () {
      for (int i = 1; i < 13; i++) {
        final lc = LunarCalendar.from(
          utcDateTime: DateTime(2024, i, 2, 10, 30).toUtc(),
        );
        expect(lc.month8Char, year2024[i - 1]);
      }
    });

    /// 测试时间： 2025年x月2日10点30
    final year2025 = [
      '丙子',
      '丁丑',
      '戊寅',
      '己卯',
      '庚辰',
      '辛巳',
      '壬午',
      '癸未',
      '甲申',
      '乙酉',
      '丙戌',
      '丁亥',
    ];

    test('测试2025年月八字', () {
      for (int i = 1; i < 13; i++) {
        final lc = LunarCalendar.from(
          utcDateTime: DateTime(2025, i, 2, 10, 30).toUtc(),
        );
        expect(lc.month8Char, year2025[i - 1]);
      }
    });

    /// 测试时间： 2025年x月2日10点30
    final year2026 = [
      '戊子',
      '己丑',
      '庚寅',
      '辛卯',
      '壬辰',
      '癸巳',
      '甲午',
      '乙未',
      '丙申',
      '丁酉',
      '戊戌',
      '己亥',
    ];

    test('测试2026年月八字', () {
      for (int i = 1; i < 13; i++) {
        final lc = LunarCalendar.from(
          utcDateTime: DateTime(2026, i, 2, 10, 30).toUtc(),
        );
        expect(lc.month8Char, year2026[i - 1]);
      }
    });
  });
}
