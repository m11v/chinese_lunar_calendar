import 'package:chinese_lunar_calendar/src/lunar_calendar/models/solar_term.dart';

import '../localization/loc.dart';

/// Data from https://www.hko.gov.hk/sc/gts/astronomy/Solar_Term.htm

/// 2023年节气
final solarTerms2023 = [
  /// 小寒
  SolarTerm.createFromCST(Loc.get().solarTerms[0], 2023, 1, 5, 23, 5),

  /// 大寒
  SolarTerm.createFromCST(Loc.get().solarTerms[1], 2023, 1, 20, 16, 30),

  /// 立春
  SolarTerm.createFromCST(Loc.get().solarTerms[2], 2023, 2, 4, 10, 43),

  /// 雨水
  SolarTerm.createFromCST(Loc.get().solarTerms[3], 2023, 2, 19, 6, 34),

  /// 惊蛰
  SolarTerm.createFromCST(Loc.get().solarTerms[4], 2023, 3, 6, 4, 36),

  /// 春分
  SolarTerm.createFromCST(Loc.get().solarTerms[5], 2023, 3, 21, 5, 24),

  /// 清明
  SolarTerm.createFromCST(Loc.get().solarTerms[6], 2023, 4, 5, 9, 13),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[7], 2023, 4, 20, 16, 14),

  /// 立夏
  SolarTerm.createFromCST(Loc.get().solarTerms[8], 2023, 5, 6, 2, 19),

  /// 小满
  SolarTerm.createFromCST(Loc.get().solarTerms[9], 2023, 5, 21, 15, 9),

  /// 芒种
  SolarTerm.createFromCST(Loc.get().solarTerms[10], 2023, 6, 6, 6, 18),

  /// 夏至
  SolarTerm.createFromCST(Loc.get().solarTerms[11], 2023, 6, 21, 22, 58),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[12], 2023, 7, 7, 16, 31),

  /// 大暑
  SolarTerm.createFromCST(Loc.get().solarTerms[13], 2023, 7, 23, 9, 50),

  /// 立秋
  SolarTerm.createFromCST(Loc.get().solarTerms[14], 2023, 8, 8, 2, 23),

  /// 处暑
  SolarTerm.createFromCST(Loc.get().solarTerms[15], 2023, 8, 23, 17, 1),

  /// 白露
  SolarTerm.createFromCST(Loc.get().solarTerms[16], 2023, 9, 8, 5, 27),

  /// 秋分
  SolarTerm.createFromCST(Loc.get().solarTerms[17], 2023, 9, 23, 14, 50),

  /// 寒露
  SolarTerm.createFromCST(Loc.get().solarTerms[18], 2023, 10, 8, 21, 16),

  /// 霜降
  SolarTerm.createFromCST(Loc.get().solarTerms[19], 2023, 10, 24, 0, 21),

  /// 立冬
  SolarTerm.createFromCST(Loc.get().solarTerms[20], 2023, 11, 8, 0, 36),

  /// 小雪
  SolarTerm.createFromCST(Loc.get().solarTerms[21], 2023, 11, 22, 23, 3),

  /// 大雪
  SolarTerm.createFromCST(Loc.get().solarTerms[22], 2023, 12, 7, 17, 33),

  /// 冬至
  SolarTerm.createFromCST(Loc.get().solarTerms[23], 2023, 12, 22, 11, 27),
];

/// 2024年节气
final solarTerms2024 = [
  /// 小寒
  SolarTerm.createFromCST(Loc.get().solarTerms[0], 2024, 1, 6, 4, 49),

  /// 大寒
  SolarTerm.createFromCST(Loc.get().solarTerms[1], 2024, 1, 20, 22, 7),

  /// 立春
  SolarTerm.createFromCST(Loc.get().solarTerms[2], 2024, 2, 4, 16, 27),

  /// 雨水
  SolarTerm.createFromCST(Loc.get().solarTerms[3], 2024, 2, 19, 12, 13),

  /// 惊蛰
  SolarTerm.createFromCST(Loc.get().solarTerms[4], 2024, 3, 5, 10, 23),

  /// 春分
  SolarTerm.createFromCST(Loc.get().solarTerms[5], 2024, 3, 20, 11, 06),

  /// 清明
  SolarTerm.createFromCST(Loc.get().solarTerms[6], 2024, 4, 4, 15, 02),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[7], 2024, 4, 19, 22, 0),

  /// 立夏
  SolarTerm.createFromCST(Loc.get().solarTerms[8], 2024, 5, 5, 8, 10),

  /// 小满
  SolarTerm.createFromCST(Loc.get().solarTerms[9], 2024, 5, 20, 20, 59),

  /// 芒种
  SolarTerm.createFromCST(Loc.get().solarTerms[10], 2024, 6, 5, 12, 10),

  /// 夏至
  SolarTerm.createFromCST(Loc.get().solarTerms[11], 2024, 6, 21, 4, 51),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[12], 2024, 7, 6, 22, 20),

  /// 大暑
  SolarTerm.createFromCST(Loc.get().solarTerms[13], 2024, 7, 22, 15, 44),

  /// 立秋
  SolarTerm.createFromCST(Loc.get().solarTerms[14], 2024, 8, 7, 8, 9),

  /// 处暑
  SolarTerm.createFromCST(Loc.get().solarTerms[15], 2024, 8, 22, 22, 55),

  /// 白露
  SolarTerm.createFromCST(Loc.get().solarTerms[16], 2024, 9, 7, 11, 11),

  /// 秋分
  SolarTerm.createFromCST(Loc.get().solarTerms[17], 2024, 9, 22, 20, 44),

  /// 寒露
  SolarTerm.createFromCST(Loc.get().solarTerms[18], 2024, 10, 8, 3, 0),

  /// 霜降
  SolarTerm.createFromCST(Loc.get().solarTerms[19], 2024, 10, 23, 6, 15),

  /// 立冬
  SolarTerm.createFromCST(Loc.get().solarTerms[20], 2024, 11, 7, 6, 20),

  /// 小雪
  SolarTerm.createFromCST(Loc.get().solarTerms[21], 2024, 11, 22, 3, 56),

  /// 大雪
  SolarTerm.createFromCST(Loc.get().solarTerms[22], 2024, 12, 6, 23, 17),

  /// 冬至
  SolarTerm.createFromCST(Loc.get().solarTerms[23], 2024, 12, 21, 17, 21),
];

/// 2025年节气
final solarTerms2025 = [
  /// 小寒
  SolarTerm.createFromCST(Loc.get().solarTerms[0], 2025, 1, 5, 10, 33),

  /// 大寒
  SolarTerm.createFromCST(Loc.get().solarTerms[1], 2025, 1, 20, 4, 0),

  /// 立春
  SolarTerm.createFromCST(Loc.get().solarTerms[2], 2025, 2, 3, 22, 10),

  /// 雨水
  SolarTerm.createFromCST(Loc.get().solarTerms[3], 2025, 2, 18, 18, 07),

  /// 惊蛰
  SolarTerm.createFromCST(Loc.get().solarTerms[4], 2025, 3, 5, 16, 07),

  /// 春分
  SolarTerm.createFromCST(Loc.get().solarTerms[5], 2025, 3, 20, 17, 01),

  /// 清明
  SolarTerm.createFromCST(Loc.get().solarTerms[6], 2025, 4, 4, 20, 48),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[7], 2025, 4, 20, 3, 56),

  /// 立夏
  SolarTerm.createFromCST(Loc.get().solarTerms[8], 2025, 5, 5, 13, 57),

  /// 小满
  SolarTerm.createFromCST(Loc.get().solarTerms[9], 2025, 5, 21, 2, 55),

  /// 芒种
  SolarTerm.createFromCST(Loc.get().solarTerms[10], 2025, 6, 5, 17, 56),

  /// 夏至
  SolarTerm.createFromCST(Loc.get().solarTerms[11], 2025, 6, 21, 10, 42),

  /// 谷雨
  SolarTerm.createFromCST(Loc.get().solarTerms[12], 2025, 7, 7, 4, 5),

  /// 大暑
  SolarTerm.createFromCST(Loc.get().solarTerms[13], 2025, 7, 22, 21, 29),

  /// 立秋
  SolarTerm.createFromCST(Loc.get().solarTerms[14], 2025, 8, 7, 13, 52),

  /// 处暑
  SolarTerm.createFromCST(Loc.get().solarTerms[15], 2025, 8, 23, 4, 34),

  /// 白露
  SolarTerm.createFromCST(Loc.get().solarTerms[16], 2025, 9, 7, 16, 52),

  /// 秋分
  SolarTerm.createFromCST(Loc.get().solarTerms[17], 2025, 9, 23, 2, 19),

  /// 寒露
  SolarTerm.createFromCST(Loc.get().solarTerms[18], 2025, 10, 8, 8, 41),

  /// 霜降
  SolarTerm.createFromCST(Loc.get().solarTerms[19], 2025, 10, 23, 11, 51),

  /// 立冬
  SolarTerm.createFromCST(Loc.get().solarTerms[20], 2025, 11, 7, 12, 4),

  /// 小雪
  SolarTerm.createFromCST(Loc.get().solarTerms[21], 2025, 11, 22, 9, 36),

  /// 大雪
  SolarTerm.createFromCST(Loc.get().solarTerms[22], 2025, 12, 7, 5, 5),

  /// 冬至
  SolarTerm.createFromCST(Loc.get().solarTerms[23], 2025, 12, 21, 23, 03),
];

/// 年度节气表
final solarTermsTimeByYear = {
  '2023': solarTerms2023,
  '2024': solarTerms2024,
  '2025': solarTerms2025,
};
