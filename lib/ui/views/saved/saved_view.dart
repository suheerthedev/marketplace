import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'saved_viewmodel.dart';

class SavedView extends StackedView<SavedViewModel> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SavedView")),
      ),
    );
  }

  @override
  SavedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavedViewModel();
}
