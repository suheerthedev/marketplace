import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:marketplace/ui/widgets/common/social_button/social_button.dart';
import 'package:stacked/stacked.dart';

import 'buyer_login_viewmodel.dart';

class BuyerLoginView extends StackedView<BuyerLoginViewModel> {
  const BuyerLoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyerLoginViewModel viewModel,
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login to your account",
                          style: GoogleFonts.roboto(
                              letterSpacing: -2,
                              color: mainTextColor,
                              fontSize: 36,
                              height: 0,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "It's great to see you again.",
                          style: GoogleFonts.roboto(
                              color: lightTextColor,
                              fontSize: 16,
                              height: 0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),

                    const Spacer(),

                    //All The TextFields
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
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

                          // General error message if any
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
                                    Icon(
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

                          Row(
                            children: [
                              Text(
                                "Forgot your password? ",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: viewModel.navigateToForgotPassword,
                                child: Text(
                                  "Reset your password",
                                  style: GoogleFonts.roboto(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    //Login button
                    Column(
                      children: [
                        CustomButton(
                          title: "Login",
                          onTap: viewModel.login,
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
                                style:
                                    GoogleFonts.roboto(color: lightTextColor)),
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
                            title: "Login with Google",
                            onTap: viewModel.loginWithGoogle,
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
                    const Spacer(flex: 6),
                    //Footer
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: lightTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: viewModel.navigateBack,
                            child: Text(
                              "Join",
                              style: GoogleFonts.roboto(
                                  color: mainTextColor,
                                  fontSize: 16,
                                  height: 1,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500),
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
  BuyerLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerLoginViewModel();
}
