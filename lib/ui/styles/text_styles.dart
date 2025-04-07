// lib/ui/styles/text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final mainHeading = GoogleFonts.hankenGrotesk(
    fontWeight: FontWeight.w800,
    letterSpacing: -4,
    wordSpacing: -4,
    fontSize: 74,
    height: 0.9,
    color: Colors.black,
  );
  static final heading1 = GoogleFonts.hankenGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final heading2 = GoogleFonts.hankenGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static final bodyText1 = GoogleFonts.hankenGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static final bodyText2 = GoogleFonts.hankenGrotesk(
    letterSpacing: -1,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  static final caption = GoogleFonts.hankenGrotesk(
    letterSpacing: -1,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );
}
