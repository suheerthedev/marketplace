import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_add_product_viewmodel.dart';

class SellerAddProductView extends StackedView<SellerAddProductViewModel> {
  const SellerAddProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerAddProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerAddProductView")),
      ),
    );
  }

  @override
  SellerAddProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerAddProductViewModel();
}
