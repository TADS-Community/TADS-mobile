import 'package:get_it/get_it.dart';
import 'package:tads_app/src/data/api_provider/base/dio_settings.dart';
import 'package:tads_app/src/data/api_provider/login_client.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => DioSettings());
}