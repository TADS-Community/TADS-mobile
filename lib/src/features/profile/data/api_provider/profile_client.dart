import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tads_app/consts.dart';
import 'package:tads_app/src/core/api_provider/base/dio_settings.dart';
import 'package:tads_app/src/core/get_it/service_locator.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/profile/data/models/user_model.dart';
import 'package:tads_app/src/features/profile/data/models/user_update_model.dart';

part 'profile_client.g.dart';

@RestApi(baseUrl: Consts.BASE_URL_PROD)
abstract class ProfileClient {
  static final dio = serviceLocator<DioSettings>().dio;

  static ProfileClient? _profileClient;

  static ProfileClient getInstance({String baseUrl = Consts.BASE_URL_PROD}) {
    if (_profileClient != null) {
      return _profileClient!;
    } else {
      _profileClient = ProfileClient(dio, baseUrl);
      return _profileClient!;
    }
  }

  factory ProfileClient(Dio dio, String baseUrl) {
    dio.options.headers = {
      "Authorization": LocalStorage.getAccessToken,
      "Accept-Language": LocalStorage.getLocale,
    };

    return _ProfileClient(dio, baseUrl: baseUrl);
  }

  static removeProfileClient() {
    _profileClient = null;
  }

  @GET("userdetail/")
  Future<UserModel> getUser();

  @PUT("userdetail/")
  Future<UserModel> updateUser(@Body() UserUpdateModel body);
}
