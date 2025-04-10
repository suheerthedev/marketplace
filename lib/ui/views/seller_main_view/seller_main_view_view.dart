import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_main_view_viewmodel.dart';

class SellerMainViewView extends StackedView<SellerMainViewViewModel> {
  const SellerMainViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerMainViewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerMainViewView")),
      ),
    );
  }

  @override
  SellerMainViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerMainViewViewModel();
}
