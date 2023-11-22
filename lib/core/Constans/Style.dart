import 'package:flutter/material.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';

ThemeData getAppTheme(bool isDark) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    brightness:
        isDark ? lightColorScheme.brightness : darkColorScheme.brightness,
    //////////////////

    ////////////////
    cardTheme: CardTheme(
      elevation: Fontsize.s8,
    ),
/////////////////
    appBarTheme: AppBarTheme(
      elevation: Fontsize.s22,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: getBoldTextStyle(
        color: lightColorScheme.primaryContainer,
      ),
    ),
    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    ),
    ////////////////////
    textTheme: TextTheme(
        titleMedium: getMediumTextStyle(
          color: lightColorScheme.primaryContainer,
        ),
        displayLarge: getBoldTextStyle(
          color: lightColorScheme.primaryContainer,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        12,
      ),
      hintStyle: getRegulerTextStyle(color: lightColorScheme.onSecondary),
      labelStyle: getRegulerTextStyle(color: lightColorScheme.onSecondary),
      errorStyle: getMediumTextStyle(
        color: lightColorScheme.primaryContainer,
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
