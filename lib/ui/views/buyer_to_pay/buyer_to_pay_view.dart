import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_pay_viewmodel.dart';

class BuyerToPayView extends StackedView<BuyerToPayViewModel> {
  const BuyerToPayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToPayViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerToPayView")),
      ),
    );
  }

  @override
  BuyerToPayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerToPayViewModel();
}
