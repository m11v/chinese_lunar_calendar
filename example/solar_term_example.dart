import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final solarTermsIn2004 = getSolarTerms(2024);
  for (SolarTerm solarTerm in solarTermsIn2004) {
    print(solarTerm);
  }

  print('今日节气：$todaySolarTerm');
  print('下一个节气：$nextSolarTerm');
}
