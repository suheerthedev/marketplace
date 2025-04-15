import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_review_viewmodel.dart';

class BuyerToReviewView extends StackedView<BuyerToReviewViewModel> {
  const BuyerToReviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToReviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: MainAppBar(title: "To Review"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("BuyerToReviewView")),
      ),
    );
  }

  @override
  BuyerToReviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerToReviewViewModel();
}
