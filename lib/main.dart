import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/generated/codegen_loader.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/presentation/pages/app/tads_app.dart';
import 'package:tads_app/src/utils/get_it/service_locator.dart';
import 'package:tads_app/src/utils/local_source/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorage.getInstance();
  await setupLocator();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(uz),
        Locale(en),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(uz),
      startLocale: const Locale(uz),
      assetLoader: const CodegenLoader(),
      child: const TadsApp(),
    ),
  );
}
