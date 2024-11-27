// chat_users_controller.dart
import 'package:ecommerce_app/app/data/models/chat_user_model.dart';
import 'package:ecommerce_app/app/modules/chat/views/chat_page.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ChatUsersController extends GetxController {
  final RxList<ChatUser> users = <ChatUser>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    // Simulated data - replace with your API call
    users.assignAll([
      ChatUser(
        id: '1',
        name: 'Sarah Wilson',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
        lastMessage: 'Sure, let\'s meet tomorrow at 10',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
        isOnline: true,
        unreadCount: 2,
      ),
      ChatUser(
        id: '2',
        name: 'James Rodriguez',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
        lastMessage: 'Great presentation!',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        isOnline: true,
      ),
      // Add more users as needed
    ]);
  }

  String getFormattedTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(time.year, time.month, time.day);

    if (messageDate == today) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return '${time.day}/${time.month}/${time.year}';
    }
  }

  void onUserTap(ChatUser user) {
    Get.toNamed(Routes.CHAT);
  }
}
