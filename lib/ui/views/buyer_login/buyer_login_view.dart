import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/app/app.router.dart';
import 'package:marketplace/ui/common/app_colors.dart';
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
                            hintText: "Enter your email",
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: GoogleFonts.hankenGrotesk(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
                          const FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.black,
                            size: 25,
                          ),
                          Text(
                            "Login with Google",
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
