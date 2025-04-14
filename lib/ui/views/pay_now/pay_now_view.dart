import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'pay_now_viewmodel.dart';

class PayNowView extends StackedView<PayNowViewModel> {
  const PayNowView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PayNowViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Enter Card Details"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("PayNowView")),
      ),
    );
  }

  @override
  PayNowViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PayNowViewModel();
}
