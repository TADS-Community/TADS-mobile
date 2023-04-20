// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppConsts {
  AppConsts._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(
    debugLabel: "TADS",
  );

  static const BASE_URL_PROD = '';

  static Size get size => _size ?? const Size(0, 0);
  static Size? _size;

  static setSize(BuildContext context) async {
    _size ??= MediaQuery.of(context).size;
  }
}

const appName = 'TADS';
const uz = 'uz';
const en = 'en';
const dark = 'dark';
const light = 'light';

const kBorderRadius = 4.0;

const kHeight2 = SizedBox(height: 2);
const kHeight4 = SizedBox(height: 4);
const kHeight8 = SizedBox(height: 8);
const kHeight16 = SizedBox(height: 16);
const kHeight24 = SizedBox(height: 24);
const kHeight32 = SizedBox(height: 32);
const kHeight36 = SizedBox(height: 36);
const kHeight40 = SizedBox(height: 40);
const kHeight48 = SizedBox(height: 48);

const kWidth2 = SizedBox(width: 2);
const kWidth4 = SizedBox(width: 4);
const kWidth8 = SizedBox(width: 8);
const kWidth16 = SizedBox(width: 16);
const kWidth24 = SizedBox(width: 24);
