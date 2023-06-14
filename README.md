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
  
  // 输出汉字星期
  print('星期：${lunarCalendar.weekDayCN}');
  
  // 输出月相
  print('月相：${lunarCalendar.phaseOfMoon}');

  // 输出本年节气
  print(
      '本年节气: ${lunarCalendar.localSolarTerms.values.map((value) => '${value.name}: ${value.local}').toList()}');
  
  // 输出本日节气
  print('本日节气：${lunarCalendar.todayLocalSolarTerm}');
}

```
输出结果
```text
2023年6月6日
春节: 2023 年 1 月 22 日
阴历数字: 2023, 4, 19, 闰月：false
阴历汉字: 二零二三 癸卯[兔]年 四月大十九
星期：星期二
月相：渐亏凸月
本年节气: [小寒: 2023-01-05 07:05:00.000, 大寒: 2023-01-20 00:30:00.000, 立春: 2023-02-03 18:43:00.000, 雨水: 2023-02-18 14:34:00.000, 惊蛰: 2023-03-05 12:36:00.000, 春分: 2023-03-20 14:24:00.000, 清明: 2023-04-04 18:13:00.000, 谷雨: 2023-04-20 01:14:00.000, 立夏: 2023-05-05 11:19:00.000, 小满: 2023-05-21 00:09:00.000, 芒种: 2023-06-05 15:18:00.000, 夏至: 2023-06-21 07:58:00.000, 小暑: 2023-07-07 01:31:00.000, 大暑: 2023-07-22 18:50:00.000, 立秋: 2023-08-07 11:23:00.000, 处暑: 2023-08-23 02:01:00.000, 白露: 2023-09-07 14:27:00.000, 秋分: 2023-09-22 23:50:00.000, 寒露: 2023-10-08 06:16:00.000, 霜降: 2023-10-23 09:21:00.000, 立冬: 2023-11-07 08:36:00.000, 小雪: 2023-11-22 07:03:00.000, 大雪: 2023-12-07 01:33:00.000, 冬至: 2023-12-21 19:27:00.000]
本日节气：无
```
