import 'package:flutter/material.dart';

class Dimensions {
  static const double paddingHorizontal = 24.0;
  static const double spaceLarge = 32.0;
  static const double spaceMedium = 24.0;
  static const double spaceSmall = 16.0;
  static const double paddingSmall = 7.6;
  static const double paddingmedium = 12;

  static const double paddingsmall = 12.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 15.0;
  static const double gapsbetweentitle = 7.0;
  static const double marginSmall = 14.0;
  static const double marginMedium = 10.0;
  static const double fontSmall = 12.0;
  static const double fontSmallJob = 10.0;
  static const double fontLarge = 14.0;
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double iconSize = 32.0;
  static const double iconBoarderRadius = 26.0;
  static const double iconsizesmall = 20.0;
  static const double iconsizemedium = 24.0;

  static const double logoHsize = 36.0;
  static const double logoWsize = 202.0;
}

class AppColors {
  static const Color primaryColor = Color.fromRGBO(20, 129, 222, 1.0);
  static const Color secondryColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color jobBackgroundColor = Color.fromRGBO(242, 242, 242, 1);
  static const Color textColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color disabledButtonColor = Color.fromRGBO(0, 0, 0, 0.5);

  static const Color jobCategoryColor = Color.fromRGBO(232, 241, 245, 1);
  static const Color jobIdBackgroundColor = Color(0xFFc0e8d6);
  static const Color statusBackgroundColor = Color.fromRGBO(224, 224, 224, 1);
  static const Color urgentBackgroundColor = Color.fromRGBO(255, 216, 212, 1);
  static const Color locationTextColor = Color.fromRGBO(0, 0, 0, 0.8);
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
    color: AppColors.secondryColor,
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
