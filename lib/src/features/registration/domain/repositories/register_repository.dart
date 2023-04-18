import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/registration/data/models/register_response_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseModel>> register(AuthPostModel model) async {
    throw 'register() not implemented';
  }

  void dispose() {
    throw 'not implemented';
  }
}
