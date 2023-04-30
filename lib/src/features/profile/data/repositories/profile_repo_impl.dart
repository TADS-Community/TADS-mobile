import 'package:dio/dio.dart';
import 'package:tads_app/src/core/api_provider/exceptions/exceptions.dart';
import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/profile/data/api_provider/profile_client.dart';
import 'package:tads_app/src/features/profile/data/models/user_model.dart';
import 'package:tads_app/src/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ProfileClient _dataSource = ProfileClient.getInstance();

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final result = await _dataSource.getUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.statusCode));
    } on DioException {
      return Left(ParsingFailure());
    } on DioError catch (e) {
      return Left(DioFailure(error: e));
    } catch (error) {
      return Left(ParsingFailure());
    }
  }

  @override
  void dispose() {
    ProfileClient.removeProfileClient();
  }
}
