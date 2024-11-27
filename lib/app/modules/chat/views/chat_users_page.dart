// chat_users_page.dart
import 'package:ecommerce_app/app/modules/chat/controller/chat_users_controller.dart';
import 'package:ecommerce_app/app/modules/chat/views/chat_user_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatUsersPage extends StatelessWidget {
  ChatUsersPage({super.key});

  final ChatUsersController controller = Get.put(ChatUsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return ChatUserTile(
              user: user,
              onTap: () => controller.onUserTap(user),
              formattedTime: controller.getFormattedTime(user.lastMessageTime),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement new chat functionality
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}