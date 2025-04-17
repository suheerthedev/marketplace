// Models for API responses related to authentication

// User model used in authentication responses
class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

// Response model for registration
class RegisterResponse {
  final String? token;
  final UserModel? user;
  final Map<String, List<String>>? errors;

  RegisterResponse({
    this.token,
    this.user,
    this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    // Check if response contains errors
    if (json.containsKey('errors')) {
      return RegisterResponse(
        errors: _parseErrors(json['errors']),
      );
    }

    // Check for specific field errors like email
    if (json.containsKey('email') && json['email'] is List) {
      return RegisterResponse(
        errors: {
          'email': List<String>.from(json['email']),
        },
      );
    }

    // Otherwise, process successful response
    return RegisterResponse(
      token: json['token'],
      user: json.containsKey('user') ? UserModel.fromJson(json['user']) : null,
    );
  }

  bool get isSuccess => token != null && user != null;
  bool get hasErrors => errors != null && errors!.isNotEmpty;

  // Helper method to parse error messages from API
  static Map<String, List<String>> _parseErrors(dynamic errorsJson) {
    if (errorsJson is Map) {
      Map<String, List<String>> result = {};

      errorsJson.forEach((key, value) {
        if (value is List) {
          result[key] = List<String>.from(value);
        } else if (value is String) {
          result[key] = [value];
        }
      });

      return result;
    }
    return {};
  }
}

// Response model for OTP verification
class OtpVerificationResponse {
  final String? message;
  final String? token;
  final bool isSuccess;

  OtpVerificationResponse({
    this.message,
    this.token,
    required this.isSuccess,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    final message = json['message'] ?? '';

    // Check if verification was successful
    final isSuccess = message.contains('verified successfully') ||
        message.contains('already verified');

    return OtpVerificationResponse(
      message: message,
      token: json['token'],
      isSuccess: isSuccess,
    );
  }
}

// Response model for login
class LoginResponse {
  final String? token;
  final UserModel? user;
  final bool? emailVerified;
  final String? message;
  final Map<String, List<String>>? errors;

  LoginResponse({
    this.token,
    this.user,
    this.emailVerified,
    this.message,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    // Check if response contains errors
    if (json.containsKey('errors')) {
      return LoginResponse(
        errors: _parseErrors(json['errors']),
        message: json['message'],
      );
    }

    // Check if email is not verified
    if (json.containsKey('email_verified') && json['email_verified'] == false) {
      return LoginResponse(
        emailVerified: false,
        message: json['message'],
      );
    }

    // Otherwise, process successful login response
    return LoginResponse(
      token: json['token'],
      emailVerified: json['email_verified'],
      user: json.containsKey('user') ? UserModel.fromJson(json['user']) : null,
    );
  }

  bool get isSuccess => token != null && user != null;
  bool get isEmailNotVerified => emailVerified == false;
  bool get hasErrors => errors != null && errors!.isNotEmpty;

  // Helper method to parse error messages from API
  static Map<String, List<String>> _parseErrors(dynamic errorsJson) {
    if (errorsJson is Map) {
      Map<String, List<String>> result = {};

      errorsJson.forEach((key, value) {
        if (value is List) {
          result[key] = List<String>.from(value);
        } else if (value is String) {
          result[key] = [value];
        }
      });

      return result;
    }
    return {};
  }
}

// Response model for password reset request
class PasswordResetRequestResponse {
  final String? message;
  final bool isSuccess;
  final String? error;

  PasswordResetRequestResponse({
    this.message,
    required this.isSuccess,
    this.error,
  });

  factory PasswordResetRequestResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a success message
    if (json.containsKey('message')) {
      final message = json['message'] as String?;
      final isSuccess = message != null &&
          (message.contains('reset link sent') ||
              message.contains('password reset') ||
              message.contains('otp sent'));

      return PasswordResetRequestResponse(
        message: message,
        isSuccess: isSuccess,
        error: isSuccess ? null : message,
      );
    }

    // Check if the response contains errors
    if (json.containsKey('error') || json.containsKey('errors')) {
      final error = json['error'] ??
          (json['errors'] is Map
              ? json['errors'].values.first.toString()
              : json['errors'].toString());

      return PasswordResetRequestResponse(
        isSuccess: false,
        error: error.toString(),
      );
    }

    // Default case
    return PasswordResetRequestResponse(
      isSuccess: false,
      error: 'Unknown response from server',
    );
  }
}

// Response model for password reset
class PasswordResetResponse {
  final String? message;
  final bool isSuccess;
  final String? error;

  PasswordResetResponse({
    this.message,
    required this.isSuccess,
    this.error,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response contains a success message
    if (json.containsKey('message')) {
      final message = json['message'] as String?;
      final isSuccess = message != null &&
          (message.contains('password updated') ||
              message.contains('password changed') ||
              message.contains('successfully reset'));

      return PasswordResetResponse(
        message: message,
        isSuccess: isSuccess,
        error: isSuccess ? null : message,
      );
    }

    // Check if the response contains errors
    if (json.containsKey('error') || json.containsKey('errors')) {
      final error = json['error'] ??
          (json['errors'] is Map
              ? json['errors'].values.first.toString()
              : json['errors'].toString());

      return PasswordResetResponse(
        isSuccess: false,
        error: error.toString(),
      );
    }

    // Default case
    return PasswordResetResponse(
      isSuccess: false,
      error: 'Unknown response from server',
    );
  }
}
