import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_card_2/product_card_2.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: const MainAppBar(title: "My Cart"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildCartContent(context, viewModel),
            ),
            if (viewModel.products.isNotEmpty)
              _buildBottomSection(context, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, CartViewModel viewModel) {
    if (viewModel.products.isEmpty) {
      return _buildEmptyCart();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) {
        final product = viewModel.products[index];
        return ProductCard2(
          product,
          quantity: viewModel.getProductQuantity(product.id),
          onDelete: () => viewModel.removeFromCart(product.id),
          onIncrement: () => viewModel.incrementQuantity(product.id),
          onDecrement: () => viewModel.decrementQuantity(product.id),
        );
      },
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 48,
              color: iconColor,
            ),
            const SizedBox(height: 15),
            Text(
              "Your Cart Is Empty!",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: mainTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                "When you add products, they'll appear here.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: lightTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, CartViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPriceRow(
              "Sub-total", "\$ ${viewModel.subtotal.toStringAsFixed(2)}"),
          _buildPriceRow(
              "Shipping Fee", "\$ ${viewModel.shippingFee.toStringAsFixed(2)}"),
          const Divider(height: 24),
          _buildPriceRow("Total", "\$ ${viewModel.total.toStringAsFixed(2)}",
              isTotal: true),
          const SizedBox(height: 16),
          _buildButtons(context, viewModel),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              color: isTotal ? mainTextColor : lightTextColor,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.roboto(
              color: mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, CartViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF996E4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: viewModel.proceedToCheckout,
            child: Text(
              "Proceed to Checkout",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF996E4E)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: viewModel.continueShopping,
            child: Text(
              "Continue Shopping",
              style: GoogleFonts.roboto(
                color: const Color(0xFF996E4E),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
