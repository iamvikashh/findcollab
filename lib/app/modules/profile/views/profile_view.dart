import 'package:ecommerce_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/app/components/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/app/components/custom_app_bar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.surface,
      appBar: CustomAppBar(
        title: 'My Profile',
        showBackButton: false,
        actions: [
          Obx(() => IconButton(
                icon:
                    Icon(controller.isEditing.value ? Icons.close : Icons.edit),
                onPressed: controller.toggleEdit,
              ))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = controller.profileData.value;

        // Create text controllers with initial values from API data
        final nameController =
            TextEditingController(text: profile?.userName ?? '');
        final emailController =
            TextEditingController(text: profile?.email ?? '');
        final phoneController =
            TextEditingController(text: profile?.mobile ?? '');
        final countryController =
            TextEditingController(text: profile?.country ?? '');
        final cityController = TextEditingController(text: profile?.city ?? '');
        final addressController =
            TextEditingController(text: profile?.address ?? '');
        final instagramController =
            TextEditingController(text: profile?.instagramUrl ?? '');
        final youtubeController =
            TextEditingController(text: profile?.youtubeUrl ?? '');
        final twitterController =
            TextEditingController(text: profile?.twitterUrl ?? '');

        return SingleChildScrollView(
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
                          backgroundImage: controller.profileImageUrl.value !=
                                  null
                              ? NetworkImage(controller.profileImageUrl.value!)
                              : const NetworkImage(
                                  'https://picsum.photos/id/237/200/300'),
                        )),
                    Positioned(
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
                              offset: const Offset(0, 2),
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
              CustomTextFormField(
                controller: nameController,
                labelText: 'Full Name',
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                labelText: 'Email',
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: phoneController,
                labelText: 'Phone Number',
                enabled: controller.isEditing.value,
              ),

              // Address Details Section
              const SizedBox(height: 24),
              _buildSectionTitle('Address Details'),
              CustomTextFormField(
                controller: countryController,
                labelText: 'Country',
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: cityController,
                labelText: 'City',
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: addressController,
                labelText: 'Address',
                maxLines: 3,
                enabled: controller.isEditing.value,
              ),

              // Social Media Section
              const SizedBox(height: 24),
              _buildSectionTitle('Social Media Accounts'),
              CustomTextFormField(
                controller: instagramController,
                labelText: 'Instagram Handle',
                prefixIcon: Icons.camera_alt,
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: youtubeController,
                labelText: 'YouTube Channel',
                prefixIcon: Icons.play_circle_filled,
                enabled: controller.isEditing.value,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: twitterController,
                labelText: 'Twitter Handle',
                prefixIcon: Icons.tag,
                enabled: controller.isEditing.value,
              ),

              if (profile?.languages?.isNotEmpty ?? false) ...[
                const SizedBox(height: 24),
                _buildSectionTitle('Languages'),
                Wrap(
                  spacing: 8,
                  children: profile!.languages
                      .map((lang) => Chip(
                            label: Text(lang),
                          ))
                      .toList(),
                ),
              ],

              if (profile?.categories?.isNotEmpty ?? false) ...[
                const SizedBox(height: 24),
                _buildSectionTitle('Categories'),
                Wrap(
                  spacing: 8,
                  children: profile!.categories
                      .map((category) => Chip(
                            label: Text(category),
                          ))
                      .toList(),
                ),
              ],

              // Save Button (only visible when editing)
              Obx(() => controller.isEditing.value
                  ? Column(
                      children: [
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            // Create updated profile data
                            final updatedData = {
                              'user_name': nameController.text,
                              'email': emailController.text,
                              'mobile': phoneController.text,
                              'country': countryController.text,
                              'city': cityController.text,
                              'address': addressController.text,
                              'insta_url': instagramController.text,
                              'youtube_url': youtubeController.text,
                              'twitter_url': twitterController.text,
                            };
                            controller.saveProfile();
                          },
                          child: const Text('Save Profile'),
                        ),
                      ],
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        );
      }),
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
