import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/themes/themes.dart';
import 'package:jrc_assement/views/login_feature/login_controller.dart';
import 'package:jrc_assement/views/login_feature/widgets/login_button.dart';
import 'package:jrc_assement/views/login_feature/widgets/login_title.dart';
import 'package:jrc_assement/views/login_feature/widgets/logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.find();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () async {
          await controller.refreshLoginData();
          _refreshController.refreshCompleted();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingHorizontal),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginLogo(),
                  const SizedBox(height: Dimensions.spaceLarge),
                  const LoginTitle(),
                  const SizedBox(height: Dimensions.spaceMedium),
                  _buildEmailTextField(context),
                  const SizedBox(height: Dimensions.spaceSmall),
                  _buildPasswordTextField(context),
                  const SizedBox(height: Dimensions.spaceLarge),
                  Obx(() => LoginButton(
                        onPressed: () => controller.login(
                          controller.emailController.text.trim(),
                          controller.passwordController.text.trim(),
                        ),
                        isLoading: controller.isLoading.value,
                      )),
                  const SizedBox(height: Dimensions.spaceSmall),
                  _buildForgotPasswordButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return TextField(
      controller: controller.emailController,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.en_email,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return Obx(() => TextField(
          controller: controller.passwordController,
          obscureText: controller.obscureText.value,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.en_password,
            border: const UnderlineInputBorder(),
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
        ));
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
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
