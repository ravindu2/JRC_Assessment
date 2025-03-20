import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jrc_assement/themes/argument_const.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  final userId = ''.obs;
  final obscureText = true.obs;
  final RepositoryInterface repository = Get.find<RepositoryInterface>();

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty) {
      Get.snackbar(
        AppLocalizations.of(Get.overlayContext!)!.error,
        AppLocalizations.of(Get.overlayContext!)!.error_massage_email,
      );
    } else if (password.isEmpty) {
      Get.snackbar(
        AppLocalizations.of(Get.overlayContext!)!.error,
        AppLocalizations.of(Get.overlayContext!)!.error_massage_email,
      );
    } else if (!emailRegex.hasMatch(email)) {
      Get.snackbar(
        AppLocalizations.of(Get.overlayContext!)!.error,
        AppLocalizations.of(Get.overlayContext!)!.unvalid_email_msg,
      );
    }

    try {
      isLoading.value = true;
      final user = await repository.login(email, password);
      if (user.isEmailConfirmed) {
        Get.snackbar(
          AppLocalizations.of(Get.overlayContext!)!.success,
          AppLocalizations.of(Get.overlayContext!)!.suceess_msg,
        );
        Get.offAllNamed('/jobs',
            arguments: {ArgumentConst.userId: user.userId});
      } else {
        Get.snackbar(AppLocalizations.of(Get.overlayContext!)!.error,
            AppLocalizations.of(Get.overlayContext!)!.unvalid_email_msg);
      }
    } catch (e) {
      Get.snackbar(AppLocalizations.of(Get.overlayContext!)!.error,
          AppLocalizations.of(Get.overlayContext!)!.loginFailed(e));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshLoginData() async {
    try {
      isLoading.value = true;
      emailController.clear();
      passwordController.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
