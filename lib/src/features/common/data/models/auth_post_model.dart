import 'package:json_annotation/json_annotation.dart';

part 'auth_post_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthPostModel {
  final String? uid;
  final String password;
  final String? email;
  final String? phone;

  AuthPostModel({
    this.uid,
    required this.password,
    this.email,
    this.phone,
  });

  factory AuthPostModel.fromJson(Map<String, dynamic> json) =>
      _$AuthPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthPostModelToJson(this);
}
