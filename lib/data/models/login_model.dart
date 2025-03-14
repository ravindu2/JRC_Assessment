import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@Collection()
@JsonSerializable()
class UserModel {
  Id id = Isar.autoIncrement;

  @JsonKey(name: 'userId')
  final String userId;

  @JsonKey(name: 'isEmailConfirmed')
  final bool isEmailConfirmed;

  @JsonKey(name: 'ssoToken')
  final String ssoToken;

  UserModel({
    required this.userId,
    required this.isEmailConfirmed,
    required this.ssoToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
