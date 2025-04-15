import 'package:flutter/material.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_receive_card/product_receive_card.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_receive_viewmodel.dart';

class BuyerToReceiveView extends StackedView<BuyerToReceiveViewModel> {
  const BuyerToReceiveView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToReceiveViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "To Receive"),
      body: SafeArea(
        child: viewModel.productsToReceive.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: viewModel.productsToReceive.length,
                itemBuilder: (context, index) {
                  final product = viewModel.productsToReceive[index];
                  return ProductReceiveCard(
                    product: product,
                    onTap: () => viewModel.onProductTap(product['id']),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        "You don't have any products to receive.",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  BuyerToReceiveViewModel viewModelBuilder(BuildContext context) =>
      BuyerToReceiveViewModel();
}
