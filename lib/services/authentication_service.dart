import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.logger.dart';
import 'package:marketplace/config/api_config.dart';
import 'package:marketplace/services/api_service.dart';
import 'package:marketplace/services/token_service.dart';
import 'package:marketplace/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marketplace/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Result enums for authentication operations
enum AuthResult { success, error, emailNotVerified }

class AuthenticationService {
  final log = getLogger('AuthenticationService');
  final _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final TokenService _tokenService = locator<TokenService>();
  final ApiService _apiService = locator<ApiService>();

  final String _baseUrl = ApiConfig.baseUrl;

  // Authentication state
  bool _isAuthenticated = false;
  String? _token;
  String? _userId;
  String? _userType; // 'buyer' or 'seller'
  String? _errorMessage;

  // Store user email during registration for OTP verification
  String? _pendingVerificationEmail;

  // Additional fields for email verification status
  bool _isEmailVerified = false;

  UserModel? _currentUser;

  // Getters
  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get errorMessage => _errorMessage;
  Map<String, String> get validationErrors => {};
  String? get pendingVerificationEmail => _pendingVerificationEmail;
  bool get isEmailVerified => _isEmailVerified;
  UserModel? get currentUser => _currentUser;

  // Initialize service - load saved token if available
  Future<bool> initialize() async {
    try {
      // TEMPORARILY COMMENTED FOR TESTING:
      // Bypassing token validation and always returning not authenticated
      // This will force the app to show the splash/login screen at startup
      /*
      final prefs = await SharedPreferences.getInstance();
      final savedToken = prefs.getString('auth_token');

      if (savedToken != null) {
        _token = savedToken;
        _isAuthenticated = true;

        // Fetch user details using the token
        final userData = await _fetchUserData(savedToken);
        if (userData != null) {
          _currentUser = userData;
          return true;
        } else {
          // Token might be invalid - clear it
          await _clearAuthData();
          return false;
        }
      }
      */

      // For testing: Always return false to force login flow
      _isAuthenticated = false;
      _token = null;
      _currentUser = null;
      return false;
    } catch (e) {
      log.e('Error initializing authentication: $e');
      return false;
    }
  }

  // Fetch current user information
  Future<void> _fetchCurrentUser() async {
    try {
      // Make an API call to get user information
      final result = await _apiService.get('/me');

      if (!result.containsKey('error')) {
        final userData = result;

        // Parse user ID
        _userId = userData['id']?.toString();
        _userType = userData['user_type'] ?? 'buyer';
        _isEmailVerified = userData['is_email_verified'] ?? false;

        // Create user data object for UserService
        _userService.setUser(UserData(
          userId: _userId ?? '',
          name: '${userData['first_name'] ?? ''} ${userData['last_name'] ?? ''}'
              .trim(),
          email: userData['email'] ?? '',
          userType: _userType ?? 'buyer',
          isEmailVerified: _isEmailVerified,
          phoneNumber: userData['phone_number'],
          country: userData['country'],
          profileImageUrl: userData['profile_image_url'],
        ));
      }
    } catch (e) {
      log.e('Error fetching current user: $e');
    }
  }

  // Register a new user
  Future<AuthResult> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    String country = 'Pakistan',
    bool newsletterSubscription = true,
  }) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
        'country': country,
        'newsletter_subscription': newsletterSubscription ? 1 : 0,
      };

      log.i('Registration request body: $requestBody');

      // Send registration request
      // Use the exact endpoint from ApiConfig for consistency
      final response =
          await _apiService.post(ApiConfig.registerEndpoint, body: requestBody);

      log.i('Registration response: $response');

      // Parse response
      final registerResponse = RegisterResponse.fromJson(response);

      if (registerResponse.isSuccess) {
        // Registration successful
        _token = registerResponse.token;
        _currentUser = registerResponse.user != null
            ? UserModel(
                id: registerResponse.user!.id,
                name: registerResponse.user!.name,
                email: registerResponse.user!.email)
            : null;
        _pendingVerificationEmail = email;

        // Save token
        if (_token != null) {
          await _saveToken(_token!);
        }

        return AuthResult.success;
      } else if (registerResponse.hasErrors) {
        // Registration failed with validation errors
        if (registerResponse.errors != null) {
          _errorMessage = registerResponse.errors!.entries
              .map((e) => "${e.key}: ${e.value.join(', ')}")
              .join('\n');
        } else {
          _errorMessage = 'Registration failed. Please try again.';
        }
        return AuthResult.error;
      } else if (response.containsKey('message')) {
        // The API returned a message field (likely an error)
        _errorMessage = response['message'];
        return AuthResult.error;
      } else {
        // Unknown error
        _errorMessage = 'Registration failed. Please try again.';
        return AuthResult.error;
      }
    } catch (e) {
      log.e('Registration error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return AuthResult.error;
    }
  }

  // Verify OTP code
  Future<AuthResult> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'email': email,
        'otp': otp,
      };

      // Send OTP verification request
      final response = await _apiService.post(ApiConfig.verifyOtpEndpoint,
          body: requestBody);

      // Parse response
      final otpResponse = OtpVerificationResponse.fromJson(response);

      if (otpResponse.isSuccess) {
        // OTP verification successful
        if (otpResponse.token != null) {
          _token = otpResponse.token;
          _isAuthenticated = true;
          _pendingVerificationEmail = null;

          // Save token
          await _saveToken(_token!);
        }

        return AuthResult.success;
      } else {
        // OTP verification failed
        _errorMessage = otpResponse.message ?? 'Invalid OTP. Please try again.';
        return AuthResult.error;
      }
    } catch (e) {
      log.e('OTP verification error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return AuthResult.error;
    }
  }

  // Login user
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      _errorMessage = null;

      // Prepare query parameters for login
      final queryParams = {
        'email': email,
        'password': password,
      };

      // Send login request
      final response = await _apiService.post(ApiConfig.loginEndpoint,
          queryParams: queryParams);

      // Parse response
      final loginResponse = LoginResponse.fromJson(response);

      if (loginResponse.isSuccess) {
        // Login successful and email is verified
        _token = loginResponse.token;
        _isAuthenticated = true;
        _currentUser = loginResponse.user != null
            ? UserModel(
                id: loginResponse.user!.id,
                name: loginResponse.user!.name,
                email: loginResponse.user!.email)
            : null;

        // Save token
        if (_token != null) {
          await _saveToken(_token!);
        }

        return AuthResult.success;
      } else if (loginResponse.isEmailNotVerified) {
        // Login successful but email not verified
        _pendingVerificationEmail = email;
        _errorMessage = loginResponse.message ??
            'Email not verified. Please verify your email.';
        return AuthResult.emailNotVerified;
      } else if (loginResponse.hasErrors) {
        // Login failed with validation errors
        if (loginResponse.errors != null &&
            loginResponse.errors!.containsKey('email')) {
          _errorMessage = loginResponse.errors!['email']!.join(', ');
        } else {
          _errorMessage =
              loginResponse.message ?? 'Invalid credentials. Please try again.';
        }
        return AuthResult.error;
      } else {
        // Unknown error
        _errorMessage =
            loginResponse.message ?? 'Login failed. Please try again.';
        return AuthResult.error;
      }
    } catch (e) {
      log.e('Login error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return AuthResult.error;
    }
  }

  // Logout user
  Future<bool> logout() async {
    try {
      // Clear authentication data
      await _clearAuthData();
      return true;
    } catch (e) {
      log.e('Logout error: $e');
      return false;
    }
  }

  // Resend OTP
  Future<bool> resendOtp({required String email}) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'email': email,
      };

      // Send resend OTP request
      final response = await _apiService.post(ApiConfig.resendOtpEndpoint,
          body: requestBody);

      if (response.containsKey('message')) {
        return true;
      } else {
        _errorMessage = 'Failed to resend OTP. Please try again.';
        return false;
      }
    } catch (e) {
      log.e('Resend OTP error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return false;
    }
  }

  // Request password reset
  Future<bool> requestPasswordReset(String email) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'email': email,
      };

      // Send password reset request
      final response =
          await _apiService.post('/forgot-password', body: requestBody);

      // Parse response
      final resetResponse = PasswordResetRequestResponse.fromJson(response);

      if (resetResponse.isSuccess) {
        // Password reset request successful, store email for verification
        _pendingVerificationEmail = email;
        return true;
      } else {
        // Password reset request failed
        _errorMessage = resetResponse.error ??
            'Failed to request password reset. Please try again.';
        return false;
      }
    } catch (e) {
      log.e('Password reset request error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return false;
    }
  }

  // Verify reset code - if your API requires a separate step to verify the code
  Future<bool> verifyResetCode(String email, String code) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'email': email,
        'code': code,
      };

      // Send verify reset code request
      final response =
          await _apiService.post('/verify-reset-code', body: requestBody);

      if (response.containsKey('message') &&
          response['message'].toString().contains('valid')) {
        return true;
      } else {
        _errorMessage =
            response['message'] ?? 'Invalid reset code. Please try again.';
        return false;
      }
    } catch (e) {
      log.e('Verify reset code error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return false;
    }
  }

  // Reset password
  Future<bool> resetPassword(String email, String newPassword,
      {String? resetToken}) async {
    try {
      _errorMessage = null;

      // Prepare request body
      final requestBody = {
        'email': email,
        'password': newPassword,
        'password_confirmation': newPassword,
      };

      // Add reset token if provided
      if (resetToken != null) {
        requestBody['token'] = resetToken;
      }

      // Send reset password request
      final response =
          await _apiService.post('/reset-password', body: requestBody);

      // Parse response
      final resetResponse = PasswordResetResponse.fromJson(response);

      if (resetResponse.isSuccess) {
        // Password reset successful
        return true;
      } else {
        // Password reset failed
        _errorMessage = resetResponse.error ??
            'Failed to reset password. Please try again.';
        return false;
      }
    } catch (e) {
      log.e('Reset password error: $e');
      _errorMessage = 'An unexpected error occurred. Please try again.';
      return false;
    }
  }

  // Fetch user data with token
  Future<UserModel?> _fetchUserData(String token) async {
    try {
      final response = await _apiService.get('/me', token: token);

      if (response.containsKey('id') && response.containsKey('email')) {
        return UserModel(
          id: response['id'],
          name: response['name'] ?? '',
          email: response['email'],
        );
      }

      return null;
    } catch (e) {
      log.e('Error fetching user data: $e');
      return null;
    }
  }

  // Save authentication token
  Future<void> _saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
    } catch (e) {
      log.e('Error saving token: $e');
    }
  }

  // Clear authentication data
  Future<void> _clearAuthData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');

      _token = null;
      _isAuthenticated = false;
      _currentUser = null;
      _pendingVerificationEmail = null;
    } catch (e) {
      log.e('Error clearing auth data: $e');
    }
  }

  // Google Sign-In
  Future<bool> signInWithGoogle() async {
    try {
      _errorMessage = null;

      // Initialize Google Sign In
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Start the Google Sign In flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // If user aborted the sign in flow
      if (googleUser == null) {
        _errorMessage = 'Google sign in was canceled';
        return false;
      }

      // Get authentication details from Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Send to your backend
      final response = await _apiService.post('/google-auth', body: {
        'id_token': googleAuth.idToken,
        'access_token': googleAuth.accessToken,
        'email': googleUser.email,
        'name': googleUser.displayName ?? '',
        'profile_image': googleUser.photoUrl ?? '',
      });

      // Parse the response
      if (response.containsKey('token')) {
        // Set authentication state
        _token = response['token'];
        _isAuthenticated = true;

        // Create UserModel from response
        if (response.containsKey('user')) {
          _currentUser = UserModel(
            id: response['user']['id'],
            name: response['user']['name'],
            email: response['user']['email'],
          );
        }

        // Save token
        if (_token != null) {
          await _saveToken(_token!);
        }

        return true;
      } else if (response.containsKey('error') ||
          response.containsKey('message')) {
        _errorMessage =
            response['error'] ?? response['message'] ?? 'Google sign in failed';
        return false;
      } else {
        _errorMessage = 'Google sign in failed. Please try again.';
        return false;
      }
    } catch (e) {
      log.e('Google sign in error: $e');
      _errorMessage = 'An unexpected error occurred during Google sign in';
      return false;
    }
  }
}
