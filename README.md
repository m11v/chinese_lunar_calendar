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
$ dart

pub add
chinese_lunar_calendar
```

With Flutter:

```dart
$ flutter

pub add
chinese_lunar_calendar
```

## 示例

```dart
import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  /// 创建LunarCalendar：
  /// 输入查询日期，
  final lunarCalendar = LunarCalendar(
    utcDateTime: DateTime(2025, 1, 29, 10, 30).toUtc(),
  );

  print('中国标准时间：${lunarCalendar.cst}');
  print('本地时间：${lunarCalendar.localTime}');
  print(lunarCalendar.useCSTToCalculate ? '使用中国标准时间计算：' : '使用本地时间计算');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.year}, ${lunarCalendar.lunarDate.month}, ${lunarCalendar.lunarDate
          .day}, 闰月：${lunarCalendar.lunarDate.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
  print('八字: ${lunarCalendar.eightChar}');
  print('星期：${lunarCalendar.weekDayCN}');
  print('月相：${lunarCalendar.phaseOfMoon}');
  print('本年节气: ${getSolarTerms(lunarCalendar.dateTime.year)}');
  print('本日节气：${lunarCalendar.dateTime.getSolarTerm()}');
  print(
      '当前时辰：${lunarCalendar.twoHourPeriod.steamName}${lunarCalendar.twoHourPeriod.name}${lunarCalendar.twoHourPeriod
          .ke.name}');

  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
  '${e.twoHourPeriodIndex}: ${e.nameInTheDay} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  print('本日时辰：$twoHourPeriodsString');
}

```

输出结果

```text
中国标准时间：2025-01-30 02:30:00.000Z
本地时间：2025-01-29 10:30:00.000
使用本地时间计算
春节: 2025年1月29日
阴历数字: 2025, 1, 1, 闰月：false
阴历汉字: 二零二五 乙巳[Located(蛇, 蛇)]年 Located(, )Located(正月, 正月)大初一
八字: 乙巳 丁丑 戊戌 丁巳
星期：星期三
月相：Located(朔, 朔)
本年节气: [SolarTerm(name: Located(小寒, 小寒), CST: 2025-01-05 10:33:00.000Z, UTC: 2025-01-05 02:33:00.000Z, Local: 2025-01-04 18:33:00.000), SolarTerm(name: Located(大寒, 大寒), CST: 2025-01-20 04:00:00.000Z, UTC: 2025-01-19 20:00:00.000Z, Local: 2025-01-19 12:00:00.000), SolarTerm(name: Located(立春, 立春), CST: 2025-02-03 22:10:00.000Z, UTC: 2025-02-03 14:10:00.000Z, Local: 2025-02-03 06:10:00.000), SolarTerm(name: Located(雨水, 雨水), CST: 2025-02-18 18:07:00.000Z, UTC: 2025-02-18 10:07:00.000Z, Local: 2025-02-18 02:07:00.000), SolarTerm(name: Located(驚蟄, 惊蛰), CST: 2025-03-05 16:07:00.000Z, UTC: 2025-03-05 08:07:00.000Z, Local: 2025-03-05 00:07:00.000), SolarTerm(name: Located(春分, 春分), CST: 2025-03-20 17:01:00.000Z, UTC: 2025-03-20 09:01:00.000Z, Local: 2025-03-20 02:01:00.000), SolarTerm(name: Located(清明, 清明), CST: 2025-04-04 20:48:00.000Z, UTC: 2025-04-04 12:48:00.000Z, Local: 2025-04-04 05:48:00.000), SolarTerm(name: Located(穀雨, 谷雨), CST: 2025-04-20 03:56:00.000Z, UTC: 2025-04-19 19:56:00.000Z, Local: 2025-04-19 12:56:00.000), SolarTerm(name: Located(立夏, 立夏), CST: 2025-05-05 13:57:00.000Z, UTC: 2025-05-05 05:57:00.000Z, Local: 2025-05-04 22:57:00.000), SolarTerm(name: Located(小滿, 小满), CST: 2025-05-21 02:55:00.000Z, UTC: 2025-05-20 18:55:00.000Z, Local: 2025-05-20 11:55:00.000), SolarTerm(name: Located(芒種, 芒种), CST: 2025-06-05 17:56:00.000Z, UTC: 2025-06-05 09:56:00.000Z, Local: 2025-06-05 02:56:00.000), SolarTerm(name: Located(夏至, 夏至), CST: 2025-06-21 10:42:00.000Z, UTC: 2025-06-21 02:42:00.000Z, Local: 2025-06-20 19:42:00.000), SolarTerm(name: Located(小暑, 小暑), CST: 2025-07-07 04:05:00.000Z, UTC: 2025-07-06 20:05:00.000Z, Local: 2025-07-06 13:05:00.000), SolarTerm(name: Located(大暑, 大暑), CST: 2025-07-22 21:29:00.000Z, UTC: 2025-07-22 13:29:00.000Z, Local: 2025-07-22 06:29:00.000), SolarTerm(name: Located(立秋, 立秋), CST: 2025-08-07 13:52:00.000Z, UTC: 2025-08-07 05:52:00.000Z, Local: 2025-08-06 22:52:00.000), SolarTerm(name: Located(處暑, 处暑), CST: 2025-08-23 04:34:00.000Z, UTC: 2025-08-22 20:34:00.000Z, Local: 2025-08-22 13:34:00.000), SolarTerm(name: Located(白露, 白露), CST: 2025-09-07 16:52:00.000Z, UTC: 2025-09-07 08:52:00.000Z, Local: 2025-09-07 01:52:00.000), SolarTerm(name: Located(秋分, 秋分), CST: 2025-09-23 02:19:00.000Z, UTC: 2025-09-22 18:19:00.000Z, Local: 2025-09-22 11:19:00.000), SolarTerm(name: Located(寒露, 寒露), CST: 2025-10-08 08:41:00.000Z, UTC: 2025-10-08 00:41:00.000Z, Local: 2025-10-07 17:41:00.000), SolarTerm(name: Located(霜降, 霜降), CST: 2025-10-23 11:51:00.000Z, UTC: 2025-10-23 03:51:00.000Z, Local: 2025-10-22 20:51:00.000), SolarTerm(name: Located(立冬, 立冬), CST: 2025-11-07 12:04:00.000Z, UTC: 2025-11-07 04:04:00.000Z, Local: 2025-11-06 20:04:00.000), SolarTerm(name: Located(小雪, 小雪), CST: 2025-11-22 09:36:00.000Z, UTC: 2025-11-22 01:36:00.000Z, Local: 2025-11-21 17:36:00.000), SolarTerm(name: Located(大雪, 大雪), CST: 2025-12-07 05:05:00.000Z, UTC: 2025-12-06 21:05:00.000Z, Local: 2025-12-06 13:05:00.000), SolarTerm(name: Located(冬至, 冬至), CST: 2025-12-21 23:03:00.000Z, UTC: 2025-12-21 15:03:00.000Z, Local: 2025-12-21 07:03:00.000)]
本日节气：null
当前时辰：丁巳正 三刻
本日时辰：[0: 壬子 (Located(夜半, 夜半)) Located(膽, 胆) Located(兇, 凶), 1: 癸丑 (Located(雞鳴, 鸡鸣)) Located(肝, 肝) Located(兇, 凶), 2: 甲寅 (Located(平旦, 平旦)) Located(肺, 肺) Located(吉, 吉), 3: 乙卯 (Located(日出, 日出)) Located(大腸, 大肠) Located(兇, 凶), 4: 丙辰 (Located(食時, 食时)) Located(胃, 胃) Located(吉, 吉), 5: 丁巳 (Located(隅中, 隅中)) Located(脾, 脾) Located(吉, 吉), 6: 戊午 (Located(日中, 日中)) Located(心, 心) Located(兇, 凶), 7: 己未 (Located(日昳, 日昳)) Located(小腸, 小肠) Located(兇, 凶), 8: 庚申 (Located(晡時, 晡时)) Located(膀胱, 膀胱) Located(吉, 吉), 9: 辛酉 (Located(日入, 日入)) Located(腎, 肾) Located(吉, 吉), 10: 壬戌 (Located(黃昏, 黄昏)) Located(心包, 心包) Located(兇, 凶), 11: 癸亥 (Located(人定, 人定)) Located(三焦, 三焦) Located(吉, 吉)]
```
