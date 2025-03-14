// themes.dart
import 'package:flutter/material.dart';

class Dimens {
  static const double paddingHorizontal = 24.0;
  static const double spaceLarge = 32.0;
  static const double spaceMedium = 24.0;
  static const double spaceSmall = 16.0;

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double fontSmall = 12.0;
  static const double fontMedium = 14.0;
  static const double fontLarge = 16.0;
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
}

class AppColors {
  // General Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color buttonTextColor = Colors.white;
  static const Color disabledButtonColor = Colors.grey;

  // JobCard Specific Colors
  static const Color jobIdColor = Colors.green;
  static const Color statusBackgroundColor = Color(0xFFEEEEEE);
  static const Color statusTextColor = Colors.black87;
  static const Color categoryTextColor = Colors.black87;
  static const Color urgentBackgroundColor = Color(0xFFFFE4E1);
  static const Color urgentTextColor = Colors.pink;
  static const Color titleTextColor = Colors.black87;
  static const Color locationTextColor = Color(0xFF757575);
  static const Color postDateTextColor = Color(0xFF9E9E9E);
}

class AppThemes {
  static const TextStyle loginTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    letterSpacing: 1,
    color: AppColors.buttonTextColor,
  );

  static const TextStyle forgotPasswordTextStyle = TextStyle(
    color: AppColors.primaryColor,
    decoration: TextDecoration.underline,
  );

  static const InputDecoration emailInputDecoration = InputDecoration(
    labelText: 'Enter Email',
    border: UnderlineInputBorder(),
  );

  static const InputDecoration passwordInputDecoration = InputDecoration(
    labelText: 'Enter Password',
    border: UnderlineInputBorder(),
    suffixIcon: Icon(Icons.lock_outline),
  );

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    disabledBackgroundColor: AppColors.disabledButtonColor,
  );
}
