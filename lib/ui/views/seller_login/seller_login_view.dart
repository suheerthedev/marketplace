import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_login_viewmodel.dart';

class SellerLoginView extends StackedView<SellerLoginViewModel> {
  const SellerLoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerLoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerLoginView")),
      ),
    );
  }

  @override
  SellerLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerLoginViewModel();
}
