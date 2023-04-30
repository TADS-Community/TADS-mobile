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
  "password_requirement": "Minimum length 8, at least\nnone upper case letter one digit.",
  "enter": "Enter",
  "generated_id": "Your generated ID",
  "error_generating": "Error occurred while generating\nHit the refresh button",
  "error_unknown": "Unknown error",
  "error_server": "Server error",
  "error_internet": "Internet connection error",
  "email": "Email",
  "phone_number": "Phone number",
  "or": "or",
  "forgot_password": "Forgot password?",
  "dark": "Dark",
  "set_up_pin": "Set up PIN",
  "create_pin": "Create PIN",
  "confirm_pin": "Confirm PIN",
  "enter_pin": "Enter the PIN",
  "main": "Main",
  "search": "Search",
  "profile": "Profile",
  "your_id": "Your ID",
  "first_name": "First name",
  "last_name": "Last name",
  "verify": "Verify"
};
static const Map<String,dynamic> uz = {
  "login": "Kirish",
  "registration": "Ro'yxatdan o'tish",
  "length_input": "{} tadan ko'p belgi bo'lsin",
  "password": "Parol",
  "password_requirement": "Minimal uzunlik 8, \nkamida bir dona katta harf va raqam.",
  "enter": "Kirish",
  "generated_id": "Siz uchun ID",
  "error_generating": "Yaratish vaqtida xatolik yuz berdi\nYangilash tugmasini bosing",
  "error_unknown": "Noma'lum xatolik",
  "error_server": "Server xatoligi",
  "error_internet": "Internet bilan xatolik",
  "email": "Email",
  "phone_number": "Telefon raqam",
  "or": "yoki",
  "forgot_password": "Parolni unutdingizmi?",
  "dark": "Tungi",
  "set_up_pin": "PIN o'rnatish",
  "create_pin": "PIN o'ylab toping",
  "confirm_pin": "PIN ni tasdiqlang",
  "enter_pin": "PIN ni kiriting",
  "main": "Asosiy",
  "search": "Qidirish",
  "profile": "Profil",
  "your_id": "Sizning ID",
  "first_name": "Ism",
  "last_name": "Familiya",
  "verify": "Tasdiqlash"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "uz": uz};
}
