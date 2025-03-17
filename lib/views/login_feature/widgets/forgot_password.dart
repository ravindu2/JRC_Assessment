import 'package:flutter/material.dart';
import '../../../themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: AppThemes.forgotPasswordTextStyle,
        ),
      ),
    );
  }
}
