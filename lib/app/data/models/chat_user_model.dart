class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;
  final String? lastMessage;
  final DateTime lastMessageTime;
  final bool isOnline;
  final int unreadCount;
  final String? lastMessageSender;
  
  ChatUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.lastMessage,
    required this.lastMessageTime,
    this.isOnline = false,
    this.unreadCount = 0,
    this.lastMessageSender,
  });
}