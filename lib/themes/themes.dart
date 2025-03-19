import 'package:flutter/material.dart';

class Dimensions {
  static const double paddingHorizontal = 24.0;
  static const double spaceLarge = 32.0;
  static const double spaceMedium = 24.0;
  static const double spaceSmall = 16.0;
  static const double paddingSmall = 7.6;

  static const double paddingMedium = 16.0;
  static const double paddingLarge = 15.0;
  static const double gapsbetweentitle = 7.0;
  static const double marginSmall = 14.0;
  static const double marginMedium = 15.0;
  static const double fontSmall = 12.0;
  static const double fontSmallJob = 10.0;
  static const double fontMedium = 14.0;
  static const double fontLarge = 14.0;
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double iconSize = 32.0;
  static const double iconBoarderRadius = 26.0;
}

class AppColors {
  static const Color primaryColor = Color.fromRGBO(20, 129, 222, 1.0);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color buttonTextColor = Colors.white;
  static const Color disabledButtonColor = Colors.grey;

  static const Color jobIdColor = Color(0xFFc0e8d6);
  static const Color statusBackgroundColor = Color(0xFFEEEEEE);
  static const Color statusTextColor = Colors.black87;
  static const Color categoryTextColor = Colors.black87;
  static const Color urgentBackgroundColor = Color(0xFFFFE4E1);
  static const Color titleTextColor = Colors.black;
  static const Color locationTextColor = Color(0xFF757575);
  static const Color postDateTextColor = Color(0xFF9E9E9E);
  static const Color iconContainerColor = Color.fromRGBO(230, 230, 230, 1);
  static const Color urgentTextColour = Color.fromRGBO(222, 76, 57, 1);
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

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    disabledBackgroundColor: AppColors.disabledButtonColor,
  );
}
