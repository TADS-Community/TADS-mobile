import 'package:json_annotation/json_annotation.dart';
import 'package:tads_app/src/features/profile/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel extends UserEntity {
  const UserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.uid,
    required super.phoneVerified,
    required super.emailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
