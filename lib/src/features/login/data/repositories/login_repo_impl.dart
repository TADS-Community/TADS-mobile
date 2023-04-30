import 'package:dio/dio.dart';
import 'package:tads_app/src/core/api_provider/exceptions/exceptions.dart';
import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/data/api_provider/login_client.dart';
import 'package:tads_app/src/features/login/data/models/login_response_model.dart';
import 'package:tads_app/src/features/login/domain/repositories/login_repository.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginClient _dataSource = LoginClient.getInstance();

  @override
  Future<Either<Failure, LoginResponseModel>> login(AuthPostModel model) async {
    try {
      final result = await _dataSource.login(model);
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
    LoginClient.removeLoginClient();
  }
}
