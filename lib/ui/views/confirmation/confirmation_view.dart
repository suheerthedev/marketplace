import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Image.asset('assets/images/confirmation_tick.png'),
            Text(
              "Congratulations!",
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: mainTextColor),
            ),
            Text(
              "Your order is confirmed.",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: lightTextColor),
            ),
            CustomButton(
                title: "Thank you",
                onTap: viewModel.confimed,
                bgColor: brownContainerColor,
                textColor: secondaryTextColor,
                borderColor: brownContainerColor),
          ],
        ),
      ),
    )));
  }

  @override
  ConfirmationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConfirmationViewModel();
}
