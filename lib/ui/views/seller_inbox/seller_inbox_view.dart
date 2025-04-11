import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_inbox_viewmodel.dart';

class SellerInboxView extends StackedView<SellerInboxViewModel> {
  const SellerInboxView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerInboxViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerInboxView")),
      ),
    );
  }

  @override
  SellerInboxViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerInboxViewModel();
}
