import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = "Montserrat";
}

class fontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class Fontsize {
  static const double s8 = 8;

  static const double s12 = 12;

  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;

  static const double s22 = 22;
}

TextStyle _getTextStyle({
  required double fontsize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontsize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegulerTextStyle({
  double fontSize = Fontsize.s12,
  required Color color,
}) {
  return _getTextStyle(
      color: color, fontsize: fontSize, fontWeight: fontWeightManager.regular);
}

TextStyle getMediumTextStyle({
  double fontSize = Fontsize.s12,
  required Color color,
}) {
  return _getTextStyle(
      color: color, fontsize: fontSize, fontWeight: fontWeightManager.medium);
}

TextStyle getLightTextStyle({
  double fontSize = Fontsize.s12,
  required Color color,
}) {
  return _getTextStyle(
      color: color, fontsize: fontSize, fontWeight: fontWeightManager.light);
}

TextStyle getBoldTextStyle({
  double fontSize = Fontsize.s16,
  required Color color,
}) {
  return _getTextStyle(
    color: color,
    fontsize: fontSize,
    fontWeight: fontWeightManager.bold,
  );
}
