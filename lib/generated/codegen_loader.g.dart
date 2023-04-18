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
  "password": "Password",
  "enter": "Enter",
  "generated_id": "Your generated ID",
  "error_generating": "Error occurred while generating\nHit the refresh button",
  "error_unknown": "Unknown error",
  "error_server": "Server error",
  "error_internet": "Internet connection error"
};
static const Map<String,dynamic> uz = {
  "login": "Kirish",
  "registration": "Ro'yxatdan o'tish",
  "length_input": "{} tadan ko'p belgi bo'lsin",
  "password": "Parol",
  "enter": "Kirish",
  "generated_id": "Siz uchun ID",
  "error_generating": "Yaratish vaqtida xatolik yuz berdi\nYangilash tugmasini bosing",
  "error_unknown": "Noma'lum xatolik",
  "error_server": "Server xatoligi",
  "error_internet": "Internet bilan xatolik"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "uz": uz};
}
