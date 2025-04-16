import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'store_home_viewmodel.dart';

class StoreHomeView extends StackedView<StoreHomeViewModel> {
  const StoreHomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreHomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("StoreHomeView")),
      ),
    );
  }

  @override
  StoreHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreHomeViewModel();
}
