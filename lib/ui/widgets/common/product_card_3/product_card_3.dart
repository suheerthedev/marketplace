import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_card_3_model.dart';

class ProductCard3 extends StackedView<ProductCard3Model> {
  final Product product;
  final VoidCallback onToggleSaved;
  final VoidCallback? onTapped;
  final bool isTappable;
  const ProductCard3(
      {this.onTapped,
      required this.isTappable,
      required this.product,
      required this.onToggleSaved,
      super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductCard3Model viewModel,
    Widget? child,
  ) {
    return InkWell(
      onTap: isTappable ? onTapped : () {},
      child: Expanded(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    color: lightContainerColor,
                    child: Center(
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                softWrap: true,
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: mainTextColor),
              ),
              Text(
                "\$ ${product.price}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: lightTextColor),
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
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
        ]),
      ),
    );
  }

  @override
  ProductCard3Model viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard3Model();
}
