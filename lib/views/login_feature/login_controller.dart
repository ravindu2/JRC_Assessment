import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/api_service.dart';
import '../../data/remote_data_source/auth_remote_data_source.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  RxString userId = ''.obs;

  final AuthRemoteDataSource _authRemoteDataSource =
      AuthRemoteDataSource(ApiService());

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    isLoading.value = true;

    try {
      final user = await _authRemoteDataSource.login(email, password);
      if (user.isEmailConfirmed) {
        isLoading.value = false;

        Get.snackbar(
            'Success', 'Logged in successfully with userId: ${user.userId}');

        Get.toNamed('/jobs', arguments: {'userId': user.userId});
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Login failed: User ID is null.');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Login failed: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
