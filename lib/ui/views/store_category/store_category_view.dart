import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'store_category_viewmodel.dart';

class StoreCategoryView extends StackedView<StoreCategoryViewModel> {
  const StoreCategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreCategoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("StoreCategoryView")),
      ),
    );
  }

  @override
  StoreCategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreCategoryViewModel();
}
