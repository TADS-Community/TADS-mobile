import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/config/theme/app_theme.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/app/presentation/blocs/app_bloc.dart';

class TadsApp extends StatefulWidget {
  const TadsApp({Key? key}) : super(key: key);

  @override
  State<TadsApp> createState() => _TadsAppState();
}

class _TadsAppState extends State<TadsApp> {
  bool _authenticated = false;
  late AppBloc bloc;

  @override
  void initState() {
    super.initState();
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    bloc = AppBloc(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    _authenticated = LocalStorage.getAccessToken.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return KeyboardDismisser(
            gestures: const [GestureType.onTap],
            child: MaterialApp(
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              title: appName,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              initialRoute: _authenticated ? AppRoutes.home : AppRoutes.login,
              routes: AppRoutes.routes,
            ),
          );
        },
      ),
    );
  }
}
