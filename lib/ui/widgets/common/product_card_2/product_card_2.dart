import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'product_card_2_model.dart';

class ProductCard2 extends StackedView<ProductCard2Model> {
  final Product product;
  const ProductCard2(this.product, {super.key});

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
          spacing: 10,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 90,
                height: double.maxFinite,
                color: mainBackgroundColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
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
                                style: GoogleFonts.hankenGrotesk(
                                    fontSize: 20,
                                    letterSpacing: -1,
                                    color: mainTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                product.rating.toString(),
                                style: GoogleFonts.hankenGrotesk(
                                    color: lightTextColor),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$ ${product.price.toString()}",
                            style: GoogleFonts.hankenGrotesk(
                                fontSize: 16,
                                letterSpacing: 0,
                                color: mainTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 10,
                            children: [
                              InkWell(
                                onTap: viewModel.decrementCounter,
                                child: const Icon(
                                  Iconsax.minus,
                                  size: 20,
                                  color: darkIconColor,
                                ),
                              ),
                              Text(
                                viewModel.counter.toString(),
                                style: GoogleFonts.hankenGrotesk(),
                              ),
                              InkWell(
                                onTap: viewModel.incrementCounter,
                                child: const Icon(
                                  Iconsax.add,
                                  size: 20,
                                  color: darkIconColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProductCard2Model viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCard2Model();
}
