import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'store_products_viewmodel.dart';

class StoreProductsView extends StackedView<StoreProductsViewModel> {
  const StoreProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("StoreProductsView")),
      ),
    );
  }

  @override
  StoreProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreProductsViewModel();
}
