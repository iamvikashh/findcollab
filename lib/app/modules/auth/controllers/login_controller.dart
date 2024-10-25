import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Mock API call

    // For now, simply navigate to another screen on successful login
    Get.snackbar("Success", "Logged in successfully");
    isLoading.value = false;
  }
}
