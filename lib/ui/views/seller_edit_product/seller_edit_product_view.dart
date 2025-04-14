import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_edit_product_viewmodel.dart';

class SellerEditProductView extends StackedView<SellerEditProductViewModel> {
  const SellerEditProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerEditProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerEditProductView")),
      ),
    );
  }

  @override
  SellerEditProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerEditProductViewModel();
}
