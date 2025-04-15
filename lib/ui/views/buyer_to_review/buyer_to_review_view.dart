import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_review_card/product_review_card.dart';
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
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "To Review"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: viewModel.productsToReview.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  itemCount: viewModel.productsToReview.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.productsToReview[index];
                    return ProductReviewCard(
                      product: product,
                      onWriteReview: viewModel.navigateToWriteReview,
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        "You don't have any products to review.",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  BuyerToReviewViewModel viewModelBuilder(BuildContext context) =>
      BuyerToReviewViewModel();
}
