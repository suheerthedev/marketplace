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
  final bool isDisabled;

  const CustomButton({
    required this.title,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
    this.isDisabled = false,
    super.key,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomButtonModel viewModel,
    Widget? child,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: isDisabled ? Colors.grey[300] : bgColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDisabled ? Colors.grey[400]! : borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isDisabled ? null : onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              color: isDisabled ? Colors.grey[600] : textColor,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
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
