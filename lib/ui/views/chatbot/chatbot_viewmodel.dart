import 'package:stacked/stacked.dart';

class ChatMessage {
  final String content;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.content,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatbotViewModel extends BaseViewModel {
  final List<ChatMessage> _messages = [];
  String _currentMessage = '';

  List<ChatMessage> get messages => _messages;
  String get currentMessage => _currentMessage;

  void onInit() {
    // Initialize with a welcome message from the chatbot
    _messages.add(
      ChatMessage(
        content:
            "Hello, I'm FitBot! 👋 I'm your personal sport assistant. How can I help you?",
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void setCurrentMessage(String message) {
    _currentMessage = message;
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Add user message
    _messages.add(
      ChatMessage(
        content: message,
        isUser: true,
        timestamp: DateTime.now(),
      ),
    );
    _currentMessage = '';
    notifyListeners();

    // Simulate response (this would be replaced with API call)
    await Future.delayed(const Duration(milliseconds: 500));

    if (message.toLowerCase().contains('options') ||
        message.toLowerCase().contains('show')) {
      _messages.add(
        ChatMessage(
          content: "Ok, how about these?",
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    } else {
      // Default response
      _messages.add(
        ChatMessage(
          content:
              "I understand you're looking for assistance. Is there anything specific you'd like to know about fitness or sports?",
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    }

    notifyListeners();
  }

  // Placeholder for future API integration
  Future<String> _getResponseFromAPI(String message) async {
    // This would be replaced with actual API call
    return "API response would go here based on: $message";
  }
}
