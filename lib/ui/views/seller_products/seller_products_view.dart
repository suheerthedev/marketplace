import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_products_viewmodel.dart';

class SellerProductsView extends StackedView<SellerProductsViewModel> {
  const SellerProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerProductsView")),
      ),
    );
  }

  @override
  SellerProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProductsViewModel();
}
