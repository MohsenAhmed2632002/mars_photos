import 'package:flutter/material.dart';
import 'package:mars_photos/core/Constans/Colors.dart';
import 'package:mars_photos/core/Constans/Font.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // brightness: Brightness.dark,
    /////////////////
    appBarTheme: AppBarTheme(
      color: ColorManager.grey,
      elevation: Fontsize.s22,
      centerTitle: false,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 1, 23, 135)),
      shadowColor: ColorManager.darkPrimary,
      titleTextStyle: getBoldTextStyle(
        color: Colors.white,
      ),
    ),
    fontFamily: FontConstants.fontFamily,
    //////////////////
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    useMaterial3: true,
    ////////////////
    cardTheme: CardTheme(
      color: ColorManager.darkPrimary,
      shadowColor: ColorManager.darkGrey,
      elevation: Fontsize.s8,
    ),

    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
          color: Colors.white,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    ),
    ////////////////////
    textTheme: TextTheme(
        subtitle1: getMediumTextStyle(
          color: ColorManager.darkGrey,
        ),
        headline1: getBoldTextStyle(
          color: ColorManager.darkGrey,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        12,
      ),
      hintStyle: getRegulerTextStyle(
        color: ColorManager.darkGrey,
      ),
      labelStyle: getRegulerTextStyle(
        color: ColorManager.grey,
      ),
      errorStyle: getMediumTextStyle(
        color: Colors.red,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.darkPrimary),
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
    ),
  );
}
