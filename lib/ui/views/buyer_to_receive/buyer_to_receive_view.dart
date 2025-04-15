import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_receive_viewmodel.dart';

class BuyerToReceiveView extends StackedView<BuyerToReceiveViewModel> {
  const BuyerToReceiveView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToReceiveViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "To Receive"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerToReceiveView")),
      ),
    );
  }

  @override
  BuyerToReceiveViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerToReceiveViewModel();
}
