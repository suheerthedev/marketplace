import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_help_center_viewmodel.dart';

class SellerHelpCenterView extends StackedView<SellerHelpCenterViewModel> {
  const SellerHelpCenterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerHelpCenterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerHelpCenterView")),
      ),
    );
  }

  @override
  SellerHelpCenterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerHelpCenterViewModel();
}
