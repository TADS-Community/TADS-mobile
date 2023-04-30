import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/profile/data/models/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getUser() {
    throw 'get user not implemented';
  }

  void dispose() {
    throw 'not implemented';
  }
}
