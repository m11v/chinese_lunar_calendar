import 'package:chinese_lunar_calendar/src/utils/utils.dart';

// Convert a CST time to UTC
DateTime parseCSTToUTC(int year,
        [int month = 1,
        int day = 1,
        int hour = 0,
        int minute = 0,
        int second = 0]) =>
    DateTime.parse(
        '$year-${month.lastTwoDigitsString}-${day.lastTwoDigitsString}T${hour.lastTwoDigitsString}:${minute.lastTwoDigitsString}:${second.lastTwoDigitsString}+0800');
