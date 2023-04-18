import 'package:flutter/material.dart';
import 'package:tads_app/src/features/home/presentation/pages/home.dart';
import 'package:tads_app/src/features/login/presentation/pages/login_page.dart';
import 'package:tads_app/src/features/pin_code/pin_code_check_screen.dart';
import 'package:tads_app/src/features/pin_code/pin_code_set_screen.dart';
import 'package:tads_app/src/features/registration/presentation/pages/registration_page.dart';

abstract class AppRoutes {

  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const authConfirm = '/auth_confirm';
  static const search = '/search';
  static const setPinCode = '/pin_code_set';
  static const checkPinCode = '/pin_code_check';

  static final routes = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegistrationPage(),
    setPinCode: (context) => const PinCodeSetPage(),
    checkPinCode: (context) => const PinCodeCheckPage(),
  };

}
