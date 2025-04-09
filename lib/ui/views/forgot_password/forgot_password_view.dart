import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot password",
                    style: GoogleFonts.roboto(
                        letterSpacing: -2,
                        wordSpacing: 0,
                        color: mainTextColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Enter your email to get reset password link",
                    style: GoogleFonts.roboto(
                        color: lightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const CustomTextField(
                  title: "Email",
                  hintText: "Enter your email",
                  hasSuffix: false),
              CustomButton(
                title: "Send",
                onTap: viewModel.navigationSerivce.navigateToResetPasswordView,
                bgColor: mainBackgroundColor,
                textColor: secondaryTextColor,
                borderColor: lightBackgroundColor,
              ),
              InkWell(
                onTap: viewModel.navigationSerivce.back,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    const Icon(Icons.arrow_back),
                    Text(
                      "Back to Login",
                      style: GoogleFonts.roboto(
                        color: mainTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
