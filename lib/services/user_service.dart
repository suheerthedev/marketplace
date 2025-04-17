import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:marketplace/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Class to represent a user's data
class UserData {
  final String userId;
  final String name;
  final String email;
  final String userType; // 'buyer' or 'seller'
  final bool isEmailVerified;
  final String? phoneNumber;
  final String? profileImageUrl;
  final String? country;
  final Map<String, dynamic>? additionalData;

  UserData({
    required this.userId,
    required this.name,
    required this.email,
    required this.userType,
    required this.isEmailVerified,
    this.phoneNumber,
    this.profileImageUrl,
    this.country,
    this.additionalData,
  });

  // Create a UserData object from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      userType: json['userType'] ?? 'buyer',
      isEmailVerified: json['isEmailVerified'] ?? false,
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
      country: json['country'],
      additionalData: json['additionalData'],
    );
  }

  // Convert UserData to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'userType': userType,
      'isEmailVerified': isEmailVerified,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'country': country,
      'additionalData': additionalData,
    };
  }
}

class UserService {
  final log = getLogger('UserService');

  UserData? _currentUser;

  // Get the current user
  UserData? get currentUser => _currentUser;

  // Check if a user is logged in
  bool get hasUser => _currentUser != null;

  // Listen for changes to user data
  final ValueNotifier<UserData?> userChanges = ValueNotifier<UserData?>(null);

  // Set user data and notify listeners
  void setUser(UserData user) {
    _currentUser = user;
    userChanges.value = user;
    _saveUserToPrefs(user);
    log.i('User set: ${user.email}');
  }

  // Clear user data and notify listeners
  void clearUser() {
    _currentUser = null;
    userChanges.value = null;
    _removeUserFromPrefs();
    log.i('User cleared');
  }

  // Initialize the service by loading user data from SharedPreferences
  Future<void> initialize() async {
    // log.i('Initializing UserService');
    // final userData = await _loadUserFromPrefs();
    // if (userData != null) {
    //   _currentUser = userData;
    //   userChanges.value = userData;
    //   log.i('User loaded from preferences: ${userData.email}');
    // }
  }

  // Save user data to SharedPreferences
  Future<void> _saveUserToPrefs(UserData user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(user.toJson());
      await prefs.setString('user_data', userJson);
      log.i('User saved to preferences');
    } catch (e) {
      log.e('Error saving user to preferences: $e');
    }
  }

  // Load user data from SharedPreferences
  Future<UserData?> _loadUserFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user_data');

      if (userJson != null) {
        final userData = UserData.fromJson(jsonDecode(userJson));
        return userData;
      }
    } catch (e) {
      log.e('Error loading user from preferences: $e');
    }
    return null;
  }

  // Remove user data from SharedPreferences
  Future<void> _removeUserFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_data');
      log.i('User removed from preferences');
    } catch (e) {
      log.e('Error removing user from preferences: $e');
    }
  }
}
