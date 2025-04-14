import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/review_card/review_card.dart';
import 'package:marketplace/ui/widgets/common/store_section/store_section.dart';
import 'package:stacked/stacked.dart';

import 'product_detail_viewmodel.dart';

class ProductDetailView extends StackedView<ProductDetailViewModel> {
  final Product product;

  const ProductDetailView({required this.product, Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Container
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lightContainerColor,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: EdgeInsets.zero,
                            width: 35,
                            height: 35,
                            color: Colors.white70,
                            child: IconButton(
                              isSelected: product.isSaved,
                              selectedIcon: const Icon(
                                Iconsax.heart,
                                color: Colors.red,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                viewModel.onToggleSaved(product);
                              },
                              icon: const Icon(
                                Iconsax.heart_copy,
                                color: iconColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Product Title and Rating
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: mainTextColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[600],
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${product.rating}/5.0",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: mainTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Price and Discount
                      Row(
                        children: [
                          Text(
                            "\$ ${product.price}",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFF996E4E),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '-${product.discount}%',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Product Description
                      Text(
                        product.description,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: lightTextColor,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Brand Section
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                    offset: Offset(2, 6),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                product.brandImagePath,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Iconsax.verify,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        "Ratings & Reviews",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Ratings & Reviews Section
                      SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: product.reviews.length,
                            itemBuilder: (context, index) {
                              return ReviewCard(
                                review: product.reviews[index],
                              );
                            }),
                      ),
                      const SizedBox(height: 20),

                      //Store Section
                      const StoreSection()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            // Store Button
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.store_outlined,
                      color: Colors.grey,
                      size: 24,
                    ),
                    Text(
                      "Store",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Chat Button
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.grey,
                      size: 24,
                    ),
                    Text(
                      "Chat",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Buy Now Button
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () => viewModel.buyNow(product),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF996E4E),
                      width: 1,
                    ),
                    color: secondaryContainerColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF996E4E),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Add To Cart Button
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () => viewModel.addToCart(product, context),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF996E4E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductDetailViewModel();
}
