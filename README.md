# Chinese Lunar Calendar

中国万年历

本项目主要参考 [cnLunar](https://github.com/OPN48/cnlunar/tree/master), 用Dart重写成一个Dart Package。

计算时间范围为1900年至2100年。

本地运行，无远程API依赖。

[![Dart CI](https://github.com/m11v/chinese_lunar_calendar/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/m11v/chinese_lunar_calendar)
[![License](https://img.shields.io/github/license/m11v/chinese_lunar_calendar)](https://github.com/m11v/chinese_lunar_calendar/blob/main/LICENSE)
[![Pub](https://img.shields.io/pub/v/chinese_lunar_calendar?label=Pub)](https://pub.dev/packages/chinese_lunar_calendar)
[![Package publisher](https://img.shields.io/pub/publisher/chinese_lunar_calendar.svg)](https://pub.dev/packages/chinese_lunar_calendar/publisher)

## 功能

* 生成农历日期、干支纪年、生肖、春节、节气、时辰、八字等。
* 字符串支持简体中文与繁体中文。

## 安装

Run this command:

With Dart:

```text
$ dart pub add chinese_lunar_calendar
```

With Flutter:

```text
$ flutter pub add chinese_lunar_calendar
```

## 示例

```dart
import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final lunarCalendar = LunarCalendar.from(
    utcDateTime: DateTime(2024, 2, 6, 22, 30).toUtc(),
  );

  print('中国标准时间：${lunarCalendar.cst}');
  print('本地时间：${lunarCalendar.localTime}');
  print('使用本地时间计算');
  print('春节: ${lunarCalendar.chineseNewYearString}');
  print('生肖: ${lunarCalendar.zodiac}');
  print(
      '阴历数字: ${lunarCalendar.lunarDate.lunarYear.number}, ${lunarCalendar.lunarDate.lunarMonth
          .number}, ${lunarCalendar.lunarDate.lunarDay}, 闰月：${lunarCalendar.lunarDate.lunarMonth.isLeapMonth}');
  print('阴历汉字: ${lunarCalendar.lunarDate.fullCNString}');
  print('八字: ${lunarCalendar.eightChar}');
  print('星期：${lunarCalendar.weekday.name}');
  print('月相：${lunarCalendar.moonPhase}');
  print('本年节气: ${getSolarTerms(lunarCalendar.localTime.year)}');
  print('本日节气：${lunarCalendar.localTime.getSolarTerm()}');
  print(
      '当前时辰：${lunarCalendar.twoHourPeriod.name}(${lunarCalendar.twoHourPeriod.jing?.cnName}${lunarCalendar
          .twoHourPeriod.jing?.unit})${lunarCalendar.ke.fullName}${lunarCalendar.ke.unitName}');

  final twoHourPeriodsString = lunarCalendar.twoHourPeriodList
      .map((e) =>
  '${e.twoHourPeriodIndex}: ${e.name} (${e.nameInHanDynasty}) ${e.meridian} ${e.isLuckyName}')
      .toList();
  print('本日时辰：$twoHourPeriodsString');
}

```

### 输出结果

```text
中国标准时间：2024-02-07 14:30:00.000Z
本地时间：2024-02-06 22:30:00.000
使用本地时间计算
春节: 2024年2月10日
生肖: Zodiac(3, Located(兔, 兔))
阴历数字: 2023, 12, 27, 闰月：false
阴历汉字: 二零二三年 Located(, )Located(臘月, 腊月)大廿七
八字: 癸卯 丙寅 庚子 丁亥
星期：星期二
月相：MoonPhase(27, 7, Located(下蛾眉月, 下蛾眉月))
本年节气: [SolarTerm(name: Located(小寒, 小寒), index: 0, CST: 2024-01-06 04:49:00.000Z, UTC: 2024-01-05 20:49:00.000Z, Local: 2024-01-05 12:49:00.000), SolarTerm(name: Located(大寒, 大寒), index: 1, CST: 2024-01-20 22:07:00.000Z, UTC: 2024-01-20 14:07:00.000Z, Local: 2024-01-20 06:07:00.000), SolarTerm(name: Located(立春, 立春), index: 2, CST: 2024-02-04 16:27:00.000Z, UTC: 2024-02-04 08:27:00.000Z, Local: 2024-02-04 00:27:00.000), SolarTerm(name: Located(雨水, 雨水), index: 3, CST: 2024-02-19 12:13:00.000Z, UTC: 2024-02-19 04:13:00.000Z, Local: 2024-02-18 20:13:00.000), SolarTerm(name: Located(驚蟄, 惊蛰), index: 4, CST: 2024-03-05 10:23:00.000Z, UTC: 2024-03-05 02:23:00.000Z, Local: 2024-03-04 18:23:00.000), SolarTerm(name: Located(春分, 春分), index: 5, CST: 2024-03-20 11:06:00.000Z, UTC: 2024-03-20 03:06:00.000Z, Local: 2024-03-19 20:06:00.000), SolarTerm(name: Located(清明, 清明), index: 6, CST: 2024-04-04 15:02:00.000Z, UTC: 2024-04-04 07:02:00.000Z, Local: 2024-04-04 00:02:00.000), SolarTerm(name: Located(穀雨, 谷雨), index: 7, CST: 2024-04-19 22:00:00.000Z, UTC: 2024-04-19 14:00:00.000Z, Local: 2024-04-19 07:00:00.000), SolarTerm(name: Located(立夏, 立夏), index: 8, CST: 2024-05-05 08:10:00.000Z, UTC: 2024-05-05 00:10:00.000Z, Local: 2024-05-04 17:10:00.000), SolarTerm(name: Located(小滿, 小满), index: 9, CST: 2024-05-20 20:59:00.000Z, UTC: 2024-05-20 12:59:00.000Z, Local: 2024-05-20 05:59:00.000), SolarTerm(name: Located(芒種, 芒种), index: 10, CST: 2024-06-05 12:10:00.000Z, UTC: 2024-06-05 04:10:00.000Z, Local: 2024-06-04 21:10:00.000), SolarTerm(name: Located(夏至, 夏至), index: 11, CST: 2024-06-21 04:51:00.000Z, UTC: 2024-06-20 20:51:00.000Z, Local: 2024-06-20 13:51:00.000), SolarTerm(name: Located(小暑, 小暑), index: 12, CST: 2024-07-06 22:20:00.000Z, UTC: 2024-07-06 14:20:00.000Z, Local: 2024-07-06 07:20:00.000), SolarTerm(name: Located(大暑, 大暑), index: 13, CST: 2024-07-22 15:44:00.000Z, UTC: 2024-07-22 07:44:00.000Z, Local: 2024-07-22 00:44:00.000), SolarTerm(name: Located(立秋, 立秋), index: 14, CST: 2024-08-07 08:09:00.000Z, UTC: 2024-08-07 00:09:00.000Z, Local: 2024-08-06 17:09:00.000), SolarTerm(name: Located(處暑, 处暑), index: 15, CST: 2024-08-22 22:55:00.000Z, UTC: 2024-08-22 14:55:00.000Z, Local: 2024-08-22 07:55:00.000), SolarTerm(name: Located(白露, 白露), index: 16, CST: 2024-09-07 11:11:00.000Z, UTC: 2024-09-07 03:11:00.000Z, Local: 2024-09-06 20:11:00.000), SolarTerm(name: Located(秋分, 秋分), index: 17, CST: 2024-09-22 20:44:00.000Z, UTC: 2024-09-22 12:44:00.000Z, Local: 2024-09-22 05:44:00.000), SolarTerm(name: Located(寒露, 寒露), index: 18, CST: 2024-10-08 03:00:00.000Z, UTC: 2024-10-07 19:00:00.000Z, Local: 2024-10-07 12:00:00.000), SolarTerm(name: Located(霜降, 霜降), index: 19, CST: 2024-10-23 06:15:00.000Z, UTC: 2024-10-22 22:15:00.000Z, Local: 2024-10-22 15:15:00.000), SolarTerm(name: Located(立冬, 立冬), index: 20, CST: 2024-11-07 06:20:00.000Z, UTC: 2024-11-06 22:20:00.000Z, Local: 2024-11-06 14:20:00.000), SolarTerm(name: Located(小雪, 小雪), index: 21, CST: 2024-11-22 03:56:00.000Z, UTC: 2024-11-21 19:56:00.000Z, Local: 2024-11-21 11:56:00.000), SolarTerm(name: Located(大雪, 大雪), index: 22, CST: 2024-12-06 23:17:00.000Z, UTC: 2024-12-06 15:17:00.000Z, Local: 2024-12-06 07:17:00.000), SolarTerm(name: Located(冬至, 冬至), index: 23, CST: 2024-12-21 17:21:00.000Z, UTC: 2024-12-21 09:21:00.000Z, Local: 2024-12-21 01:21:00.000)]
本日节气：null
当前时辰：丁亥(二更)正三刻
本日时辰：[0: 丙子 (Located(夜半, 夜半)) Located(膽, 胆) Located(吉, 吉), 1: 丁丑 (Located(雞鳴, 鸡鸣)) Located(肝, 肝) Located(吉, 吉), 2: 戊寅 (Located(平旦, 平旦)) Located(肺, 肺) Located(兇, 凶), 3: 己卯 (Located(日出, 日出)) Located(大腸, 大肠) Located(吉, 吉), 4: 庚辰 (Located(食時, 食时)) Located(胃, 胃) Located(兇, 凶), 5: 辛巳 (Located(隅中, 隅中)) Located(脾, 脾) Located(兇, 凶), 6: 壬午 (Located(日中, 日中)) Located(心, 心) Located(吉, 吉), 7: 癸未 (Located(日昳, 日昳)) Located(小腸, 小肠) Located(兇, 凶), 8: 甲申 (Located(晡時, 晡时)) Located(膀胱, 膀胱) Located(吉, 吉), 9: 乙酉 (Located(日入, 日入)) Located(腎, 肾) Located(吉, 吉), 10: 丙戌 (Located(黃昏, 黄昏)) Located(心包, 心包) Located(兇, 凶), 11: 丁亥 (Located(人定, 人定)) Located(三焦, 三焦) Located(兇, 凶)]
```
