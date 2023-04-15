import 'package:dio/dio.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/data/api_provider/exceptions/exceptions.dart';
import 'package:tads_app/src/data/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/data/api_provider/login_client.dart';
import 'package:tads_app/src/domain/entities/login/campaign_entity.dart';
import 'package:tads_app/src/domain/repositories/login_repository.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginClient _dataSource = LoginClient.getInstance();

  @override
  Future<Either<Failure, List<CampaignEntity>>> getDonationList(
    int limit,
    int page,
  ) async {
    try {
      final result = await _dataSource.getCampaignList(limit, page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  void dispose() {
    LoginClient.removeLoginClient();
  }
}
