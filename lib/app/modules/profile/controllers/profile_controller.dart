import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  // Observable variables
  Rx<String?> profileImageUrl = Rx<String?>(null);
  RxBool isEditing = false.obs;

  // Method to toggle edit mode
  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  // Method to upload profile picture
  Future<void> uploadProfilePicture() async {
    try {
      return;
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 80,
      );

      if (image != null) {
        // Here you would typically upload to your backend/storage
        // For now, we'll just update the local URL
        profileImageUrl.value = image.path;

        Get.snackbar(
          'Success', 
          'Profile picture updated',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error', 
        'Failed to upload profile picture',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error uploading profile picture: $e');
    }
  }

  // Method to save profile
  void saveProfile() {
    // Implement profile save logic
    isEditing.value = false;
    Get.snackbar(
      'Success', 
      'Profile Updated Successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}