// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    CampaignModel(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
