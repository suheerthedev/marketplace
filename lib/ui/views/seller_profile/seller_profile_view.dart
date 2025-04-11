import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_profile_viewmodel.dart';

class SellerProfileView extends StackedView<SellerProfileViewModel> {
  const SellerProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerProfileView")),
      ),
    );
  }

  @override
  SellerProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerProfileViewModel();
}
