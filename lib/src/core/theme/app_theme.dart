import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
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
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.spaceMonoTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme),
    cupertinoOverrideTheme:
        const CupertinoThemeData(brightness: Brightness.dark),
  );
}
