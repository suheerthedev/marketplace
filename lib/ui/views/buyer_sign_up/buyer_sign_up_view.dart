import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
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
                    style: GoogleFonts.hankenGrotesk(
                        letterSpacing: -2,
                        wordSpacing: 0,
                        color: mainTextColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Let's create your account.",
                    style: GoogleFonts.hankenGrotesk(
                        color: lightTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              //All The TextFields
              Column(
                spacing: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.hankenGrotesk(
                            color: mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "Enter your full name",
                          hintStyle: GoogleFonts.hankenGrotesk(
                            color: lightTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.hankenGrotesk(
                            color: mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "abc@gmail.com",
                          hintStyle: GoogleFonts.hankenGrotesk(
                            color: lightTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: GoogleFonts.hankenGrotesk(
                            color: mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: GoogleFonts.hankenGrotesk(
                            color: lightTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.visibility_off_outlined,
                                color: iconColor,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //terms and conditon text
                  Text(
                    "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                    style: GoogleFonts.hankenGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              //Create account button
              Column(
                spacing: 18,
                children: [
                  const CustomButton(
                      title: "Create Account",
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.black,
                            size: 25,
                          ),
                          Text(
                            "Sign Up with Google",
                            style: GoogleFonts.hankenGrotesk(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      style: GoogleFonts.hankenGrotesk(
                          fontSize: 16, color: lightTextColor),
                    ),
                    InkWell(
                      onTap:
                          viewModel.navigationService.navigateToBuyerLoginView,
                      child: Text(
                        "Log In",
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
  BuyerSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyerSignUpViewModel();
}
