import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_card_2_model.dart';

class ProductCard2 extends StackedView<ProductCard2Model> {
  final Product product;
  final int quantity;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCard2(
    this.product, {
    super.key,
    required this.quantity,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget builder(
    BuildContext context,
    ProductCard2Model viewModel,
    Widget? child,
  ) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: lightBackgroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 90,
                height: double.maxFinite,
                color: lightContainerColor,
                child: Center(
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: mainTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Company: ${product.companyName}',
                              style: GoogleFonts.roboto(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: onDelete,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Iconsax.trash,
                            size: 18,
                            color: errorColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$ ${product.price.toString()}",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          letterSpacing: 0,
                          color: const Color(0xFF996E4E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildQuantityButton(
                            icon: Icons.remove,
                            onTap: onDecrement,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              quantity.toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mainTextColor,
                              ),
                            ),
                          ),
                          _buildQuantityButton(
                            icon: Icons.add,
                            onTap: onIncrement,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: lightBackgroundColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 16,
          color: darkIconColor,
        ),
      ),
    );
  }

  @override
  ProductCard2Model viewModelBuilder(BuildContext context) =>
      ProductCard2Model();
}
