import 'package:flutter/material.dart';
import 'package:tads_app/src/core/theme/app_theme.dart';
import 'package:tads_app/src/presentation/pages/home/home_page.dart';

class TadsApp extends StatelessWidget {
  const TadsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
