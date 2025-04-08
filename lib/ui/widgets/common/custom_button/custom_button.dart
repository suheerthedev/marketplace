import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'custom_button_model.dart';

class CustomButton extends StackedView<CustomButtonModel> {
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final bool hasIcon;
  const CustomButton(
      {required this.title,
      required this.onTap,
      required this.bgColor,
      required this.textColor,
      required this.borderColor,
      required this.hasIcon,
      super.key});

  @override
  Widget builder(
    BuildContext context,
    CustomButtonModel viewModel,
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
        children: [
          Text(
            title,
            style: GoogleFonts.hankenGrotesk(
              letterSpacing: -1,
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 8),
          hasIcon
              ? Icon(
                  Icons.arrow_forward,
                  color: textColor,
                )
              : const SizedBox()
        ],
      ),
    );
  }

  @override
  CustomButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomButtonModel();
}
