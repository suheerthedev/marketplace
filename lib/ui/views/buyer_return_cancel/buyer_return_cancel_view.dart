import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_return_cancel_viewmodel.dart';

class BuyerReturnCancelView extends StackedView<BuyerReturnCancelViewModel> {
  const BuyerReturnCancelView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerReturnCancelViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerReturnCancelView")),
      ),
    );
  }

  @override
  BuyerReturnCancelViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerReturnCancelViewModel();
}
