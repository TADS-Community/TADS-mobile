// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>(
    debugLabel: "TADS",
  );

  static const BASE_URL_TEST = '';
  static const BASE_URL_PROD = '';
  static const kBorderRadius = 2.0;
  static const appName = 'TADS';
}
