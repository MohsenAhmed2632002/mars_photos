import 'package:flutter/material.dart';
import 'package:mars_photos/core/Constans/Font.dart';
import 'package:mars_photos/core/Constans/color_schemes.g.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // brightness: Brightness.dark,
    /////////////////
    appBarTheme: AppBarTheme(
      // color: ColorManager.grey,
      elevation: Fontsize.s22,
      centerTitle: false,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 1, 23, 135)),
      // shadowColor: ColorManager.darkPrimary,
      titleTextStyle: getBoldTextStyle(
        color: lightColorScheme.primaryContainer,
      ),
    ),
    fontFamily: FontConstants.fontFamily,
    //////////////////
    useMaterial3: true,
    ////////////////
    cardTheme: CardTheme(
      
      elevation: Fontsize.s8,
    ),

    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
color:          lightColorScheme.primaryContainer,
        ),
        // primary: ColorManager.primary,
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
      hintStyle: getRegulerTextStyle(
      color:  lightColorScheme.primaryContainer,
      ),
      labelStyle: getRegulerTextStyle(
      color:  lightColorScheme.primaryContainer,
      ),
      errorStyle: getMediumTextStyle(
        color: lightColorScheme.primaryContainer,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
    ),
  );
}
