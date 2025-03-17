import 'package:flutter/material.dart';
import '../../../themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.loginText,
      style: AppThemes.loginTitleStyle,
    );
  }
}
