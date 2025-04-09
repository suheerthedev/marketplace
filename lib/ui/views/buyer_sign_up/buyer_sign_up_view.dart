import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:marketplace/ui/widgets/common/social_button/social_button.dart';
import 'package:stacked/stacked.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 25,
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
                    "Let's create your account.",
                    style: GoogleFonts.roboto(
                        color: lightTextColor,
                        fontSize: 16,
                        height: 0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              //All The TextFields
              Column(
                spacing: 20,
                children: [
                  const CustomTextField(
                    title: "Name",
                    hintText: "Enter your full name",
                    hasSuffix: false,
                  ),
                  const CustomTextField(
                    title: "Email",
                    hintText: "abc@gmail.com",
                    hasSuffix: false,
                  ),
                  CustomTextField(
                    title: "Password",
                    hintText: "Enter your password",
                    hasSuffix: true,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: iconColor,
                        )),
                  ),
                  //terms and conditon text
                  Text(
                    "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              //Create account button
              Column(
                spacing: 18,
                children: [
                  CustomButton(
                    title: "Create Account",
                    onTap: viewModel.navigationService.navigateToBuyerLoginView,
                    bgColor: mainBackgroundColor,
                    textColor: secondaryTextColor,
                    borderColor: mainBackgroundColor,
                  ),
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
                          style: GoogleFonts.roboto(color: lightTextColor)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Divider(
                          indent: 10,
                          color: lightTextColor,
                        ),
                      ),
                    ],
                  ),

                  //Google Button
                  SocialButton(
                      title: "Sign Up with Google",
                      onTap: () {},
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

              //Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      onTap:
                          viewModel.navigationService.navigateToBuyerLoginView,
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
    );
  }

  @override
  BuyerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerSignUpViewModel();
}
