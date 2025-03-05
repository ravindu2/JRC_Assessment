import 'package:flutter/material.dart';
import '../../../themes/themes.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot password?',
          style: AppThemes.forgotPasswordTextStyle,
        ),
      ),
    );
  }
}
