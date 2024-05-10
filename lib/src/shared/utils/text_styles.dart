import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSize {
  double small = 6.0;
  double xSmall = 10.0;
  double medium = 14.0;
  double xMedium = 18.0;
  double large = 22.0;
  double xLarge = 26.0;
  double big = 30.0;
  double xBig = 34.0;
  double profileSize = 55.0;
}

class TextStyles {
  TextStyle appBarTitle({
    Color? textColor,
    double? size,
    FontWeight? weight,
  }) {
    return GoogleFonts.lato(
        fontSize: size ?? TextSize().medium,
        color: textColor ?? Colors.black,
        fontWeight: weight ?? FontWeight.w700);
  }

  TextStyle paragraph(
    double size, {
    FontWeight? weight,
    Color? color,
    bool isLink = false,
  }) {
    return GoogleFonts.lato(
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
        fontSize: size,
        color: isLink ? Colors.blue : color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal);
  }
}
