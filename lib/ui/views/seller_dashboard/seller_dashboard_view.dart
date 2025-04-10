import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_dashboard_viewmodel.dart';

class SellerDashboardView extends StackedView<SellerDashboardViewModel> {
  const SellerDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerDashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerDashboardView")),
      ),
    );
  }

  @override
  SellerDashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerDashboardViewModel();
}
