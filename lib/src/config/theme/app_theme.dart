import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const pageTransitionsTheme = PageTransitionsTheme(
      builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()});

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
        backgroundColor: Colors.blue,
        minimumSize: const Size.fromHeight(50),
        textStyle: GoogleFonts.spaceMonoTextTheme().titleMedium,
        foregroundColor: Colors.white,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(Colors.white),
    ),
    dialogBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
        textStyle: GoogleFonts.spaceMonoTextTheme().titleMedium,
        foregroundColor: Colors.black,
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff1B1B1B),
    textTheme: GoogleFonts.spaceMonoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
    appBarTheme: AppBarTheme(
      color: const Color(0xff111111),
      titleTextStyle: GoogleFonts.spaceMono(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    pageTransitionsTheme: pageTransitionsTheme,
    fontFamily: GoogleFonts.spaceMono().fontFamily,
    cardColor: AppColors.classicDark2,
    primaryColor: const Color(0xff1B1B1B),
    primaryColorDark: const Color(0xff111111),
    primaryColorLight: const Color(0xff2D2D2D),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white)),
    colorScheme: const ColorScheme.dark(),
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Color(0xff111111)),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
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
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.greenAccent),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.white),
      trackColor: MaterialStateProperty.all(Colors.greenAccent),
    ),
    dialogBackgroundColor: const Color(0xff1B1B1B),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
        textStyle: GoogleFonts.spaceMonoTextTheme().titleMedium,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
