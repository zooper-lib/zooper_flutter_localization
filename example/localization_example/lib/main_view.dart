import 'package:flutter/material.dart';
import 'package:localization_example/main_viewmodel.dart';
import 'package:localization_example/setup.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => getIt.get(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          children: [
            Text(model.titleCaption),
            Text(model.errorCaption),
            Text(model.viewmodelCaption),
          ],
        ),
      ),
    );
  }
}
