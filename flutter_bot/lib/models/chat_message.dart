class ChatMessage {
  final int? id;
  final String userMessage;
  final String botResponse;
  final DateTime createdAt;

  ChatMessage({
    this.id,
    required this.userMessage,
    required this.botResponse,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      userMessage: json['user_message'],
      botResponse: json['bot_response'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_message': userMessage,
    };
  }
}