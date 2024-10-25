import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                Text(
                  "Welcome Back",
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                8.verticalSpace,
                Text(
                  "Login to your account",
                  style: theme.textTheme.headlineSmall,
                ),
                40.verticalSpace,
                _buildTextField(
                  controller: loginController.emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  fillColor: theme.cardColor,
                  hintStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey[600]),
                ),
                20.verticalSpace,
                _buildTextField(
                  controller: loginController.passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  fillColor: theme.cardColor,
                  hintStyle: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey[600]),
                ),
                10.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add Forgot Password logic
                    },
                    child: Text(
                      "Forgot Password?",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                40.verticalSpace,
                CustomButton(
                  text: 'Login',
                  onPressed: () => {Get.toNamed(Routes.BASE)},
                  disabled: false,
                  fontSize: 16.sp,
                  radius: 12.r,
                  verticalPadding: 12.h,
                  hasShadow: true,
                  shadowColor: theme.primaryColor,
                  shadowOpacity: 0.3,
                  shadowBlurRadius: 4,
                  shadowSpreadRadius: 0,
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        "Sign up",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    required Color? fillColor,
    TextStyle? hintStyle,
  }) {
    return TextField(
      style: Get.theme.textTheme.bodyMedium,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Get.theme.iconTheme.color,
        ),
        hintText: hintText,
        labelStyle: hintStyle,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: false,
        fillColor: fillColor,
      ),
    );
  }
}
