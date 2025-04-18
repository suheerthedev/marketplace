import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_return_card_model.dart';

class ProductReturnCard extends StackedView<ProductReturnCardModel> {
  final Map<String, dynamic> product;
  final VoidCallback? onCardTap;
  final VoidCallback? onActionTap;

  const ProductReturnCard({
    Key? key,
    required this.product,
    this.onCardTap,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductReturnCardModel viewModel,
    Widget? child,
  ) {
    final hasAction = viewModel.hasActionButton;
    final status = viewModel.product['status'] ?? '';
    final isStatusSuccess = status == ReturnStatus.successful;

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
                      Icons.photo_camera_outlined,
                      color: mainBackgroundColor,
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

                      // Status or Action
                      if (hasAction)
                        // Action Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: viewModel.onActionTap,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(10, 10),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              foregroundColor: brownTextColor,
                            ),
                            child: Text(
                              status,
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: brownTextColor,
                              ),
                            ),
                          ),
                        )
                      else
                        // Status Text with Icon
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isStatusSuccess)
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
                                status,
                                style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isStatusSuccess
                                      ? Colors.blue
                                      : Colors.black54,
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
  ProductReturnCardModel viewModelBuilder(BuildContext context) =>
      ProductReturnCardModel(
        product: product,
        onCardTap: onCardTap,
        onActionTap: onActionTap,
      );
}
