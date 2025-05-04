import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_message.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show debugPrint;

class ApiService {
  // Get the appropriate base URL based on the platform
  static String get _baseUrl {
    if (kIsWeb) {
      return 'http://localhost:8000'; // For web
    } else {
      // For mobile (Android/iOS), use your computer's IP or 10.0.2.2 for Android emulator
      return 'http://10.0.2.2:8000'; // Default for Android emulator
      // For iOS simulator or physical devices, you'll need your computer's local IP
    }
  }
  
  static Future<List<ChatMessage>> getChatHistory() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/api/chat/'));
      
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => ChatMessage.fromJson(item)).toList();
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load chat history');
      }
    } catch (e) {
      debugPrint('Network Error: $e');
      throw Exception('Network error: $e');
    }
  }

  static Future<ChatMessage> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/chat/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'user_message': message}),
      );

      if (response.statusCode == 201) {
        return ChatMessage.fromJson(jsonDecode(response.body));
      } else {
        debugPrint('API Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to send message');
      }
    } catch (e) {
      debugPrint('Network Error: $e');
      throw Exception('Network error: $e');
    }
  }
}