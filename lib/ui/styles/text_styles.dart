// lib/ui/styles/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final mainHeading = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    letterSpacing: -4,
    wordSpacing: -4,
    fontSize: 70,
    height: 0.8,
    color: Colors.black,
  );
  static final heading1 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final heading2 = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static final bodyText1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static final bodyText2 = GoogleFonts.roboto(
    letterSpacing: -1,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static final caption = GoogleFonts.roboto(
    letterSpacing: -1,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );
}
