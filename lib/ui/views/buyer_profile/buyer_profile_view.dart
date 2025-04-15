import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_profile_viewmodel.dart';

class BuyerProfileView extends StackedView<BuyerProfileViewModel> {
  const BuyerProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerProfileView")),
      ),
    );
  }

  @override
  BuyerProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerProfileViewModel();
}
