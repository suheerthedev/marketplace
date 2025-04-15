import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_receive_viewmodel.dart';

class BuyerToReceiveView extends StackedView<BuyerToReceiveViewModel> {
  const BuyerToReceiveView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToReceiveViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerToReceiveView")),
      ),
    );
  }

  @override
  BuyerToReceiveViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerToReceiveViewModel();
}
