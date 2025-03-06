class UserModel {
  final String userId;
  final bool isEmailConfirmed;

  UserModel({required this.userId, required this.isEmailConfirmed});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      isEmailConfirmed: json['isEmailConfirmed'] ?? '',
      userId: json['userId'] ?? '',
    );
  }
}
