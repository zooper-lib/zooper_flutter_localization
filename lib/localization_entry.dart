import 'localized_value.dart';

/// Model that holds the key and all of it's translations
class LocalizationEntry {
  String key;
  List<LocalizedValue> localizedValues;

  LocalizationEntry(this.key, this.localizedValues);
}
