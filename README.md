# Chinese Lunar Calendar

中国万年历查询

本项目参考 [cnLunar](https://github.com/OPN48/cnlunar/tree/master), 用Dart重写成一个Dart Package。

[![Dart CI](https://github.com/m11v/chinese_lunar_calendar/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m11v/chinese_lunar_calendar)
[![License](https://img.shields.io/github/license/m11v/chinese_lunar_calendar)](https://github.com/m11v/chinese_lunar_calendar/blob/main/LICENSE)
[![Pub](https://img.shields.io/pub/v/chinese_lunar_calendar?label=Pub)](https://pub.dev/packages/chinese_lunar_calendar)
[![Package publisher](https://img.shields.io/pub/publisher/chinese_lunar_calendar.svg)](https://pub.dev/packages/chinese_lunar_calendar/publisher)

## 功能
- 查询春节日期.

## 安装

Add the following to your `pubspec.yaml`:

```dart
dependencies:
  chinese_lunar_calendar: ^0.0.1
```

## 示例
### 查询春节日期
```dart
import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  // 输入查询年份
  var lunarCalendar = LunarCalendar(dateTime: DateTime(2000));
  // 输出春节阳历日期
  print('春节: ${lunarCalendar.chineseNewYearString}');
}

```
输出结果
```bash
春节: 2000 年 2 月 5 日
```
