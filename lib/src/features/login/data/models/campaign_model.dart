import 'package:json_annotation/json_annotation.dart';
import 'package:tads_app/src/features/login/domain/entities/campaign_entity.dart';

part 'campaign_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignModel extends CampaignEntity {
  const CampaignModel({
    super.id,
    super.title,
    this.description,
  });

  final String? description;

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
}
