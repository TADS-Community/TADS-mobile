import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tads_app/consts.dart';
import 'package:tads_app/src/core/api_provider/base/dio_settings.dart';
import 'package:tads_app/src/core/get_it/service_locator.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/registration/data/models/register_response_model.dart';

part 'register_client.g.dart';

@RestApi(baseUrl: Consts.BASE_URL_PROD)
abstract class RegisterClient {
  static final dio = serviceLocator<DioSettings>().dio;

  static RegisterClient? _loginClient;

  static RegisterClient getInstance(
      {String baseUrl = Consts.BASE_URL_PROD}) {
    if (_loginClient != null) {
      return _loginClient!;
    } else {
      _loginClient = RegisterClient(dio, baseUrl);
      return _loginClient!;
    }
  }

  factory RegisterClient(Dio dio, String baseUrl) {
    return _RegisterClient(dio, baseUrl: baseUrl);
  }

  static removeRegisterClient() {
    _loginClient = null;
  }

  @POST("auth/register/")
  Future<RegisterResponseModel> login(
    @Body() AuthPostModel model,
  );
}
