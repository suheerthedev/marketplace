import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_account_viewmodel.dart';

class SellerAccountView extends StackedView<SellerAccountViewModel> {
  const SellerAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerAccountViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerAccountView")),
      ),
    );
  }

  @override
  SellerAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerAccountViewModel();
}
