import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/themes/themes.dart';
import 'package:jrc_assement/views/login_feature/login_controller.dart';
import 'package:jrc_assement/views/login_feature/widgets/forgot_password.dart';
import 'package:jrc_assement/views/login_feature/widgets/login_button.dart';
import 'package:jrc_assement/views/login_feature/widgets/login_title.dart';
import 'package:jrc_assement/views/login_feature/widgets/logo.dart';

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
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: Dimens.spaceSmall),
                Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscureText.value,
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        border: UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureText.value
                                ? Icons.lock_outline
                                : Icons.lock_open_outlined,
                          ),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                    )),
                const SizedBox(height: Dimens.spaceLarge),
                Obx(() => LoginButton(
                      onPressed: () => controller.login(
                        controller.emailController.text.trim(),
                        controller.passwordController.text.trim(),
                      ),
                      isLoading: controller.isLoading.value,
                    )),
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
