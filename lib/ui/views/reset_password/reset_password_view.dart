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
          child: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reset Password",
                          style: GoogleFonts.roboto(
                              letterSpacing: -2,
                              wordSpacing: 0,
                              height: 0,
                              color: mainTextColor,
                              fontSize: 36,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Enter your new password",
                          style: GoogleFonts.roboto(
                              color: lightTextColor,
                              fontSize: 16,
                              height: 0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    CustomTextField(
                      title: "New Password",
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
                    CustomTextField(
                      title: "Re-enter Password",
                      hintText: "Enter your password",
                      hasSuffix: true,
                      obscureText: !viewModel.isConfirmPasswordVisible,
                      onChanged: viewModel.setConfirmPassword,
                      suffixIcon: IconButton(
                          onPressed: viewModel.toggleConfirmPasswordVisibility,
                          icon: Icon(
                            viewModel.isConfirmPasswordVisible
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

                    CustomButton(
                      title: "Save",
                      onTap: viewModel.resetPassword,
                      bgColor: mainBackgroundColor,
                      textColor: secondaryTextColor,
                      borderColor: lightBackgroundColor,
                      isDisabled: !viewModel.isFormValid,
                    ),
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
