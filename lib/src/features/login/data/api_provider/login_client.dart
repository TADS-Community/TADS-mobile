import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/core/api_provider/base/dio_settings.dart';
import 'package:tads_app/src/core/get_it/service_locator.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/data/models/campaign_model.dart';

part 'login_client.g.dart';

@RestApi(baseUrl: AppConsts.BASE_URL_PROD)
abstract class LoginClient {
  static final dio = serviceLocator<DioSettings>().dio;

  static LoginClient? _loginClient;

  static LoginClient getInstance({String baseUrl = AppConsts.BASE_URL_PROD}) {
    if (_loginClient != null) {
      return _loginClient!;
    } else {
      _loginClient = LoginClient(dio, baseUrl);
      return _loginClient!;
    }
  }

  factory LoginClient(Dio dio, String baseUrl) {
    return _LoginClient(dio, baseUrl: baseUrl);
  }

  static removeLoginClient() {
    _loginClient = null;
  }

  @POST("auth/login/")
  Future<AuthPostModel> login(
    @Body() AuthPostModel model,
  );

  @GET("auth/login")
  Future<List<CampaignModel>> getCampaignList(
    @Query('limit') int? limit,
    @Query('page') int? page,
  );
}
