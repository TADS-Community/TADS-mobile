import 'package:get_it/get_it.dart';
import 'package:tads_app/src/data/api_provider/api_client.dart';
import 'package:tads_app/src/data/local_source/local_source.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await LocalSource.getInstance();
  ApiClient.getInstance();
  // serviceLocator.registerLazySingleton(() => MainRepoImpl());
}