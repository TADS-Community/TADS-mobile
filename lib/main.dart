import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/generated/codegen_loader.g.dart';
import 'package:tads_app/src/core/constants/constants.dart';
import 'package:tads_app/src/data/get_it/service_locator.dart';
import 'package:tads_app/src/presentation/pages/app/tads_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupLocator();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(AppConsts.uz),
        Locale(AppConsts.en),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(AppConsts.uz),
      startLocale: const Locale(AppConsts.uz),
      assetLoader: const CodegenLoader(),
      child: const TadsApp(),
    ),
  );
}
