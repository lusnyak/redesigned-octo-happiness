import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: "accessToken")
  String access;
  @JsonKey(name: "refreshToken")
  String refresh;

  TokenModel({
    required this.refresh,
    required this.access,
  });

  factory TokenModel.fromJson(Map<String, dynamic> data) =>
      _$TokenModelFromJson(data);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
