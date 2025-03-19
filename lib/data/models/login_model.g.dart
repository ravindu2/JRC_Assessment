// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      isEmailConfirmed: json['isEmailConfirmed'] as bool,
      ssoToken: json['ssoToken'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'isEmailConfirmed': instance.isEmailConfirmed,
      'ssoToken': instance.ssoToken,
    };
