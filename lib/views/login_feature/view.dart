import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 50,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter Password',
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 32),
                Obx(() => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.login,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}