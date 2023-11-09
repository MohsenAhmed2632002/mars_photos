import 'package:flutter/material.dart';
import 'package:mars_photos/core/Constans/colors.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';

ThemeData getAppTheme(bool isDark) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    brightness:
        isDark ? lightColorScheme.brightness : darkColorScheme.brightness,
    //////////////////
    // primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,

    ////////////////
    cardTheme: CardTheme(
      // color: colorManager.darkPrimary,
      // shadowcolor: colorManager.darkGrey,
      elevation: Fontsize.s8,
    ),
/////////////////
    appBarTheme: AppBarTheme(
      // color: colorManager.primary,
      elevation: Fontsize.s22,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      //  shadowColor: colorManager.lightPrimary,
      titleTextStyle: getBoldTextStyle(
          // color:Colors.white,
          ),
    ),
    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
            // color: Colors.white,
            ),
        // primary: Colors.primary,
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
            // color: Colors.darkGrey,
            ),
        headline1: getBoldTextStyle(
            // color: colorManager.darkGrey,
            )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        12,
      ),
      hintStyle: getRegulerTextStyle(
          // color: colorManager.darkGrey,
          ),
      labelStyle: getRegulerTextStyle(
          // color: colorManager.grey,
          ),
      errorStyle: getMediumTextStyle(
          // color: colors.red,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            // color: colorManager.lightGrey
            ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            // color: colorManager.primary
            ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            // color: colorManager.darkPrimary
            ),
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
    ),
  );
}
