import 'package:injectable/injectable.dart';
import 'package:localization_example/main_viewmodel.dart';
import 'package:zooper_flutter_localization/zooper_flutter_localization.dart';

@module
abstract class LocalizationsModule {
  LocalizationService get localizationService;

  @preResolve
  @Named('Titles')
  Future<ZooperLocalizer> titlesLocalizations(LocalizationService localizationService) =>
      localizationService.loadAsync('assets/localizations/titles.csv');

  @preResolve
  @Named('Errors')
  Future<ZooperLocalizer> errorsLocalizations(LocalizationService localizationService) =>
      localizationService.loadAsync('assets/localizations/errors.csv');

  @preResolve
  Future<ZooperLocalizer<MainViewModel>> viewModelLocalizations(LocalizationService localizationService) =>
      localizationService.loadAsync('assets/localizations/errors.csv');
}
