# Chinese Lunar Calendar

中国万年历查询

本项目参考 [cnLunar](https://github.com/OPN48/cnlunar/tree/master), 用Dart重写成一个Dart Package。

本地运行，无远程API依赖。

[![Dart CI](https://github.com/m11v/chinese_lunar_calendar/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m11v/chinese_lunar_calendar)
[![License](https://img.shields.io/github/license/m11v/chinese_lunar_calendar)](https://github.com/m11v/chinese_lunar_calendar/blob/main/LICENSE)
[![Pub](https://img.shields.io/pub/v/chinese_lunar_calendar?label=Pub)](https://pub.dev/packages/chinese_lunar_calendar)
[![Package publisher](https://img.shields.io/pub/publisher/chinese_lunar_calendar.svg)](https://pub.dev/packages/chinese_lunar_calendar/publisher)

## 功能
- 查询春节日期.
- 查询农历日期、干支纪年、生肖。

## 安装

Run this command:

With Dart:
```dart
$ dart pub add chinese_lunar_calendar
```

With Flutter:

```dart
$ flutter pub add chinese_lunar_calendar
```

## 示例
### 查询春节日期
```dart
import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  // 输入查询日期
  final lunarCalendar = LunarCalendar(dateTime: DateTime(2023, 6, 6));
  print('2023年6月6日');
  
  // 输出春节阳历日期
  print('春节: ${lunarCalendar.chineseNewYearString}');
  
  // 输出阴历数字
  print(
      '阴历数字: ${lunarCalendar.lunarDate.year}, ${lunarCalendar.lunarDate.month}, ${lunarCalendar.lunarDate.day}, 闰月：${lunarCalendar.lunarDate.isLeapMonth}');
  
  // 输出阴历汉字
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
}

```
输出结果
```text
2023年6月6日
春节: 2023 年 1 月 22 日
阴历数字: 2023, 4, 19, 闰月：false
阴历汉字: 二零二三 癸卯[兔]年 四月大十九
```
