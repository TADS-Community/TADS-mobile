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
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
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
    primaryColor: Colors.blueAccent,
    indicatorColor: Colors.blueAccent,
    fontFamily: GoogleFonts.spaceMono().fontFamily,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    primaryColorDark: Colors.blueAccent,
    primaryColorLight: Colors.blueAccent,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black.withOpacity(.65),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white)),
    colorScheme: const ColorScheme.light(),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.blue,
        selectionColor: Colors.blue,
        cursorColor: Colors.blue),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.blue,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorStyle: const TextStyle(color: Colors.red),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColorNight,
    textTheme: GoogleFonts.spaceMonoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
    tooltipTheme: const TooltipThemeData(
      waitDuration: Duration(milliseconds: 500),
    ),
    pageTransitionsTheme: pageTransitionsTheme,
    indicatorColor: Colors.blueAccent,
    fontFamily: GoogleFonts.spaceMono().fontFamily,
    canvasColor: Colors.black,
    cardColor: const Color(0xFF1B1C1E),
    primaryColorDark: Colors.black,

    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white)),
    colorScheme: const ColorScheme.dark(),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF1B1C1E)),
    textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.green,
        selectionColor: Colors.green,
        cursorColor: Colors.greenAccent),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.green,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.greenAccent),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      errorStyle: const TextStyle(color: Colors.red),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
        backgroundColor: Colors.greenAccent,
        minimumSize: const Size.fromHeight(50),
        textStyle: GoogleFonts.spaceMonoTextTheme().titleMedium,
        foregroundColor: Colors.black,
      ),
    ),
  );
}
