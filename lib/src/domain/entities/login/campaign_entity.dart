import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tads_app/src/data/models/login/campaign_model.dart';

class CampaignEntity extends Equatable {
  final int id;
  final String title;

  const CampaignEntity({
    this.id = -1,
    this.title = '',
  });

  @override
  List<Object?> get props => [id, title];
}

class CampaignConverter
    implements JsonConverter<CampaignEntity, Map<String, dynamic>?> {
  const CampaignConverter();

  @override
  CampaignEntity fromJson(Map<String, dynamic>? json) =>
      CampaignModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CampaignEntity object) => {};
}
