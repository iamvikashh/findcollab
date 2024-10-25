import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:ecommerce_app/app/components/custom_textfield.dart';
import 'package:ecommerce_app/app/components/screen_title.dart';
import 'package:ecommerce_app/app/modules/auth/controllers/SignupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MultiStepSignup extends StatefulWidget {
  const MultiStepSignup({Key? key}) : super(key: key);

  @override
  State<MultiStepSignup> createState() => _MultiStepSignupState();
}

class _MultiStepSignupState extends State<MultiStepSignup> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _instagramController = TextEditingController();
  final _youtubeController = TextEditingController();
  final _twitterController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _instagramController.dispose();
    _youtubeController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      // Handle form submission
      if (_formKey.currentState!.validate()) {
        // Process the data
        print('Form submitted');
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Progress Indicator
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    Expanded(
                      child: Container(
                        height: 4,
                        color: i <= _currentStep
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300],
                      ),
                    ),
                    if (i < 2) const SizedBox(width: 8),
                  ],
                ],
              ),
            ),

            // Form Steps
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildCurrentStep(),
                ),
              ),
            ),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep > 0)
                    ElevatedButton(
                      onPressed: _previousStep,
                      child: const Text('Previous'),
                    )
                  else
                    const SizedBox(),
                  ElevatedButton(
                    onPressed: _nextStep,
                    child: Text(_currentStep == 2 ? 'Submit' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalDetails();
      case 1:
        return _buildAddressDetails();
      case 2:
        return _buildSocialMediaDetails();
      default:
        return const SizedBox();
    }
  }

  Widget _buildPersonalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          controller: _nameController,
          labelText: 'Full Name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _emailController,
          labelText: 'Email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _phoneController,
          labelText: 'Phone Number',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          controller: _countryController,
          labelText: 'Country',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your country';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _cityController,
          labelText: 'City',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your city';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _addressController,
          labelText: 'Address',
          maxLines: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSocialMediaDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Social Media Accounts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          controller: _instagramController,
          labelText: 'Instagram Handle',
          prefixIcon: Icons.camera_alt,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _youtubeController,
          labelText: 'YouTube Channel',
          prefixIcon: Icons.play_circle_filled,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: _twitterController,
          labelText: 'Twitter Handle',
          prefixIcon: Icons.tag,
        ),
      ],
    );
  }
}
