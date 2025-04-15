import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'buyer_to_pay_viewmodel.dart';

class BuyerToPayView extends StackedView<BuyerToPayViewModel> {
  const BuyerToPayView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerToPayViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "To Pay"),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  Text(
                    "Your order list is empty",
                    style: GoogleFonts.roboto(
                        fontSize: 22,
                        letterSpacing: -0.99,
                        fontWeight: FontWeight.w600,
                        color: mainTextColor),
                  ),
                  Text(
                    "Start by exploring our products and great deals",
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: lightTextColor),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: CustomButton(
                      title: "Continue Shopping",
                      onTap: () {},
                      bgColor: brownContainerColor,
                      textColor: Colors.white,
                      borderColor: brownContainerColor,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  BuyerToPayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerToPayViewModel();
}
