import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_help_center_viewmodel.dart';

class BuyerHelpCenterView extends StackedView<BuyerHelpCenterViewModel> {
  const BuyerHelpCenterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerHelpCenterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerHelpCenterView")),
      ),
    );
  }

  @override
  BuyerHelpCenterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerHelpCenterViewModel();
}
