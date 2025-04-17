import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
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
        automaticallyImplyLeading: true,
        title: Text(
          "Email Verification",
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter 6 Digit Code",
                            style: GoogleFonts.roboto(
                                letterSpacing: -2,
                                wordSpacing: 0,
                                color: mainTextColor,
                                fontSize: 36,
                                height: 0,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          if (viewModel.email != null)
                            Text(
                              "Enter 6 digit code sent to ${viewModel.email}",
                              style: GoogleFonts.roboto(
                                  color: lightTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          else
                            Text(
                              "No email address found for verification",
                              style: GoogleFonts.roboto(
                                  color: errorColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: Pinput(
                          length: 6,
                          onCompleted: viewModel.setVerificationCode,
                          onChanged: viewModel.setVerificationCode,
                          defaultPinTheme: PinTheme(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.13,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: GoogleFonts.roboto(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Error message if any
                      if (viewModel.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            viewModel.errorMessage!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: viewModel.errorMessage!.contains('success')
                                  ? Colors.green
                                  : errorColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      const SizedBox(height: 15),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive code? ",
                              style: GoogleFonts.roboto(
                                  color: lightTextColor,
                                  fontSize: 16,
                                  height: 0,
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: viewModel.resendCode,
                              child: Text(
                                "Resend code",
                                style: GoogleFonts.roboto(
                                    color: mainTextColor,
                                    fontSize: 16,
                                    height: 0,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          "You can request up to 60 codes per minute",
                          style: GoogleFonts.roboto(
                              color: lightTextColor,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              height: 0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        title: "Verify",
                        onTap: viewModel.verifyCode,
                        bgColor: mainBackgroundColor,
                        textColor: secondaryTextColor,
                        borderColor: mainBackgroundColor,
                        isDisabled: !viewModel.isFormValid,
                      ),
                    ],
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
