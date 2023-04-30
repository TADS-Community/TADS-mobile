import 'package:json_annotation/json_annotation.dart';

part 'user_update_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserUpdateModel {
  UserUpdateModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}
