import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:zooper_flutter_localization/services/localization_service.dart';

void main() {
  test('Parse CSV file', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    LocalizationService service = LocalizationService();
    var localization = await service.loadAsync<TestClass>('assets/localizations/test.csv');

    expect('Hallo', localization.getLocalizationByLocale('hello', const Locale('de', 'DE')));
  });

  test('Fallback value', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    LocalizationService service = LocalizationService();
    var localization = await service.loadAsync<TestClass>('assets/localizations/test.csv');

    expect('Hello', localization.getLocalizationByLocale('hello', const Locale('ru')));
  });
}

class TestClass {}
