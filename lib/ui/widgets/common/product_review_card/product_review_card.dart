import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'product_review_card_model.dart';

class ProductReviewCard extends StackedView<ProductReviewCardModel> {
  final ProductForReview product;
  final Function(String) onWriteReview;

  const ProductReviewCard({
    Key? key,
    required this.product,
    required this.onWriteReview,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductReviewCardModel viewModel,
    Widget? child,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            color: Colors.grey.shade200,
            child: Center(
              child: Icon(
                Icons.photo_camera,
                color: Colors.grey.shade400,
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
                  viewModel.product.storeName,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  viewModel.product.productName,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  'Subtotal: \$ ${viewModel.product.subtotal.toStringAsFixed(0)}',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                // Write a review button
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: viewModel.writeReview,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF996E4E)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Write a review',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF996E4E),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProductReviewCardModel viewModelBuilder(BuildContext context) =>
      ProductReviewCardModel(
        product: product,
        onWriteReview: onWriteReview,
      );
}
