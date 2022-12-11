import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/src/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.spaceMonoTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(elevation: 2),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.light),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.spaceMonoTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 2,
      backgroundColor: AppColors.appBarColor,
    ),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
  );
}
