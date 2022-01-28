import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:zooper_flutter_localization/zooper_flutter_localization.dart';

@injectable
class MainViewModel extends BaseViewModel {
  ZooperLocalizer titlesLocalizer;
  ZooperLocalizer errorsLocalizer;
  ZooperLocalizer<MainViewModel> viewModelLocalizer;

  MainViewModel(
    @Named('Titles') this.titlesLocalizer,
    @Named('Errors') this.errorsLocalizer,
    this.viewModelLocalizer,
  );

  String get titleCaption => titlesLocalizer['Title'];
  String get errorCaption => errorsLocalizer['Error'];
  String get viewmodelCaption => errorsLocalizer['Error'];
}
