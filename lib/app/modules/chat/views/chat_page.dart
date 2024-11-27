import 'package:ecommerce_app/app/data/local/my_shared_pref.dart';
import 'package:ecommerce_app/config/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../controller/chat_controller.dart';

class ChatPage  extends GetView<ChatController> {
  const ChatPage({super.key});


  void _handleAttachmentPressed() {
    Get.bottomSheet(
      backgroundColor: Get.theme.cardColor,
      SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Get.back();
                  controller.handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  controller.handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

   return Scaffold(
        body:Obx(()=>
          Chat(
              theme: themeIsLight ? LChatTheme() : DChatTheme(),  
              messages: controller.messages.toList(),
              onAttachmentPressed: _handleAttachmentPressed,
              onMessageTap: (context, message) =>
                  controller.handleMessageTap(message),
              onPreviewDataFetched: controller.handlePreviewDataFetched,
              onSendPressed: controller.handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              user: controller.user,
            ),
        )
      );
}
}