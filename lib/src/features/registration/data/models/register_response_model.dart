import 'package:json_annotation/json_annotation.dart';
import 'package:tads_app/src/features/login/data/models/login_response_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterResponseModel extends LoginResponseModel {
  final int uid;

  RegisterResponseModel({
    required this.uid,
    required super.access,
    required super.refresh,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
