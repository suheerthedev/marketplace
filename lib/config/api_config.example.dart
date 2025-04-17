// This is a template file for api_config.dart
// Copy this file, rename it to api_config.dart, and update the values

class ApiConfig {
  // Base URL for the API
  static const String baseUrl = 'https://api.example.com';

  // API Endpoints
  static const String registerEndpoint = '/register';
  static const String verifyOtpEndpoint = '/verify-otp/';
  static const String resendOtpEndpoint = '/resend-otp';
  static const String loginEndpoint = '/login';

  // Rate limits
  static const int otpRequestsPerMinute = 60;

  // API Keys (if needed)
  // static const String apiKey = 'your-api-key-here';

  // Other configuration
  static const int connectionTimeout = 30000; // 30 seconds
}
