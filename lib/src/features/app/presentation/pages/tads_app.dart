import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    bloc = AppBloc(LocalStorage.getThemeMode);
    _authenticated = LocalStorage.getID != -1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return KeyboardDismisser(
            gestures: const [GestureType.onTap],
            child: AnnotatedRegion(
              value: SystemUiOverlayStyle(
                systemNavigationBarColor: LocalStorage.getThemeMode == dark
                    ? Colors.black
                    : Colors.white,
                systemNavigationBarIconBrightness:
                    LocalStorage.getThemeMode == dark
                        ? Brightness.light
                        : Brightness.dark,
              ),
              child: MaterialApp(
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode:
                    state.themeMode == dark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                title: appName,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                initialRoute: !_authenticated
                    ? AppRoutes.login
                    : LocalStorage.getPinCode.isNotEmpty
                        ? AppRoutes.checkPinCode
                        : AppRoutes.setPinCode,
                routes: AppRoutes.routes,
              ),
            ),
          );
        },
      ),
    );
  }
}
