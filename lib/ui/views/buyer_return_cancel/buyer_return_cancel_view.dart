import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_cancel_card/product_cancel_card.dart';
import 'package:marketplace/ui/widgets/common/product_return_card/product_return_card.dart';
import 'package:marketplace/ui/widgets/common/product_return_card/product_return_card_model.dart';
import 'package:stacked/stacked.dart';

import 'buyer_return_cancel_viewmodel.dart';

class BuyerReturnCancelView extends StackedView<BuyerReturnCancelViewModel> {
  const BuyerReturnCancelView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerReturnCancelViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Returns & Cancellations"),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Tab Bar
            _buildTabBar(viewModel),

            // Tab Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: viewModel.currentTabIndex == 0
                    ? _buildReturnRefundTab(viewModel)
                    : _buildCancellationTab(viewModel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuyerReturnCancelViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(
              title: 'Return/Refund',
              isSelected: viewModel.currentTabIndex == 0,
              onTap: () => viewModel.setTabIndex(0),
            ),
            _buildTabItem(
              title: 'Cancellation',
              isSelected: viewModel.currentTabIndex == 1,
              onTap: () => viewModel.setTabIndex(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFFB07B40) : Colors.grey,
              ),
            ),
          ),
          if (isSelected)
            Container(
              height: 2,
              width: 60,
              color: const Color(0xFFB07B40),
            ),
        ],
      ),
    );
  }

  Widget _buildReturnRefundTab(BuyerReturnCancelViewModel viewModel) {
    final products = viewModel.returnedProducts;

    if (products.isEmpty) {
      return const Center(
        child: Text("You don't have any returned products."),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductReturnCard(
          product: product,
          onCardTap: () => viewModel.onProductTap(product['id']),
          onActionTap: () {
            if (product['status'] == ReturnStatus.requestRefund) {
              viewModel.onRequestRefund(product['id']);
            } else if (product['status'] == ReturnStatus.trackRefund) {
              viewModel.onTrackRefund(product['id']);
            }
          },
        );
      },
    );
  }

  Widget _buildCancellationTab(BuyerReturnCancelViewModel viewModel) {
    final products = viewModel.cancelledProducts;

    if (products.isEmpty) {
      return const Center(
        child: Text("You don't have any cancelled products."),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCancelCard(
          product: product,
          onCardTap: () => viewModel.onProductTap(product['id']),
        );
      },
    );
  }

  @override
  BuyerReturnCancelViewModel viewModelBuilder(BuildContext context) =>
      BuyerReturnCancelViewModel();
}
