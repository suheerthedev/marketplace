import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:marketplace/ui/widgets/common/product_card_2/product_card_2.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "My Cart"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Expanded(
                child: viewModel.products.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15,
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                                size: 48,
                                color: iconColor,
                              ),
                              Text(
                                "Your Cart Is Empty!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: mainTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 26.0),
                                child: Text(
                                  "When you add products, they’ll appear here.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: lightTextColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: viewModel.products.length,
                        itemBuilder: (context, index) {
                          return ProductCard2(viewModel.products[index]);
                        })),
            viewModel.products.isEmpty
                ? const SizedBox()
                : Column(
                    spacing: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub-total",
                            style: GoogleFonts.hankenGrotesk(
                              color: lightTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ 5,870",
                            style: GoogleFonts.hankenGrotesk(
                              color: mainTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "VAT (%)",
                            style: GoogleFonts.hankenGrotesk(
                              color: lightTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ 0.00",
                            style: GoogleFonts.hankenGrotesk(
                              color: mainTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Fee",
                            style: GoogleFonts.hankenGrotesk(
                              color: lightTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ 80",
                            style: GoogleFonts.hankenGrotesk(
                              color: mainTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.hankenGrotesk(
                              color: mainTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ 5,950",
                            style: GoogleFonts.hankenGrotesk(
                              color: mainTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
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
                            children: [
                              Text(
                                "Go to Checkout",
                                style: GoogleFonts.hankenGrotesk(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      )),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
