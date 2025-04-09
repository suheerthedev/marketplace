import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            spacing: 0,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      color: lightContainerColor)),
              Text(
                softWrap: true,
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: mainTextColor),
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    "\$ ${product.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE7E7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${product.discount}%',
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '4.0/5',
                    style: GoogleFonts.roboto(
                        color: darkTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              bottom: 70,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/cassette.png',
                width: 230,
                height: 150,
              ))
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
