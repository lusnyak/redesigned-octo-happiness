import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String email;
  String nickname;

  UserModel({
    required this.id,
    required this.email,
    required this.nickname,
  });

  UserModel.init(List<String> info) :
    id = int.tryParse(info[0].toString()) ?? 0,
    email = info[1].toString(),
    nickname = info[2].toString();

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
