import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_login_viewmodel.dart';

class BuyerLoginView extends StackedView<BuyerLoginViewModel> {
  const BuyerLoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerLoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerLoginView")),
      ),
    );
  }

  @override
  BuyerLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerLoginViewModel();
}
