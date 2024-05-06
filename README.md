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
    utcDateTime: DateTime(2023, 6, 5, 10, 30).toUtc(),
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
中国标准时间：2023-06-06 01:30:00.000Z
本地时间：2023-06-05 10:30:00.000
使用本地时间计算
春节: 2023年1月22日
阴历数字: 2023, 4, 18, 闰月：false
阴历汉字: 二零二三 癸卯[Located(兔, 兔)]年 Located(, )Located(四月, 四月)大十八
八字: 癸卯 戊午 甲午 己巳
星期：星期一
月相：Located(漸虧凸月, 渐亏凸月)
本年节气: [SolarTerm(name: Located(小寒, 小寒), CST: 2023-01-05 23:05:00.000Z, UTC: 2023-01-05 15:05:00.000Z, Local: 2023-01-05 07:05:00.000), SolarTerm(name: Located(大寒, 大寒), CST: 2023-01-20 16:30:00.000Z, UTC: 2023-01-20 08:30:00.000Z, Local: 2023-01-20 00:30:00.000), SolarTerm(name: Located(立春, 立春), CST: 2023-02-04 10:43:00.000Z, UTC: 2023-02-04 02:43:00.000Z, Local: 2023-02-03 18:43:00.000), SolarTerm(name: Located(雨水, 雨水), CST: 2023-02-19 06:34:00.000Z, UTC: 2023-02-18 22:34:00.000Z, Local: 2023-02-18 14:34:00.000), SolarTerm(name: Located(驚蟄, 惊蛰), CST: 2023-03-06 04:36:00.000Z, UTC: 2023-03-05 20:36:00.000Z, Local: 2023-03-05 12:36:00.000), SolarTerm(name: Located(春分, 春分), CST: 2023-03-21 05:24:00.000Z, UTC: 2023-03-20 21:24:00.000Z, Local: 2023-03-20 14:24:00.000), SolarTerm(name: Located(清明, 清明), CST: 2023-04-05 09:13:00.000Z, UTC: 2023-04-05 01:13:00.000Z, Local: 2023-04-04 18:13:00.000), SolarTerm(name: Located(穀雨, 谷雨), CST: 2023-04-20 16:14:00.000Z, UTC: 2023-04-20 08:14:00.000Z, Local: 2023-04-20 01:14:00.000), SolarTerm(name: Located(立夏, 立夏), CST: 2023-05-06 02:19:00.000Z, UTC: 2023-05-05 18:19:00.000Z, Local: 2023-05-05 11:19:00.000), SolarTerm(name: Located(小滿, 小满), CST: 2023-05-21 15:09:00.000Z, UTC: 2023-05-21 07:09:00.000Z, Local: 2023-05-21 00:09:00.000), SolarTerm(name: Located(芒種, 芒种), CST: 2023-06-06 06:18:00.000Z, UTC: 2023-06-05 22:18:00.000Z, Local: 2023-06-05 15:18:00.000), SolarTerm(name: Located(夏至, 夏至), CST: 2023-06-21 22:58:00.000Z, UTC: 2023-06-21 14:58:00.000Z, Local: 2023-06-21 07:58:00.000), SolarTerm(name: Located(小暑, 小暑), CST: 2023-07-07 16:31:00.000Z, UTC: 2023-07-07 08:31:00.000Z, Local: 2023-07-07 01:31:00.000), SolarTerm(name: Located(大暑, 大暑), CST: 2023-07-23 09:50:00.000Z, UTC: 2023-07-23 01:50:00.000Z, Local: 2023-07-22 18:50:00.000), SolarTerm(name: Located(立秋, 立秋), CST: 2023-08-08 02:23:00.000Z, UTC: 2023-08-07 18:23:00.000Z, Local: 2023-08-07 11:23:00.000), SolarTerm(name: Located(處暑, 处暑), CST: 2023-08-23 17:01:00.000Z, UTC: 2023-08-23 09:01:00.000Z, Local: 2023-08-23 02:01:00.000), SolarTerm(name: Located(白露, 白露), CST: 2023-09-08 05:27:00.000Z, UTC: 2023-09-07 21:27:00.000Z, Local: 2023-09-07 14:27:00.000), SolarTerm(name: Located(秋分, 秋分), CST: 2023-09-23 14:50:00.000Z, UTC: 2023-09-23 06:50:00.000Z, Local: 2023-09-22 23:50:00.000), SolarTerm(name: Located(寒露, 寒露), CST: 2023-10-08 21:16:00.000Z, UTC: 2023-10-08 13:16:00.000Z, Local: 2023-10-08 06:16:00.000), SolarTerm(name: Located(霜降, 霜降), CST: 2023-10-24 00:21:00.000Z, UTC: 2023-10-23 16:21:00.000Z, Local: 2023-10-23 09:21:00.000), SolarTerm(name: Located(立冬, 立冬), CST: 2023-11-08 00:36:00.000Z, UTC: 2023-11-07 16:36:00.000Z, Local: 2023-11-07 08:36:00.000), SolarTerm(name: Located(小雪, 小雪), CST: 2023-11-22 23:03:00.000Z, UTC: 2023-11-22 15:03:00.000Z, Local: 2023-11-22 07:03:00.000), SolarTerm(name: Located(大雪, 大雪), CST: 2023-12-07 17:33:00.000Z, UTC: 2023-12-07 09:33:00.000Z, Local: 2023-12-07 01:33:00.000), SolarTerm(name: Located(冬至, 冬至), CST: 2023-12-22 11:27:00.000Z, UTC: 2023-12-22 03:27:00.000Z, Local: 2023-12-21 19:27:00.000)]
本日节气：SolarTerm(name: Located(芒種, 芒种), CST: 2023-06-06 06:18:00.000Z, UTC: 2023-06-05 22:18:00.000Z, Local: 2023-06-05 15:18:00.000)
当前时辰：己巳正 三刻
本日时辰：[0: 甲子 (Located(夜半, 夜半)) Located(膽, 胆) Located(吉, 吉), 1: 乙丑 (Located(雞鳴, 鸡鸣)) Located(肝, 肝) Located(吉, 吉), 2: 丙寅 (Located(平旦, 平旦)) Located(肺, 肺) Located(兇, 凶), 3: 丁卯 (Located(日出, 日出)) Located(大腸, 大肠) Located(吉, 吉), 4: 戊辰 (Located(食時, 食时)) Located(胃, 胃) Located(兇, 凶), 5: 己巳 (Located(隅中, 隅中)) Located(脾, 脾) Located(兇, 凶), 6: 庚午 (Located(日中, 日中)) Located(心, 心) Located(吉, 吉), 7: 辛未 (Located(日昳, 日昳)) Located(小腸, 小肠) Located(兇, 凶), 8: 壬申 (Located(晡時, 晡时)) Located(膀胱, 膀胱) Located(吉, 吉), 9: 癸酉 (Located(日入, 日入)) Located(腎, 肾) Located(吉, 吉), 10: 甲戌 (Located(黃昏, 黄昏)) Located(心包, 心包) Located(兇, 凶), 11: 乙亥 (Located(人定, 人定)) Located(三焦, 三焦) Located(兇, 凶)]
```
