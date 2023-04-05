import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tads_app/src/core/constants/constants.dart';
import 'package:tads_app/src/data/local_source/local_source.dart';

part 'api_client.g.dart';

// Chuck alice = Chuck(
//   navigatorKey: AppConstants.navigatorKey,
//   showNotification: true,
//   showInspectorOnShake: true,
//   darkTheme: false,
// );

@RestApi(baseUrl: AppConsts.BASE_URL_PROD)
abstract class ApiClient {
  static get getDio {
    Dio dio = Dio(BaseOptions(
      followRedirects: false,
    ));
    if (LocalSource.getChuck) {
      // dio.interceptors.add(alice.getDioInterceptor());
    }
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
          requestHeader: true,
        ),
      );
    }

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        refreshTokenFunction: () async {
          await LocalSource.clearProfile();
          cancelToken.cancel();
        },
        toNoInternetPageNavigator: () async {
          // await Get.to(const InternetConnectionPage());
        },
        forbiddenFunction: () async {
          // Get.offNamedUntil(AppRoutes.requestAuth, (route) => false);
          await LocalSource.clearProfile();
          cancelToken.cancel();
        },
      ),
    );
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = AppConsts.BASE_URL_PROD}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30));
    dio.options.headers = {
      "Authorization": LocalSource.getAccessToken,
      "Accept-Language": LocalSource.getLocale,
    };

    return _ApiClient(dio, baseUrl: baseUrl);
  }

  static removeApiClient() {
    _apiClient = null;
  }

  @GET("donations/")
  Future getDonationList(
    @Query('limit') int? limit,
    @Query('page') int? page,
  );
}
