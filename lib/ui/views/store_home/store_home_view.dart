import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:marketplace/ui/widgets/store/store_app_bar/store_app_bar.dart';
import 'package:marketplace/ui/widgets/store/store_header/store_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';

import 'store_home_viewmodel.dart';

class StoreHomeView extends StackedView<StoreHomeViewModel> {
  const StoreHomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoreHomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(
        onSearchTap: viewModel.onSearchTap,
        onCartTap: viewModel.onCartTap,
        onNotificationTap: viewModel.onNotificationTap,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store header
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: StoreHeader(
                  storeName: viewModel.storeName,
                  rating: viewModel.storeRating,
                  isFollowing: viewModel.isFollowing,
                  onFollowTap: viewModel.toggleFollow,
                ),
              ),

              const SizedBox(height: 16),

              // Latest Additions
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: _buildSectionHeader('Latest Additions'),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildLatestAdditionsRow(viewModel),
              ),

              const SizedBox(height: 16),

              // Hottest Deals
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: _buildSectionHeader('Hottest Deals'),
              ),
              const SizedBox(height: 8),
              _buildHottestDeals(viewModel),

              const SizedBox(height: 16),
            ],
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

  Widget _buildLatestAdditionsRow(StoreHomeViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Main featured product
        Expanded(
          flex: 7,
          child:
              _buildMainFeatureProduct(viewModel.latestProducts[0], viewModel),
        ),

        const SizedBox(width: 12),

        // Right: Column of two small products
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildSmallProduct(viewModel.latestProducts[1], viewModel),
              const SizedBox(height: 20),
              _buildSmallProduct(
                  viewModel.latestProducts.length > 2
                      ? viewModel.latestProducts[2]
                      : viewModel.latestProducts[1],
                  viewModel),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainFeatureProduct(product, StoreHomeViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.onProductTap(product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with rating
          Container(
            decoration: BoxDecoration(
              color: lightContainerColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AspectRatio(
              aspectRatio: 1.0, // Square aspect ratio
              child: Stack(
                children: [
                  // Cassette image
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Rating badge
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          Text(
                            " ${product.rating}/5",
                            style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Product title and price
          Text(
            product.title,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                "\$ ${product.price}",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "-${product.discount}%",
                style: GoogleFonts.roboto(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallProduct(product, StoreHomeViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.onProductTap(product),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Product image with rating
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                // Product image
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Rating badge
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 10),
                        Text(
                          " ${product.rating}/5",
                          style: GoogleFonts.roboto(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Right: Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title,
                  softWrap: true,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "\$ ${product.price}",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHottestDeals(StoreHomeViewModel viewModel) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: viewModel.hottestDeals.length,
        itemBuilder: (context, index) {
          final product = viewModel.hottestDeals[index];
          return Container(
            width: 130,
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => viewModel.onProductTap(product),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image container
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            product.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Product info
                  Text(
                    product.title,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${product.price}",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "-${product.discount}%",
                        style: GoogleFonts.roboto(
                          fontSize: 8,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  StoreHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoreHomeViewModel();
}
