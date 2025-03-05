import 'package:flutter/material.dart';
import '../../../themes/themes.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login to your account',
      style: AppThemes.loginTitleStyle,
    );
  }
}
