import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/core/api_provider/interceptors/token_referesh_interceptor.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppConsts.BASE_URL_PROD,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    followRedirects: false,
    headers: {
      "Authorization": LocalStorage.getAccessToken,
      "Accept-Language": LocalStorage.getLocale,
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions() {
    _dioBaseOptions = BaseOptions(
      baseUrl: AppConsts.BASE_URL_PROD,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Accept-Language": LocalStorage.getLocale,
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  static CancelToken cancelToken = CancelToken();

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors
      ..add(CustomInterceptor(dio: dio))
      ..add(RetryInterceptor(
          dio: dio,
          refreshTokenFunction: () async {
            await LocalStorage.clearProfile();
            cancelToken.cancel();
          },
          toNoInternetPageNavigator: () async {
            // await Get.to(const InternetConnectionPage());
          },
          forbiddenFunction: () async {
            // Get.offNamedUntil(AppRoutes.requestAuth, (route) => false);
            await LocalStorage.clearProfile();
            cancelToken.cancel();
          }))
      ..add(LogInterceptor(
        responseBody: kDebugMode,
        requestBody: kDebugMode,
        request: kDebugMode,
        requestHeader: kDebugMode,
      ));
    return dio;
  }
}
