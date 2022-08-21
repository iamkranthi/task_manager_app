import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.bold,
    ),
  );
}
