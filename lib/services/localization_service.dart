import 'dart:ui';

import 'package:zooper_flutter_localization/loaders/asset_loader.dart';
import 'package:path/path.dart' as p;
import 'package:zooper_flutter_localization/loaders/csv_loader.dart';
import 'package:zooper_flutter_localization/zooper_localizer.dart';

class LocalizationService {
  /// Loads a file and registers it's translations
  ///
  /// [pathToAsset] defines the relative path to the file. E.g.: 'assets/localizations/loc.csv'
  /// [loader] Optional parameter to define a custom loader. Default is automatically determined by the files extension
  /// [fallbackLocale] defines the locale which is returned when no matching locale was found. Default is en_US
  /// [localeDelegate] delegate to get a specific locale. Default is the systems locale
  Future<ZooperLocalizer<T>> loadAsync<T>(
    String pathToAsset, {
    AssetLoader? loader,
    Locale? fallbackLocale,
    Locale Function()? localeDelegate,
  }) async {
    // If no explicit loader is provided, try to do it with the extension
    loader = loader ??
        _getLoaderByExtension(pathToAsset, fallbackLocale, localeDelegate);

    return await loader.loadAsync<T>(pathToAsset);
  }

  AssetLoader _getLoaderByExtension(String pathToAsset, Locale? fallbackLocale,
      Locale Function()? localeDelegate) {
    final extension = p.extension(pathToAsset);

    switch (extension) {
      case '.csv':
        return CsvLoader(
          fallbackLocale,
          localeDelegate,
        );
    }

    throw Exception('No AssetLoader registered for extension $extension');
  }
}
