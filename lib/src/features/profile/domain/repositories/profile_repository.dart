import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/profile/data/models/user_update_model.dart';
import 'package:tads_app/src/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> getUser() {
    throw 'get user not implemented';
  }

  Future<Either<Failure, UserEntity>> updateUser(UserUpdateModel user) {
    throw 'updagte user not implemented';
  }

  void dispose() {
    throw 'not implemented';
  }
}
