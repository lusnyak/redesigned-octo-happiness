// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedModel _$LoggedModelFromJson(Map<String, dynamic> json) => LoggedModel(
      tokens: TokenModel.fromJson(json['tokens'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoggedModelToJson(LoggedModel instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'user': instance.user,
    };
