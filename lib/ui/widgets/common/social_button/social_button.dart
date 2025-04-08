import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'social_button_model.dart';

class SocialButton extends StackedView<SocialButtonModel> {
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final bool hasIcon;
  final Icon icon;
  const SocialButton(
      {required this.title,
      required this.onTap,
      required this.bgColor,
      required this.textColor,
      required this.borderColor,
      required this.hasIcon,
      required this.icon,
      super.key});

  @override
  Widget builder(
    BuildContext context,
    SocialButtonModel viewModel,
    Widget? child,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          hasIcon ? icon : const SizedBox(),
          Text(
            title,
            style: GoogleFonts.hankenGrotesk(
              letterSpacing: -1,
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  SocialButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      SocialButtonModel();
}
