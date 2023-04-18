// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthPostModel _$AuthPostModelFromJson(Map<String, dynamic> json) =>
    AuthPostModel(
      uid: json['uid'] as String?,
      password: json['password'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$AuthPostModelToJson(AuthPostModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
    };
