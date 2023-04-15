import 'package:tads_app/src/core/utils/either.dart';
import 'package:tads_app/src/data/api_provider/exceptions/failures.dart';
import 'package:tads_app/src/domain/entities/login/campaign_entity.dart';

abstract class LoginRepository {
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
