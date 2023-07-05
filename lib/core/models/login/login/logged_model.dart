import 'package:test_app_flutter/core/models/login/token/token_model.dart';
import 'package:test_app_flutter/core/models/login/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_model.g.dart';

@JsonSerializable()
class LoggedModel {
  TokenModel tokens;
  UserModel user;

  LoggedModel({
    required this.tokens,
    required this.user,
  });

  factory LoggedModel.fromJson(Map<String, dynamic> data) =>
      _$LoggedModelFromJson(data);

  Map<String, dynamic> toJson() => _$LoggedModelToJson(this);
}
