import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_all_orders_viewmodel.dart';

class ViewAllOrdersView extends StackedView<ViewAllOrdersViewModel> {
  const ViewAllOrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ViewAllOrdersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ViewAllOrdersView")),
      ),
    );
  }

  @override
  ViewAllOrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewAllOrdersViewModel();
}
