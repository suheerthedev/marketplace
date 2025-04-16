import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/widgets/common/product_card_1/product_card_1.dart';
import 'package:marketplace/ui/widgets/store/store_app_bar/store_app_bar.dart';
import 'package:marketplace/ui/widgets/store/store_header/store_header.dart';
import 'package:stacked/stacked.dart';

import 'store_products_viewmodel.dart';

class StoreProductsView extends StackedView<StoreProductsViewModel> {
  const StoreProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: StoreAppBar(
        onSearchTap: viewModel.onSearchTap,
        onCartTap: viewModel.onCartTap,
        onNotificationTap: viewModel.onNotificationTap,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoreHeader(
                  storeName: "Store Name",
                  rating: "4.5",
                  isFollowing: true,
                  onFollowTap: viewModel.onFollowTap,
                ),
                const SizedBox(height: 16),
                _buildSectionHeader("Products"),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];

                    return ProductCard1(
                      product: product,
                      isTappable: true,
                      onTapped: () {
                        viewModel.onProductTap(product);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  @override
  StoreProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreProductsViewModel();
}
