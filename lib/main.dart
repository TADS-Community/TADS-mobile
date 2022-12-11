import 'package:flutter/material.dart';
import 'package:tads_app/src/data/get_it/service_locator.dart';
import 'package:tads_app/src/presentation/pages/app/tads_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const TadsApp());
}
