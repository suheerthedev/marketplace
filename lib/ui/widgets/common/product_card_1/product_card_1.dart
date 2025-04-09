import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_card_1_model.dart';

class ProductCard1 extends StackedView<ProductCard1Model> {
  final Product product;
  final VoidCallback onToggleSaved;
  final VoidCallback? onTapped;
  final bool isTappable;
  const ProductCard1(
      {required this.product,
      required this.onToggleSaved,
      this.onTapped,
      required this.isTappable,
      super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductCard1Model viewModel,
    Widget? child,
  ) {
    return InkWell(
      onTap: isTappable ? onTapped : () {},
      child: Expanded(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      color: Colors.black)),
              Text(
                softWrap: true,
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.hankenGrotesk(
                    fontSize: 20,
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    color: mainTextColor),
              ),
              Text(
                "\$ ${product.price}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.hankenGrotesk(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: lightTextColor),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                    onPressed: onToggleSaved,
                    icon: const Icon(
                      Iconsax.heart_copy,
                      color: mainIconColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  ProductCard1Model viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard1Model();
}
