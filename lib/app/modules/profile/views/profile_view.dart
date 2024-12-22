import 'package:ecommerce_app/app/modules/chat/views/chat_users_page.dart';
import 'package:ecommerce_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/app/components/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/app/components/custom_app_bar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create text controllers within the method
    final _nameController = TextEditingController(text: 'John Doe');
    final _emailController = TextEditingController(text: 'john.doe@example.com');
    final _phoneController = TextEditingController(text: '+1 (555) 123-4567');
    final _countryController = TextEditingController(text: 'United States');
    final _cityController = TextEditingController(text: 'New York');
    final _addressController = TextEditingController(text: '123 Main Street, Apt 4B');
    final _instagramController = TextEditingController(text: '@johndoe');
    final _youtubeController = TextEditingController(text: 'John Doe Channel');
    final _twitterController = TextEditingController(text: '@johndoe');

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.surface,
      appBar: CustomAppBar(
        title: 'My Profile',
        showBackButton: false,
        actions: [
          Obx(() => IconButton(
            icon: Icon(controller.isEditing.value ? Icons.close : Icons.edit),
            onPressed: controller.toggleEdit,
          ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 60,
                        backgroundImage: controller.profileImageUrl.value != null
                            ? NetworkImage(controller.profileImageUrl.value!)
                            : NetworkImage('https://picsum.photos/id/237/200/300'),
                      )),
                  if(false)Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: () => controller.uploadProfilePicture(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Personal Details Section
            _buildSectionTitle('Personal Details'),
            Obx(() => CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _phoneController,
                  labelText: 'Phone Number',
                  enabled: controller.isEditing.value,
                )),

            // Address Details Section
            const SizedBox(height: 24),
            _buildSectionTitle('Address Details'),
            Obx(() => CustomTextFormField(
                  controller: _countryController,
                  labelText: 'Country',
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _cityController,
                  labelText: 'City',
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _addressController,
                  labelText: 'Address',
                  maxLines: 3,
                  enabled: controller.isEditing.value,
                )),

            // Social Media Section
            const SizedBox(height: 24),
            _buildSectionTitle('Social Media Accounts'),
            Obx(() => CustomTextFormField(
                  controller: _instagramController,
                  labelText: 'Instagram Handle',
                  prefixIcon: Icons.camera_alt,
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _youtubeController,
                  labelText: 'YouTube Channel',
                  prefixIcon: Icons.play_circle_filled,
                  enabled: controller.isEditing.value,
                )),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: _twitterController,
                  labelText: 'Twitter Handle',
                  prefixIcon: Icons.tag,
                  enabled: controller.isEditing.value,
                )),

            // Save Button (only visible when editing)
            Obx(() => controller.isEditing.value
                ? Column(
                    children: [
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: controller.saveProfile,
                        child: const Text('Save Profile'),
                      ),
                    ],
                  )
                : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}