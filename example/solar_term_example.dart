import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';

void main() {
  final solarTermsIn2003 = getSolarTerms(2023);
  for (SolarTerm solarTerm in solarTermsIn2003) {
    print(solarTerm);
  }
}
