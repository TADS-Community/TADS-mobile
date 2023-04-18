import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/data/models/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseModel>> login(AuthPostModel model) async {
    throw 'login not implemented';
  }

  void dispose() {
    throw 'not implemented';
  }
}
