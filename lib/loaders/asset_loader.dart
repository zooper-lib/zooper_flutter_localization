import 'dart:ui';

import 'package:zooper_flutter_localization/zooper_localizer.dart';

abstract class AssetLoader {
  Future<ZooperLocalizer<T>> loadAsync<T>(String path);

  Locale localeFromString(String localeString) {
    final localeList = localeString.split('_');
    switch (localeList.length) {
      case 2:
        return Locale(localeList.first, localeList.last);
      case 3:
        return Locale.fromSubtags(
            languageCode: localeList.first, scriptCode: localeList[1], countryCode: localeList.last);
      default:
        return Locale(localeList.first);
    }
  }
}
