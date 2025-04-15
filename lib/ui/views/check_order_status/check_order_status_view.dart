import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'check_order_status_viewmodel.dart';

class CheckOrderStatusView extends StackedView<CheckOrderStatusViewModel> {
  const CheckOrderStatusView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckOrderStatusViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("CheckOrderStatusView")),
      ),
    );
  }

  @override
  CheckOrderStatusViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckOrderStatusViewModel();
}
