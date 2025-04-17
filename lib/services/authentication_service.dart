import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService {
  final log = getLogger('AuthenticationService');
  final _navigationService = locator<NavigationService>();

  final String _baseUrl = 'https://iownthisone-ecom-backend.devop360.com';

  bool _isAuthenticated = false;
  String? _token;
  String? _userId;
  String? _userType; // 'buyer' or 'seller'
  String? _error;

  // Store user email during registration for OTP verification
  String? _pendingVerificationEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get error => _error;
  String? get pendingVerificationEmail => _pendingVerificationEmail;

  // Sign up method - connected to API
  Future<bool> signUpBuyer({
    required String name,
    required String email,
    required String password,
    String country = 'Pakistan', // Default value
    String phoneNumber = '', // Optional
    bool newsletterSubscription = true, // Default to true
  }) async {
    try {
      log.i('Signing up buyer: $email');

      // Parse name into first and last name
      final nameParts = name.trim().split(' ');
      final firstName = nameParts.first;
      final lastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      // Convert newsletterSubscription boolean to int
      final newsLetterValue = newsletterSubscription ? 1 : 0;

      // Build the registration URL with query parameters
      final uri = Uri.parse('$_baseUrl/register').replace(
        queryParameters: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'country': country,
          'phone_number': phoneNumber,
          'newsletter_subscription': newsLetterValue.toString(),
        },
      );

      // Send the request
      final response = await http.post(uri);

      log.i(
          'Registration API response: ${response.statusCode}, Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        // Store user data
        _userId = data['user_id']?.toString() ??
            'user-${DateTime.now().millisecondsSinceEpoch}';
        _userType = 'buyer';
        _error = null;

        // Store email for OTP verification
        _pendingVerificationEmail = email;

        return true;
      } else {
        // Handle error responses
        final errorData = json.decode(response.body);
        _error = errorData['message'] ??
            'Registration failed with status code: ${response.statusCode}';
        return false;
      }
    } catch (e) {
      log.e('Error signing up buyer: $e');
      _error = e.toString();
      return false;
    }
  }

  // Verify OTP method - for email verification
  Future<bool> verifyOTP(String email, String otp) async {
    try {
      log.i('Verifying OTP for: $email');

      // Build the verification URL with query parameters
      final uri = Uri.parse('$_baseUrl/verify-otp/').replace(
        queryParameters: {
          'email': email,
          'otp': otp,
        },
      );

      // Send the request
      final response = await http.post(uri);

      log.i(
          'OTP verification API response: ${response.statusCode}, Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Clear pending verification email as it's now verified
        _pendingVerificationEmail = null;
        _error = null;

        return true;
      } else {
        // Handle error responses
        final errorData = json.decode(response.body);
        _error = errorData['message'] ??
            'OTP verification failed with status code: ${response.statusCode}';
        return false;
      }
    } catch (e) {
      log.e('Error verifying OTP: $e');
      _error = e.toString();
      return false;
    }
  }

  // Resend OTP method
  Future<bool> resendOTP(String email) async {
    try {
      log.i('Resending OTP for: $email');

      // Build the resend OTP URL with query parameters
      final uri = Uri.parse('$_baseUrl/resend-otp').replace(
        queryParameters: {
          'email': email,
        },
      );

      // Send the request
      final response = await http.post(uri);

      log.i(
          'Resend OTP API response: ${response.statusCode}, Body: ${response.body}');

      if (response.statusCode == 200) {
        _error = null;
        return true;
      } else {
        // Handle error responses
        final errorData = json.decode(response.body);
        _error = errorData['message'] ??
            'Resend OTP failed with status code: ${response.statusCode}';
        return false;
      }
    } catch (e) {
      log.e('Error resending OTP: $e');
      _error = e.toString();
      return false;
    }
  }

  // Sign up method for seller - will be updated with API
  Future<bool> signUpSeller({
    required String name,
    required String email,
    required String password,
    String address = '', // Business address
    String country = 'Pakistan', // Default value
    String phoneNumber = '', // Optional
    bool newsletterSubscription = true, // Default to true
  }) async {
    try {
      log.i('Signing up seller: $email');

      // Parse name into first and last name (for business name, use same field)
      final nameParts = name.trim().split(' ');
      final firstName = nameParts.first;
      final lastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      // Convert newsletterSubscription boolean to int
      final newsLetterValue = newsletterSubscription ? 1 : 0;

      // Build the registration URL with query parameters
      final uri = Uri.parse('$_baseUrl/register').replace(
        queryParameters: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'country': country,
          'phone_number': phoneNumber,
          'newsletter_subscription': newsLetterValue.toString(),
          'user_type': 'seller', // Add seller type parameter
          'business_address': address,
        },
      );

      // Send the request
      final response = await http.post(uri);

      log.i(
          'Registration API response: ${response.statusCode}, Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        // Store user data
        _userId = data['user_id']?.toString() ??
            'seller-${DateTime.now().millisecondsSinceEpoch}';
        _userType = 'seller';
        _error = null;

        // Store email for OTP verification
        _pendingVerificationEmail = email;

        return true;
      } else {
        // Handle error responses
        final errorData = json.decode(response.body);
        _error = errorData['message'] ??
            'Registration failed with status code: ${response.statusCode}';
        return false;
      }
    } catch (e) {
      log.e('Error signing up seller: $e');
      _error = e.toString();
      return false;
    }
  }

  // Login method - will be connected to API
  Future<bool> login({
    required String email,
    required String password,
    String userType = 'buyer', // Default to buyer
  }) async {
    try {
      log.i('Logging in $userType: $email');
      // API integration will be added here
      // For now, simulate a successful login

      _isAuthenticated = true;
      _token = 'sample-token-${DateTime.now().millisecondsSinceEpoch}';
      _userId = '$userType-${DateTime.now().millisecondsSinceEpoch}';
      _userType = userType;
      _error = null;

      return true;
    } catch (e) {
      log.e('Error logging in: $e');
      _isAuthenticated = false;
      _token = null;
      _userId = null;
      _error = e.toString();
      return false;
    }
  }

  // Logout method
  Future<void> logout() async {
    log.i('Logging out user');
    _isAuthenticated = false;
    _token = null;
    _userId = null;
    _userType = null;
    _error = null;
  }

  // Password reset methods
  Future<bool> requestPasswordReset(String email) async {
    try {
      log.i('Requesting password reset for: $email');
      // API integration will be added here
      _error = null;
      return true;
    } catch (e) {
      log.e('Error requesting password reset: $e');
      _error = e.toString();
      return false;
    }
  }

  Future<bool> verifyResetCode(String email, String code) async {
    try {
      log.i('Verifying reset code for: $email');
      // API integration will be added here
      _error = null;
      return true;
    } catch (e) {
      log.e('Error verifying reset code: $e');
      _error = e.toString();
      return false;
    }
  }

  Future<bool> resetPassword(String email, String newPassword) async {
    try {
      log.i('Resetting password for: $email');
      // API integration will be added here
      _error = null;
      return true;
    } catch (e) {
      log.e('Error resetting password: $e');
      _error = e.toString();
      return false;
    }
  }

  // Google Sign-In method - will be connected to API
  Future<bool> signInWithGoogle() async {
    try {
      log.i('Signing in with Google');
      // API integration will be added here

      _isAuthenticated = true;
      _token = 'google-token-${DateTime.now().millisecondsSinceEpoch}';
      _userId = 'google-user-${DateTime.now().millisecondsSinceEpoch}';
      _userType = 'buyer'; // Default to buyer for Google sign-in
      _error = null;

      return true;
    } catch (e) {
      log.e('Error signing in with Google: $e');
      _error = e.toString();
      return false;
    }
  }
}
