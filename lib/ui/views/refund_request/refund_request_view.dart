import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'refund_request_viewmodel.dart';

class RefundRequestView extends StackedView<RefundRequestViewModel> {
  const RefundRequestView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RefundRequestViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("RefundRequestView")),
      ),
    );
  }

  @override
  RefundRequestViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RefundRequestViewModel();
}
