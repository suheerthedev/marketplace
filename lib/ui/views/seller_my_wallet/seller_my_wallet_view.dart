import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_my_wallet_viewmodel.dart';

class SellerMyWalletView extends StackedView<SellerMyWalletViewModel> {
  const SellerMyWalletView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerMyWalletViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerMyWalletView")),
      ),
    );
  }

  @override
  SellerMyWalletViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerMyWalletViewModel();
}
