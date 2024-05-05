import 'package:collection/collection.dart';

import '../common/located.dart';

/// 简体中文节气名
const sSolarTerms = [
  '小寒',
  '大寒',
  '立春',
  '雨水',
  '惊蛰',
  '春分',
  '清明',
  '谷雨',
  '立夏',
  '小满',
  '芒种',
  '夏至',
  '小暑',
  '大暑',
  '立秋',
  '处暑',
  '白露',
  '秋分',
  '寒露',
  '霜降',
  '立冬',
  '小雪',
  '大雪',
  '冬至',
];

/// 繁体中文节气名
const tSolarTerms = [
  '小寒',
  '大寒',
  '立春',
  '雨水',
  '驚蟄',
  '春分',
  '清明',
  '穀雨',
  '立夏',
  '小滿',
  '芒種',
  '夏至',
  '小暑',
  '大暑',
  '立秋',
  '處暑',
  '白露',
  '秋分',
  '寒露',
  '霜降',
  '立冬',
  '小雪',
  '大雪',
  '冬至',
];

List<Located> solarTermNames = sSolarTerms
    .mapIndexed((index, element) => Located(
          sValue: element,
          tValue: tSolarTerms[index],
        ))
    .toList();
