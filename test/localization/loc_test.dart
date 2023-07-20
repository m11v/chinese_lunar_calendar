import 'package:chinese_lunar_calendar/chinese_lunar_calendar.dart';
import 'package:test/test.dart';

void main() {
  group('Test localization', () {
    test('Throw error if call Loc.get without call Loc.create before', () {
      expect(() => Loc.get(), throwsA(TypeMatcher<NoLocError>()));
    });

    test('Test localization', () {
      Loc.create();
      expect(Loc.get().run, '闰');

      Loc.create(isSimplifiedCN: false);
      expect(Loc.get().run, '閏');

      Loc.create(isSimplifiedCN: true);
      expect(Loc.get().run, '闰');
    });

    test('Test Loc.dispose', () {
      Loc.dispose();
      expect(() => Loc.get(), throwsA(TypeMatcher<NoLocError>()));
    });
  });
}
