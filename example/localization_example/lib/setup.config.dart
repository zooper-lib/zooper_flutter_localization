// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:zooper_flutter_localization/zooper_flutter_localization.dart'
    as _i3;

import 'localizations_module.dart' as _i5;
import 'main_viewmodel.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localizationsModule = _$LocalizationsModule();
  gh.factory<_i3.LocalizationService>(
      () => localizationsModule.localizationService);
  await gh.factoryAsync<_i3.ZooperLocalizer<dynamic>>(
      () => localizationsModule
          .titlesLocalizations(get<_i3.LocalizationService>()),
      instanceName: 'Titles',
      preResolve: true);
  await gh.factoryAsync<_i3.ZooperLocalizer<dynamic>>(
      () => localizationsModule
          .errorsLocalizations(get<_i3.LocalizationService>()),
      instanceName: 'Errors',
      preResolve: true);
  await gh.factoryAsync<_i3.ZooperLocalizer<_i4.MainViewModel>>(
      () => localizationsModule
          .viewModelLocalizations(get<_i3.LocalizationService>()),
      preResolve: true);
  gh.factory<_i4.MainViewModel>(() => _i4.MainViewModel(
      get<_i3.ZooperLocalizer<dynamic>>(instanceName: 'Titles'),
      get<_i3.ZooperLocalizer<dynamic>>(instanceName: 'Errors'),
      get<_i3.ZooperLocalizer<_i4.MainViewModel>>()));
  return get;
}

class _$LocalizationsModule extends _i5.LocalizationsModule {
  @override
  _i3.LocalizationService get localizationService => _i3.LocalizationService();
}
