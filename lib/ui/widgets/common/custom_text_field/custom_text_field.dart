import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  final String title;
  final String hintText;
  final bool hasSuffix;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? errorText;

  const CustomTextField({
    required this.title,
    required this.hintText,
    required this.hasSuffix,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.controller,
    this.errorText,
    super.key,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomTextFieldModel viewModel,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
              color: mainTextColor, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 48,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: hintText,
              hintStyle: GoogleFonts.roboto(
                fontSize: 16,
                color: lightTextColor,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: hasSuffix ? suffixIcon : null,
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
              errorText: errorText,
            ),
          ),
        ),
      ],
    );
  }

  @override
  CustomTextFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomTextFieldModel();
}
