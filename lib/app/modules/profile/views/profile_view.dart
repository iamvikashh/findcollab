import 'package:ecommerce_app/app/components/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 16,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   title: const Text(
      //     'My Profile',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(6.0),
      //       child: ElevatedButton.icon(
      //         onPressed: () {},
      //         icon: Padding(
      //           padding: const EdgeInsets.only(left: 4),
      //           child: const Icon(Icons.edit_document),
      //         ),
      //         label: Padding(
      //           padding: const EdgeInsets.only(right: 4),
      //           child: const Text('Edit'),
      //         ),
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: theme.colorScheme.secondary,
      //           foregroundColor: Colors.white,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(5),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              40.verticalSpace,
              const ScreenTitle(
                title: 'My Profile',
                dividerEndIndent: 280,
              ),
              8.verticalSpace,
              Container(
                child: _buildCardSection(
                  null,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left side - Profile Picture
                       CircleAvatar(backgroundColor: theme.colorScheme.secondary,
                        radius: 35, // Reduced from 50 to make it more compact
                       // backgroundImage: AssetImage('assets/profile_avatar.png'),
                         child: Icon(Icons.person,size: 40,),
                      ),
                      const SizedBox(width: 16),
                      // Right side - Name, Email, and Social Icons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Jace',
                              style: TextStyle(
                                fontSize: 20, // Slightly reduced from 24
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Jace@gmail.com',
                              style: TextStyle(
                                fontSize: 14, // Slightly reduced from 16
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Social Icons with smaller size
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildSocialIcon(Colors.purple, Icons.camera,
                                      size: 16),
                                  _buildSocialIcon(Colors.blue, Icons.facebook,
                                      size: 16),
                                  _buildSocialIcon(Colors.black, Icons.android,
                                      size: 16),
                                  _buildSocialIcon(
                                      Colors.red, Icons.play_circle_filled,
                                      size: 16),
                                  _buildSocialIcon(Colors.blue[700]!, Icons.mail,
                                      size: 16),
                                  _buildSocialIcon(Colors.black, Icons.music_note,
                                      size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
          
              // Content Cards
              Column(
                children: [
                  // About Me Card
                  _buildCardSection(
                    'About Me',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Tiktoker',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        8.verticalSpace,
                        Text(
                          'From',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'India',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                       8.verticalSpace,
                        Text(
                          'Member Since',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'September 19, 2024',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                        
                  // Languages Card
                  _buildCardSection(
                    'Languages',
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'English',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            8.horizontalSpace,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child:  Text('Fluent',style: theme.textTheme.displaySmall),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                        
                  // Skills/Category Card
                  _buildCardSection(
                    'Skills/Category',
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildSkillChip('Acting'),
                      ],
                    ),
                  ),
                        
                  // Contact Card
                  _buildCardSection(
                    'Contact',
                    Container(), // Add contact information here
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardSection(String? title, Widget content) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
              SizedBox(height: title != null ? 16 : 0),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(Color color, IconData icon, {double size = 20}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0), // Reduced from 8
      child: CircleAvatar(
        backgroundColor: color,
        radius: size, // Use the size parameter
        child: Icon(
          icon,
          color: Colors.white,
          size: size * 1.2, // Proportional icon size
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
