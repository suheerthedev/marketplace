import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_card_3_viewmodel.dart';

class ProductCard3View extends StackedView<ProductCard3ViewModel> {
  const ProductCard3View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductCard3ViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ProductCard3View")),
      ),
    );
  }

  @override
  ProductCard3ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard3ViewModel();
}
