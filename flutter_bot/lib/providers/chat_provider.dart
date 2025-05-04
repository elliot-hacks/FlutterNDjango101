import 'package:flutter/foundation.dart';
import '../models/chat_message.dart';
import '../services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatMessage> _messages = [];
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> loadChatHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      _messages = await ApiService.getChatHistory();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading chat history: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendMessage(String message) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newMessage = await ApiService.sendMessage(message);
      _messages.insert(0, newMessage);
    } catch (e) {
      if (kDebugMode) {
        print('Error sending message: $e');
      }
      // You might want to add the user message even if the API fails
      _messages.insert(0, ChatMessage(
        userMessage: message,
        botResponse: 'Failed to get response from server',
        createdAt: DateTime.now(),
      ));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}