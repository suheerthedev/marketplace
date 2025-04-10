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
                    title: "Business Name",
                    hintText: "Enter your business name",
                    hasSuffix: false,
                  ),
                  const CustomTextField(
                    title: "Business Address",
                    hintText: "Enter your business address",
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
              const Expanded(flex: 1, child: SizedBox()),
              //Create account button
              CustomButton(
                title: "Create Account",
                onTap:
                    viewModel.navigationService.navigateToSellerDashboardView,
                bgColor: mainBackgroundColor,
                textColor: secondaryTextColor,
                borderColor: mainBackgroundColor,
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
