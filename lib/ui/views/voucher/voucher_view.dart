import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'voucher_viewmodel.dart';

class VoucherView extends StackedView<VoucherViewModel> {
  const VoucherView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VoucherViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("VoucherView")),
      ),
    );
  }

  @override
  VoucherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VoucherViewModel();
}
