import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponseModel {
  const LoginResponseModel({
    required this.refresh,
    required this.access,
  });

  final String refresh;
  final String access;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
