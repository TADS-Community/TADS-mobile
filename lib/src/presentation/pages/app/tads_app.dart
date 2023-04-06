import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tads_app/src/core/constants/constants.dart';
import 'package:tads_app/src/core/routes/app_routes.dart';
import 'package:tads_app/src/core/theme/app_theme.dart';
import 'package:tads_app/src/data/local_source/local_source.dart';

class TadsApp extends StatefulWidget {
  const TadsApp({Key? key}) : super(key: key);

  @override
  State<TadsApp> createState() => _TadsAppState();
}

class _TadsAppState extends State<TadsApp> {
  bool _authenticated = false;

  @override
  void initState() {
    super.initState();
    _authenticated = LocalSource.getAccessToken.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: appName,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        routerConfig: AppRoutes.router(_authenticated),
      ),
    );
  }
}
