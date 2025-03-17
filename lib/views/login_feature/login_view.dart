import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/themes.dart';
import 'login_controller.dart';
import 'widgets/forgot_password.dart';
import 'widgets/login_button.dart';
import 'widgets/loginTitle.dart';
import 'widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimens.paddingHorizontal),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginLogo(),
                const SizedBox(height: Dimens.spaceLarge),
                const LoginTitle(),
                const SizedBox(height: Dimens.spaceMedium),
                TextField(
                  controller: controller.emailController,
                  decoration: AppThemes.emailInputDecoration,
                ),
                const SizedBox(height: Dimens.spaceSmall),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: AppThemes.passwordInputDecoration,
                ),
                const SizedBox(height: Dimens.spaceLarge),
                LoginButton(controller: controller),
                const SizedBox(height: Dimens.spaceSmall),
                const ForgotPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
