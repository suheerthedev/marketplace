import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'store_app_bar_model.dart';

class StoreAppBar extends StackedView<StoreAppBarModel> {
  const StoreAppBar({super.key});

  @override
  Widget builder(
    BuildContext context,
    StoreAppBarModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  StoreAppBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreAppBarModel();
}
