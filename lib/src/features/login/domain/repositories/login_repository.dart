import 'package:tads_app/src/core/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/domain/entities/campaign_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, dynamic>> login(AuthPostModel model) async {
    throw 'login not implemented';
  }

  Future<Either<Failure, List<CampaignEntity>>> getDonationList(
    int limit,
    int page,
  ) async {
    throw 'getDonationList not implemented';
  }

  void dispose() {
    throw 'not implemented';
  }
}
