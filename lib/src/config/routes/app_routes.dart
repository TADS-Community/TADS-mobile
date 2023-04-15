import 'package:flutter/material.dart';
import 'package:tads_app/src/presentation/pages/home/home_page.dart';
import 'package:tads_app/src/features/login/presentation/pages/login_page.dart';
import 'package:tads_app/src/features/registration/presentation/pages/registration_page.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const authConfirm = '/auth_confirm';
  static const search = '/search';

  static final routes = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegistrationPage(),
  };

}
