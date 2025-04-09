import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/models/product_model.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: GoogleFonts.hankenGrotesk(
              wordSpacing: -4,
              letterSpacing: -1,
              color: mainTextColor,
              fontSize: 30,
              fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: viewModel.navigationService.navigateToNotificationView,
            icon: const Icon(Iconsax.notification_copy),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: mainBackgroundColor),
            ),
            Text(
              product.title,
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 28,
                  letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor),
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber[600],
                ),
                Text(
                  "${product.rating.toString()}/5.0",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      color: mainTextColor),
                ),
                Text(
                  "(45 reviews)",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: lightTextColor),
                ),
              ],
            ),
            Text(
              product.description,
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: lightTextColor),
            ),
            Text(
              "Choose size",
              style: GoogleFonts.hankenGrotesk(
                  fontSize: 24,
                  letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: product.sizes.map((size) {
                bool isSelected = size == viewModel.selectedSize;

                return GestureDetector(
                  onTap: () {
                    viewModel.selectedSize = size;
                    viewModel.rebuildUi();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      size,
                      style: GoogleFonts.hankenGrotesk(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: lightTextColor),
                ),
                Text(
                  "\$ ${product.price.toString()}",
                  style: GoogleFonts.hankenGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: mainTextColor),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Add to Cart",
                      style: GoogleFonts.hankenGrotesk(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
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

extension on NavigationService {
  get navigateToNotificationView => null;
}
