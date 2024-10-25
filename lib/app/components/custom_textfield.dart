import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final int maxLines;
  final IconData? prefixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.maxLines = 1,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Get.theme.textTheme.bodyMedium,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        hintStyle: Get.theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        labelStyle: Get.theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
