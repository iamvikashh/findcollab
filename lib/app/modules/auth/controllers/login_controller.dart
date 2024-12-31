import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final TextEditingController emailController =
      TextEditingController(text: 'matt9009murdock@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'Matt_9009@');

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> login() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _authService.login(
        emailController.text.trim(),
        passwordController.text,
      );

      // Handle successful login

      // You might want to store the token here using shared_preferences
      Get.offAllNamed(Routes.BASE);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      errorMessage.value = 'Please enter a valid email';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordController.text.isEmpty) {
      errorMessage.value = 'Please enter your password';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
