import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

import '../common/located.dart';

/// 闰
final run = Located(
  tValue: '閏',
  sValue: '闰',
);

/// 吉
final ji = Located(
  tValue: '吉',
  sValue: '吉',
);

/// 凶
final xiong = Located(
  tValue: '兇',
  sValue: '凶',
);

/// 月相名
final phaseOfMoon = getLocatedList(
  traditional: [
    '朔',
    '上蛾眉月',
    '上弦月',
    '漸盈凸月',
    '望',
    '漸虧凸月',
    '下弦月',
    '下蛾眉月',
    '晦',
  ],
  simplified: [
    '朔',
    '上蛾眉月',
    '上弦月',
    '渐盈凸月',
    '望',
    '渐亏凸月',
    '下弦月',
    '下蛾眉月',
    '晦',
  ],
);

/// 月份汉字
final lunarMonthNameList = getLocatedList(
  traditional: [
    '正月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '冬月',
    '臘月',
  ],
  simplified: [
    '正月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '冬月',
    '腊月',
  ],
);

/// 十二时辰汉代命名
final twoHourPeriodHanName = getLocatedList(
  traditional: [
    '夜半',
    '雞鳴',
    '平旦',
    '日出',
    '食時',
    '隅中',
    '日中',
    '日昳',
    '晡時',
    '日入',
    '黃昏',
    '人定',
  ],
  simplified: [
    '夜半',
    '鸡鸣',
    '平旦',
    '日出',
    '食时',
    '隅中',
    '日中',
    '日昳',
    '晡时',
    '日入',
    '黄昏',
    '人定',
  ],
);

/// 时辰经络
final meridiansName = getLocatedList(
  traditional: [
    '膽',
    '肝',
    '肺',
    '大腸',
    '胃',
    '脾',
    '心',
    '小腸',
    '膀胱',
    '腎',
    '心包',
    '三焦',
  ],
  simplified: [
    '胆',
    '肝',
    '肺',
    '大肠',
    '胃',
    '脾',
    '心',
    '小肠',
    '膀胱',
    '肾',
    '心包',
    '三焦',
  ],
);
