import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final bool isEmailConfirmed;
  final String? ssoToken;

  UserModel({
    required this.userId,
    required this.isEmailConfirmed,
    this.ssoToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
