import 'package:flutter/material.dart';
import '../../../themes/themes.dart';
import '../login_controller.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final LoginController controller;

  const LoginButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: AppThemes.elevatedButtonStyle,
            onPressed: controller.isLoading.value ? null : controller.login,
            child: controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: AppColors.buttonTextColor,
                  )
                : const Text(
                    'LOGIN',
                    style: AppThemes.buttonTextStyle,
                  ),
          ),
        ));
  }
}
