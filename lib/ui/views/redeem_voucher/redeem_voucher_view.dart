import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'redeem_voucher_viewmodel.dart';

class RedeemVoucherView extends StackedView<RedeemVoucherViewModel> {
  const RedeemVoucherView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RedeemVoucherViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("RedeemVoucherView")),
      ),
    );
  }

  @override
  RedeemVoucherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RedeemVoucherViewModel();
}
