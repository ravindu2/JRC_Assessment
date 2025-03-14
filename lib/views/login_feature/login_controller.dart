import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/data/remote_data_source/remote_data_source.dart';
import '../../../data/services/api_service.dart';
import '../../data/local_data_source/localdata_source.dart';
import '../../data/repository/repository.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  RxString userId = ''.obs;

  final Repository repository = Repository(
    localDataSource: LocalDataSource(),
    remoteDataSource: RemoteDataSource(ApiService()),
  );

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    try {
      isLoading.value = true;
      final user = await repository.login(email, password);
      if (user.isEmailConfirmed) {
        Get.snackbar(
          'Success',
          'Logged in successfully with userId: ${user.userId}',
        );
        Get.offAllNamed('/jobs', arguments: {'userId': user.userId});
      } else {
        Get.snackbar('Error', 'Login failed: User ID is null.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkLoginStatus() async {
    if (await repository.isLoggedIn()) {
      Get.offAllNamed(
        '/jobs',
      );
    }
  }
}
