import 'dart:ui';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import '../zooper_localizer.dart';
import '../localization_entry.dart';
import '../localized_value.dart';
import 'asset_loader.dart';

class CsvLoader extends AssetLoader {
  late CsvParser _csvParser;
  Locale? fallbackLocale;
  Locale Function()? localeDelegate;

  CsvLoader(
    this.fallbackLocale,
    this.localeDelegate,
  ) {
    _csvParser = CsvParser();
  }

  @override
  Future<ZooperLocalizer<T>> loadAsync<T>(String path) async {
    var content = await rootBundle.loadString(path);
    var parsed = _csvParser.parse(content, ',');

    List<Locale> locales = [];

    // Load the available locales
    for (int i = 1; i < parsed[0].length; i++) {
      var locale = localeFromString(parsed[0][i]);
      locales.add(locale);
    }

    List<LocalizationEntry> entries = [];

    // Iterate over all lines
    for (int i = 1; i < parsed.length; i++) {
      // Iterate over all entries

      List<LocalizedValue> localizedValues = [];

      for (int n = 1; n < parsed[i].length; n++) {
        var localizedValue = LocalizedValue(locales[n - 1], parsed[i][n]);
        localizedValues.add(localizedValue);
      }

      LocalizationEntry entry =
          LocalizationEntry(parsed[i][0], localizedValues);
      entries.add(entry);
    }

    return ZooperLocalizer<T>(
      entries,
      fallbackLocale: fallbackLocale,
      localeDelegate: localeDelegate,
    );
  }
}

class CsvParser {
  late CsvToListConverter _converter;

  CsvParser() {
    _converter = const CsvToListConverter();
  }

  List<List<dynamic>> parse(String content, String fieldDelimiter) {
    return _converter.convert(content, fieldDelimiter: fieldDelimiter);
  }
}
