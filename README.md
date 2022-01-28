# zooper_flutter_localization

A simple localization library which aims to have multiple localization files.
This lib is aimed to work with [get_it](https://pub.dev/packages/get_it) or [injectable](https://pub.dev/packages/injectable),
but it should works for any other framework.

## Example

This example aims to use this package with injectable, but you should be able to implement it with any other framework, or even without

### Importing

Add this line to your `pubspec.yaml`:

``` yaml
zooper_flutter_localization: <latest>
```

and inside your dart class:

``` dart 
import 'package:zooper_flutter_localization/zooper_flutter_localization.dart';
```

### Registering with injectable

If you want to register a localizer for a specific View (better use ViewModels if you use the MVVM Pattern),
you can define a Module with injectable:

``` dart
import 'package:injectable/injectable.dart';
import 'package:zooper_flutter_localization/zooper_flutter_localization.dart';

@module
abstract class LocalizationModule {
  LocalizationService get localizationService;

  @preResolve
  Future<ZooperLocalizer<TestView>> testViewModelLocalizations(
          LocalizationService localizationService) =>
      localizationService.registerAsync<TestView>(
          'assets/localizations/localizations.csv');
}
```

This registers a `ZooperLocalizer` with the `TestView` and loads the translations from the defined file.
Then you can inject it easily:

``` dart
class TestView {
  late final ZooperLocalizer<TestViewModel> _localizer;

  TestView(this._localizer);
}
```

### Accessing a translation

This can be done in multiple ways. Easist is this:

``` dart
_localizer['Hello'];
```

but you can do also:

``` dart
_localizer.getLocalization('Hello');
```

or with a specific locale:

``` dart
_localizer.getLocalizationByLocale('Hello', Locale('de', 'DE'))
```