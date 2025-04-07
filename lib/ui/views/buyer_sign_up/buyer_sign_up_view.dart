import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buyer_sign_up_viewmodel.dart';

class BuyerSignUpView extends StackedView<BuyerSignUpViewModel> {
  const BuyerSignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerSignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerSignUpView")),
      ),
    );
  }

  @override
  BuyerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerSignUpViewModel();
}
