// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      user_id: json['user_id'] as String,
      username: json['username'] as String,
      scopes: json['scopes'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'username': instance.username,
      'scopes': instance.scopes,
    };
