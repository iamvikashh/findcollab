import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/app/services/profile_service.dart';
import 'package:ecommerce_app/app/data/models/user_profile_model.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = Get.find<ProfileService>();

  final isEditing = false.obs;
  final isLoading = false.obs;
  final profileData = Rxn<UserProfileModel>();
  final profileImageUrl = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      isLoading.value = true;
      final response = await _profileService
          .getProfile('19180'); // Replace with actual user ID
      profileData.value = UserProfileModel.fromJson(response);
      if (profileData.value?.imagePath != null) {
        profileImageUrl.value = profileData.value!.imagePath;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile data');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  Future<void> saveProfile() async {
    // Implement save profile logic
    toggleEdit();
  }

  Future<void> uploadProfilePicture() async {
    // Implement profile picture upload logic
  }
}
