import 'package:isar/isar.dart';

part 'login_model.g.dart';

@Collection()
class UserModel {
  Id id = Isar.autoIncrement;
  final String userId;
  final bool isEmailConfirmed;
  final String ssoToken;

  UserModel(
      {required this.userId,
      required this.isEmailConfirmed,
      required this.ssoToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        isEmailConfirmed: json['isEmailConfirmed'] ?? '',
        userId: json['userId'] ?? '',
        ssoToken: json['ssoToken'] ?? '');
  }
}
