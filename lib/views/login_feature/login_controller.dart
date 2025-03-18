import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  final userId = ''.obs;
  final obscureText = true.obs;
  final RepositoryInterface repository;

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  LoginController({required this.repository});

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty || !emailRegex.hasMatch(email)) {
      if (email.isEmpty) {
        Get.snackbar(
          'Error',
          AppLocalizations.of(Get.overlayContext!)!.error_massage_email,
        );
      } else if (password.isEmpty) {
        Get.snackbar(
          'Error',
          AppLocalizations.of(Get.overlayContext!)!.error_massage_email,
        );
      } else if (!emailRegex.hasMatch(email)) {
        Get.snackbar(
          'Error',
          AppLocalizations.of(Get.overlayContext!)!.unvalid_email_msg,
        );
      }
    }

    try {
      isLoading.value = true;
      final user = await repository.login(email, password);
      if (user.isEmailConfirmed) {
        Get.snackbar(
          'Success',
          AppLocalizations.of(Get.overlayContext!)!.suceess_msg,
        );
        Get.offAllNamed('/jobs', arguments: {'userId': user.userId});
      } else {
        Get.snackbar('Error',
            AppLocalizations.of(Get.overlayContext!)!.unvalid_email_msg);
      }
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
