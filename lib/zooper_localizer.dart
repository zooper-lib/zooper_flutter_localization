import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import 'localization_entry.dart';
import 'package:collection/collection.dart';

/// Model that holds all the localized entries
class ZooperLocalizer<T> {
  /// The entries of the loaded file
  List<LocalizationEntry> entries;

  /// The locale which is used as fallback value
  late Locale _fallbackLocale;

  /// The function how to get the locale.
  /// Default is the devices locale
  late ValueGetter<Locale> _getLocale;

  ZooperLocalizer(this.entries,
      {Locale? fallbackLocale, ui.Locale Function()? localeDelegate}) {
    _fallbackLocale = fallbackLocale ?? const ui.Locale('en', 'US');

    // If no function is provided, the locale is the device locale
    _getLocale = localeDelegate ?? () => ui.window.locale;
  }

  String operator [](String key) => getLocalizationByLocale(key, _getLocale());

  String getLocalization(String key) =>
      getLocalizationByLocale(key, _getLocale());

  String getLocalizationByLocale(String key, Locale locale) {
    var entry = entries.firstWhereOrNull((element) => element.key == key);

    if (entry == null) {
      log('No entry found for key $key');
      return '';
    }

    var localizedValue = entry.localizedValues
        .firstWhereOrNull((element) => element.locale == locale);

    if (localizedValue != null) {
      return localizedValue.localeValue;
    }

    if (localizedValue == null) {
      var fallbackEntry = entry.localizedValues
          .firstWhereOrNull((element) => element.locale == _fallbackLocale);

      if (fallbackEntry == null) {
        throw Exception(
            'Whether the value for the current locale nor the value for the fallback locale has been found for key $key');
      }

      return fallbackEntry.localeValue;
    }

    throw Exception('Something really bad happened, need to fix this!');
  }

  LocalizationEntry? getLocalizationEntry(String key) {
    return entries.firstWhereOrNull((element) => element.key == key);
  }
}
