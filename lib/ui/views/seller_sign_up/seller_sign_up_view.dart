import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:marketplace/ui/widgets/common/social_button/social_button.dart';
import 'package:stacked/stacked.dart';

import 'seller_sign_up_viewmodel.dart';

class SellerSignUpView extends StackedView<SellerSignUpViewModel> {
  const SellerSignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SellerSignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create an account",
                          style: GoogleFonts.roboto(
                              letterSpacing: -2,
                              color: mainTextColor,
                              fontSize: 36,
                              height: 0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Let's create your seller account.",
                          style: GoogleFonts.roboto(
                              color: lightTextColor,
                              fontSize: 16,
                              height: 0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),

                    Expanded(flex: 1, child: SizedBox()),

                    //All The TextFields
                    Column(
                      spacing: 20,
                      children: [
                        CustomTextField(
                          title: "Business Name",
                          hintText: "Enter your business name",
                          hasSuffix: false,
                          onChanged: viewModel.setName,
                        ),
                        CustomTextField(
                          title: "Business Address",
                          hintText: "Enter your address",
                          hasSuffix: false,
                          onChanged: viewModel.setAddress,
                        ),
                        CustomTextField(
                          title: "Email",
                          hintText: "abc@gmail.com",
                          hasSuffix: false,
                          onChanged: viewModel.setEmail,
                        ),
                        CustomTextField(
                          title: "Password",
                          hintText: "Enter your password",
                          hasSuffix: true,
                          obscureText: !viewModel.isPasswordVisible,
                          onChanged: viewModel.setPassword,
                          suffixIcon: IconButton(
                              onPressed: viewModel.togglePasswordVisibility,
                              icon: Icon(
                                viewModel.isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: iconColor,
                              )),
                        ),

                        // Error message if any
                        if (viewModel.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              viewModel.errorMessage!,
                              style: GoogleFonts.roboto(
                                color: errorColor,
                                fontSize: 14,
                              ),
                            ),
                          ),

                        //terms and conditon text
                        Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(children: [
                            TextSpan(
                              text: "By signing up you agree to our ",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: mainTextColor),
                            ),
                            TextSpan(
                              text: "Terms",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: brownTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.onTermsAndConditionsTap();
                                },
                            ),
                            TextSpan(
                              text: ", ",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: mainTextColor),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: brownTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.onPrivacyPolicyTap();
                                },
                            ),
                            TextSpan(
                              text: ", and ",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: mainTextColor),
                            ),
                            TextSpan(
                              text: "Cookie Use.",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: brownTextColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.onCookieUseTap();
                                },
                            ),
                          ]),
                        ),
                      ],
                    ),

                    Expanded(flex: 8, child: SizedBox()),

                    //Create account button
                    Column(
                      spacing: 18,
                      children: [
                        CustomButton(
                          title: "Create Account",
                          onTap: viewModel.signUp,
                          bgColor: mainBackgroundColor,
                          textColor: secondaryTextColor,
                          borderColor: mainBackgroundColor,
                          isDisabled: !viewModel.isFormValid,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  SellerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SellerSignUpViewModel();
}
