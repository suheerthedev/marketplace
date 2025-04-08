import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 0,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your account",
                    style: GoogleFonts.hankenGrotesk(
                        letterSpacing: -2,
                        wordSpacing: 0,
                        color: mainTextColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "It's great to see you again.",
                    style: GoogleFonts.hankenGrotesk(
                        color: lightTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              Expanded(
                flex: 1,
                child: Container(),
              ),

              //All The TextFields
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  spacing: 14,
                  children: [
                    const CustomTextField(
                      title: "Email",
                      hintText: "abc@gmail.com",
                      hasSuffix: false,
                    ),
                    CustomTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      hasSuffix: false,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility_off_outlined,
                            color: iconColor,
                          )),
                    ),
                    Row(
                      children: [
                        Text(
                          "Forgot your password? ",
                          style: GoogleFonts.hankenGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Reset your password",
                            style: GoogleFonts.hankenGrotesk(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(),
              ),

              //terms and conditon text

              //Login button
              Column(
                spacing: 18,
                children: [
                  CustomButton(
                      title: "Login",
                      onTap: () {},
                      bgColor: mainBackgroundColor,
                      textColor: secondaryTextColor,
                      borderColor: mainBackgroundColor,
                      hasIcon: false),

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
                              GoogleFonts.hankenGrotesk(color: lightTextColor)),
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
                      title: "Login with Google",
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
              Expanded(
                flex: 4,
                child: Container(),
              ),
              //Footer
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.hankenGrotesk(
                          fontSize: 16, color: lightTextColor),
                    ),
                    InkWell(
                      onTap: viewModel.navigationService.back,
                      child: Text(
                        "Join",
                        style: GoogleFonts.hankenGrotesk(
                            color: mainTextColor,
                            fontSize: 16,
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
  BuyerLoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerLoginViewModel();
}
