import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'category_viewmodel.dart';

class CategoryView extends StackedView<CategoryViewModel> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("CategoryView")),
      ),
    );
  }

  @override
  CategoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoryViewModel();
}
