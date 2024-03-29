import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tads_app/consts.dart';
import 'package:tads_app/src/core/api_provider/base/dio_settings.dart';
import 'package:tads_app/src/core/get_it/service_locator.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/data/models/login_response_model.dart';

part 'login_client.g.dart';

@RestApi(baseUrl: Consts.BASE_URL_PROD)
abstract class LoginClient {
  static final dio = serviceLocator<DioSettings>().dio;

  static LoginClient? _loginClient;

  static LoginClient getInstance({String baseUrl = Consts.BASE_URL_PROD}) {
    if (_loginClient != null) {
      return _loginClient!;
    } else {
      _loginClient = LoginClient(dio, baseUrl);
      return _loginClient!;
    }
  }

  factory LoginClient(Dio dio, String baseUrl) {
    dio.options.headers = {
      "Authorization": LocalStorage.getAccessToken,
      "Accept-Language": LocalStorage.getLocale,
    };

    return _LoginClient(dio, baseUrl: baseUrl);
  }

  static removeLoginClient() {
    _loginClient = null;
  }

  @POST("auth/login/")
  Future<LoginResponseModel> login(
    @Body() AuthPostModel model,
  );

}
