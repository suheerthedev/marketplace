import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'seller_sign_up_viewmodel.dart';

class SellerSignUpView extends StackedView<SellerSignUpViewModel> {
  const SellerSignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerSignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("SellerSignUpView")),
      ),
    );
  }

  @override
  SellerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerSignUpViewModel();
}
