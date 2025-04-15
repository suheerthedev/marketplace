import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_cancel_card_model.dart';

class ProductCancelCard extends StackedView<ProductCancelCardModel> {
  final Map<String, dynamic> product;
  final VoidCallback? onCardTap;

  const ProductCancelCard({
    Key? key,
    required this.product,
    this.onCardTap,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductCancelCardModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: viewModel.onCardTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store Name
            Text(
              viewModel.product['storeName'] ?? 'Store Name',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: mainTextColor,
              ),
            ),
            const SizedBox(height: 8),

            // Product Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.grey,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.product['productName'] ?? 'Product name',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: mainTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Subtotal: \$ ${viewModel.product['subtotal'] ?? 170}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: mainTextColor,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Cancelled Status with Icon
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Text(
                              CancelStatus.successful,
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: mainTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductCancelCardModel viewModelBuilder(BuildContext context) =>
      ProductCancelCardModel(
        product: product,
        onCardTap: onCardTap,
      );
}
