import 'package:flutter/material.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

import 'seller_trending_products_viewmodel.dart';

class SellerTrendingProductsView
    extends StackedView<SellerTrendingProductsViewModel> {
  const SellerTrendingProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerTrendingProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Trending Products"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildProductGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: 6, // Six items as shown in the design
      itemBuilder: (context, index) {
        return _buildProductCard();
      },
    );
  }

  Widget _buildProductCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card with image and badges
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // Center cassette image
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset(
                      'assets/images/cassette.png',
                      fit: BoxFit.contain,
                      // If asset image is not available, use a placeholder
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: const Color(0xFFFFE082), width: 2),
                              ),
                              child: Center(
                                child: Container(
                                  width: 60,
                                  height: 5,
                                  color: const Color(0xFFFFE082),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Top badges
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sales badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.sell,
                              color: errorColor,
                              size: 12,
                            ),
                            Text(
                              "1.8k sold",
                              style: GoogleFonts.roboto(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: mediumLightTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Rating badge
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 12,
                          ),
                          Text(
                            "4.0/5",
                            style: GoogleFonts.roboto(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: mediumLightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Product name and price
        Text(
          "Sony Cd Player",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          "\$ 60",
          style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  SellerTrendingProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerTrendingProductsViewModel();
}
