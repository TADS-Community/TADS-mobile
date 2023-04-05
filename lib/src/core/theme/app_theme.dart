import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/src/core/constants/constants.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const pageTransitionsTheme = PageTransitionsTheme(
      builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()});

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white70,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      titleTextStyle: GoogleFonts.spaceMono(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    textTheme: GoogleFonts.spaceMonoTextTheme(
        ThemeData(brightness: Brightness.light).textTheme),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.light),
    tooltipTheme: const TooltipThemeData(
      waitDuration: Duration(milliseconds: 500),
    ),
    pageTransitionsTheme: pageTransitionsTheme,
    primaryColor: AppColors.accentColor,
    indicatorColor: AppColors.accentColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.accentColor,
    ),
    fontFamily: GoogleFonts.spaceMono().fontFamily,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    primaryColorDark: AppColors.accentColor,
    primaryColorLight: AppColors.accentColor,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black.withOpacity(.65),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppConsts.kBorderRadius)),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white)),
    colorScheme: const ColorScheme.light(),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    textTheme: GoogleFonts.spaceMonoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
    tooltipTheme: const TooltipThemeData(
      waitDuration: Duration(milliseconds: 500),
    ),
    pageTransitionsTheme: pageTransitionsTheme,
    indicatorColor: AppColors.accentColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: AppColors.accentColor,
    ),
    fontFamily: GoogleFonts.spaceMono().fontFamily,
    canvasColor: Colors.black,
    cardColor: const Color(0xFF1B1C1E),
    primaryColorDark: Colors.black,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppConsts.kBorderRadius)),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white)),
    colorScheme: const ColorScheme.dark(),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF1B1C1E)),
  );
}
