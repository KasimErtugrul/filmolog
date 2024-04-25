import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: ColorManager.primaryBackground,
    primaryColorLight: ColorManager.secondary,

    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.secondaryBackground,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.primaryText,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getTextStyle(
        fontSize: 18.h,
        color: ColorManager.secondaryText,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: _getTextStyle(
        // Changed 'titleMedium' to 'headline6' as per Flutter 2.x standards
        fontSize: 20.h,
        color: ColorManager.secondaryText,
      ),
      titleMedium: _getTextStyle(
        // Changed 'titleSmall' to 'subtitle1' as per Flutter 2.x standards
        fontSize: 15.h,
        color: ColorManager.secondaryText,
      ),
      bodyLarge: _getTextStyle(
        // Changed 'bodyLarge' to 'bodyText1' as per Flutter 2.x standards
        fontSize: 14.h,
        fontWeight: FontWeight.w400,
        color: ColorManager.primaryText,
      ),
      bodyMedium: _getTextStyle(
        // Changed 'bodyMedium' to 'bodyText2' as per Flutter 2.x standards
        fontSize: 14.h,
        color: ColorManager.secondaryText,
      ),
      bodySmall: _getTextStyle(
        // Changed 'bodySmall' to 'caption' as per Flutter 2.x standards
        fontSize: 9.h,
        fontWeight: FontWeight.w400,
        color: ColorManager.primaryText,
      ),
    ),
  );
}

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: 'Quicksand',
  );
}
