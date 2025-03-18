import 'package:flutter/material.dart';
import 'package:jrc_assement/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: AppThemes.elevatedButtonStyle,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColors.buttonTextColor,
              )
            : Text(
                AppLocalizations.of(context)!.login,
                style: AppThemes.buttonTextStyle,
              ),
      ),
    );
  }
}
