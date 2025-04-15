import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'redeem_voucher_viewmodel.dart';

class RedeemVoucherView extends StackedView<RedeemVoucherViewModel> {
  const RedeemVoucherView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RedeemVoucherViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const MainAppBar(title: "Your Vouchers"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Image.asset('assets/images/gift.png'),
                const SizedBox(height: 16),
                Text(
                  '\$ 5.00 cashback on all our partner stores',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: lightTextColor,
                      letterSpacing: 0),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: lightContainerColor,
                  height: 1,
                ),
                Text(
                  'Coupon Code',
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: lightTextColor,
                      letterSpacing: 0),
                ),
                Text(
                  'HAPPY 5',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: mainTextColor,
                      letterSpacing: 5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                      title: "Redeem Now",
                      onTap: () {},
                      bgColor: brownContainerColor,
                      textColor: secondaryTextColor,
                      borderColor: brownContainerColor),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: lightContainerColor,
                  height: 1,
                ),
                Text(
                  'Valid till: 20, March 2025',
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: lightTextColor,
                      letterSpacing: 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  RedeemVoucherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RedeemVoucherViewModel();
}
