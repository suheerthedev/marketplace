import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:marketplace/ui/widgets/common/custom_button/custom_button.dart';
import 'package:marketplace/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
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
                    "Reset Password",
                    style: GoogleFonts.hankenGrotesk(
                        letterSpacing: -2,
                        wordSpacing: 0,
                        color: mainTextColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Enter your new password",
                    style: GoogleFonts.hankenGrotesk(
                        color: lightTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              CustomTextField(
                title: "New Password",
                hintText: "Enter your password",
                hasSuffix: true,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: iconColor,
                    )),
              ),
              CustomTextField(
                title: "Re-enter Password",
                hintText: "Enter your password",
                hasSuffix: true,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: iconColor,
                    )),
              ),
              CustomButton(
                  title: "Save",
                  onTap: viewModel.navigateToLogin,
                  bgColor: mainBackgroundColor,
                  textColor: secondaryTextColor,
                  borderColor: lightBackgroundColor,
                  hasIcon: false),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ResetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResetPasswordViewModel();
}
