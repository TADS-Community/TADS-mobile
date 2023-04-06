// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "login": "Login",
  "registration": "Registration",
  "length_input": "Length must be larger than {}",
  "password": "Password"
};
static const Map<String,dynamic> uz = {
  "login": "Kirish",
  "registration": "Ro'yxatdan o'tish",
  "length_input": "{} tadan ko'p belgi bo'lsin",
  "password": "Parol"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "uz": uz};
}
