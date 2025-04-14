import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/main_app_bar/main_app_bar.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import 'verification_viewmodel.dart';

class VerificationView extends StackedView<VerificationViewModel> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter 4 Digit Code ",
                      style: GoogleFonts.roboto(
                          letterSpacing: -2,
                          wordSpacing: 0,
                          color: mainTextColor,
                          fontSize: 36,
                          height: 0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Enter 4 digit code that your receive on your email {email}",
                      style: GoogleFonts.roboto(
                          color: lightTextColor,
                          fontSize: 16,
                          height: 0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Center(
                    child: Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't recieved code? ",
                      style: GoogleFonts.roboto(
                          color: lightTextColor,
                          fontSize: 16,
                          height: 0,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Resend code",
                      style: GoogleFonts.roboto(
                          color: mainTextColor,
                          fontSize: 16,
                          height: 0,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: viewModel.navigationService.navigateToResetPasswordView,
            child: Text(
              "Continue",
              style: GoogleFonts.hankenGrotesk(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerificationViewModel();
}
