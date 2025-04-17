import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:marketplace/ui/widgets/common/social_button/social_button.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/gestures.dart';

import 'buyer_sign_up_viewmodel.dart';

class BuyerSignUpView extends StackedView<BuyerSignUpViewModel> {
  const BuyerSignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerSignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
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
                        "Let's create your account.",
                        style: GoogleFonts.roboto(
                            color: lightTextColor,
                            fontSize: 16,
                            height: 0,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 20),

                      //All The TextFields
                      Column(
                        children: [
                          CustomTextField(
                            title: "Name",
                            hintText: "Enter your full name",
                            hasSuffix: false,
                            onChanged: viewModel.setName,
                          ),
                          if (viewModel.nameError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 2.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  viewModel.nameError!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: errorColor,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            title: "Email",
                            hintText: "abc@gmail.com",
                            hasSuffix: false,
                            onChanged: viewModel.setEmail,
                          ),
                          if (viewModel.emailError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 2.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  viewModel.emailError!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: errorColor,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 14),
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
                          if (viewModel.passwordError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 2.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  viewModel.passwordError!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: errorColor,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            title: "Country",
                            hintText: "Enter your country",
                            hasSuffix: false,
                            onChanged: viewModel.setCountry,
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            title: "Phone Number",
                            hintText: "+923001234567",
                            hasSuffix: false,
                            keyboardType: TextInputType.phone,
                            onChanged: viewModel.setPhoneNumber,
                          ),
                          if (viewModel.phoneNumberError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 2.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  viewModel.phoneNumberError!,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: errorColor,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 16),

                          // Newsletter subscription checkbox
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  checkColor: secondaryTextColor,
                                  activeColor: brownContainerColor,
                                  value: viewModel.newsletterSubscription,
                                  onChanged: (value) => viewModel
                                      .setNewsletterSubscription(value ?? true),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(color: Colors.grey[400]!),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      viewModel.setNewsletterSubscription(
                                          !viewModel.newsletterSubscription),
                                  child: Text(
                                    "Subscribe to newsletter for updates",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Error message if any
                          if (viewModel.generalError != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: errorColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      color: errorColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        viewModel.generalError!,
                                        style: GoogleFonts.roboto(
                                          color: errorColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
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

                      const SizedBox(height: 30),

                      //Create account button
                      Column(
                        children: [
                          CustomButton(
                            title: "Create Account",
                            onTap: viewModel.signUp,
                            bgColor: mainBackgroundColor,
                            textColor: secondaryTextColor,
                            borderColor: mainBackgroundColor,
                            isDisabled: !viewModel.isFormValid,
                          ),
                          const SizedBox(height: 18),
                          //Divider
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: const Divider(
                                  endIndent: 10,
                                  color: lightTextColor,
                                ),
                              ),
                              Text("Or",
                                  style: GoogleFonts.roboto(
                                      color: lightTextColor)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: const Divider(
                                  indent: 10,
                                  color: lightTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          //Google Button
                          SocialButton(
                              title: "Sign Up with Google",
                              onTap: viewModel.signUpWithGoogle,
                              bgColor: secondaryBackgroundColor,
                              textColor: mainTextColor,
                              borderColor: lightBackgroundColor,
                              hasIcon: true,
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                color: mainTextColor,
                              ))
                        ],
                      ),

                      const SizedBox(height: 30),

                      //Footer
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: lightTextColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: viewModel.navigateToBuyerLoginView,
                              child: Text(
                                "Login",
                                style: GoogleFonts.roboto(
                                    color: mainTextColor,
                                    fontSize: 16,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  @override
  BuyerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerSignUpViewModel();
}
