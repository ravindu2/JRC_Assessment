import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../themes/themes.dart';
import 'widgets/emailInput.dart';
import 'widgets/forgotPassword.dart';
import 'widgets/loginButton.dart';
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
                EmailInput(controller: controller.emailController),
                const SizedBox(height: Dimens.spaceSmall),
                PasswordInput(controller: controller.passwordController),
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
