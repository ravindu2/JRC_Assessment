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

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginLogo(),
                const SizedBox(height: 32),
                const LoginTitle(),
                const SizedBox(height: 24),
                EmailInput(controller: controller.emailController),
                const SizedBox(height: 16),
                PasswordInput(controller: controller.passwordController),
                const SizedBox(height: 32),
                LoginButton(controller: controller),
                const SizedBox(height: 16),
                const ForgotPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
