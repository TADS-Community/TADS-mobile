import 'package:dio/dio.dart';
import 'package:tads_app/src/data/local_source/local_storage.dart';

class CustomInterceptor implements Interceptor {
  final Dio dio;

  const CustomInterceptor({required this.dio});

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.badResponse &&
        (err.response?.statusCode == 403 || err.response?.statusCode == 401)) {
      LocalStorage.setAccessToken('');
      await _refreshToken(err.requestOptions.baseUrl);
      if (LocalStorage.getAccessToken
          .replaceAll('Bearer', '')
          .trim()
          .isNotEmpty) {
        err.requestOptions.headers['Authorization'] =
            LocalStorage.getAccessToken;
      }

      final response = await _resolveResponse(err.requestOptions);
      handler.resolve(response);
      return;
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 403 || response.statusCode == 401) {
      if (LocalStorage.getRefreshToken.isEmpty) {
        handler.next(response);
        return;
      }
      await _refreshToken(response.requestOptions.baseUrl);
      if (LocalStorage.getAccessToken
          .replaceAll('Bearer', '')
          .trim()
          .isNotEmpty) {
        response.requestOptions.headers['Authorization'] =
            LocalStorage.getAccessToken;
      }
      final resolved = await _resolveResponse(response.requestOptions);
      handler.resolve(resolved);
      return;
    }
    handler.next(response);
  }

  Future<void> _refreshToken(String baseUrl) async {
    if (LocalStorage.getRefreshToken.isNotEmpty) {
      final response = await dio.post('${baseUrl}users/token/refresh/',
          data: {"refresh": LocalStorage.getRefreshToken});
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        LocalStorage.setAccessToken('Bearer ${response.data['access']}');
      } else {
        LocalStorage.setRefreshToken('');
      }
    }
  }

  Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
    final path =
        options.path.replaceAll('https://musofir.uicgroup.tech/api/', '');
    return await dio.request(options.baseUrl + path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          headers: options.headers,
          method: options.method,
        ));
  }
}
