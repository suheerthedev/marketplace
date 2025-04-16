import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/app/app.locator.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class StoreChatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String _messageText = '';
  String get messageText => _messageText;

  // Store information
  final String storeName = "Abc Store";
  final String lastSeen = "Online 5 min ago";

  // List of messages
  final List<Message> _messages = [
    Message(
      text: "Hello there!",
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Message(
      text: "I was looking on Internet and I saw this product from you guys!",
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 29)),
    ),
    Message(
      text: "Hi there! Nice to meet you!",
      isUser: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
    ),
    Message(
      text:
          "I'm John and today I'm going to help you to find your best product.",
      isUser: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 24)),
    ),
  ];

  List<Message> get messages => _messages;

  // Configure the view to hide bottom navigation
  bool hideBottomNavigation = true;

  void initialize() {
    // This function is automatically called when view is created
    notifyListeners();
  }

  void updateMessageText(String value) {
    _messageText = value;
  }

  void sendMessage() {
    if (_messageText.trim().isEmpty) return;

    final newMessage = Message(
      text: _messageText,
      isUser: true,
      timestamp: DateTime.now(),
    );

    _messages.add(newMessage);
    _messageText = '';
    notifyListeners();
  }

  void goBack() {
    _navigationService.back();
  }
}
