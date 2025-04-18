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
  final int statusCode;

  RegisterResponse({
    this.token,
    this.user,
    this.errors,
    required this.statusCode,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;

    // Handle 422 errors (email already taken)
    if (statusCode == 422 &&
        json.containsKey('email') &&
        json['email'] is List) {
      return RegisterResponse(
        errors: {
          'email': List<String>.from(json['email']),
        },
        statusCode: statusCode,
      );
    }

    // For 200 success responses
    if (statusCode == 200) {
      return RegisterResponse(
        token: json['token'],
        user:
            json.containsKey('user') ? UserModel.fromJson(json['user']) : null,
        statusCode: statusCode,
      );
    }

    // For other error cases
    if (json.containsKey('errors')) {
      return RegisterResponse(
        errors: _parseErrors(json['errors']),
        statusCode: statusCode,
      );
    }

    // If email errors included directly at the root (common pattern)
    if (json.containsKey('email') && json['email'] is List) {
      return RegisterResponse(
        errors: {
          'email': List<String>.from(json['email']),
        },
        statusCode: statusCode,
      );
    }

    // Default case
    return RegisterResponse(
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200 && token != null && user != null;
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
  final int statusCode;

  OtpVerificationResponse({
    this.message,
    this.token,
    required this.statusCode,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;
    final String? message = json['message'];

    return OtpVerificationResponse(
      message: message,
      token: json['token'],
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200;
  bool get isInvalidOtp => statusCode == 400 && message == 'Invalid OTP';
}

// Response model for login
class LoginResponse {
  final String? token;
  final UserModel? user;
  final bool? emailVerified;
  final String? message;
  final Map<String, List<String>>? errors;
  final int statusCode;

  LoginResponse({
    this.token,
    this.user,
    this.emailVerified,
    this.message,
    this.errors,
    required this.statusCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;

    // For 422 error responses (invalid credentials)
    if (statusCode == 422 && json.containsKey('errors')) {
      return LoginResponse(
        errors: _parseErrors(json['errors']),
        message: json['message'],
        statusCode: statusCode,
      );
    }

    // For 200 responses, check if email is verified
    if (statusCode == 200) {
      if (json.containsKey('email_verified') &&
          json['email_verified'] == false) {
        // Email not verified
        return LoginResponse(
          emailVerified: false,
          message: json['message'],
          statusCode: statusCode,
        );
      } else {
        // Login successful
        return LoginResponse(
          token: json['token'],
          emailVerified: json['email_verified'],
          user: json.containsKey('user')
              ? UserModel.fromJson(json['user'])
              : null,
          statusCode: statusCode,
        );
      }
    }

    // Default case
    return LoginResponse(
      message: json['message'],
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200 && token != null && user != null;
  bool get isEmailNotVerified => statusCode == 200 && emailVerified == false;
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

// Response model for resend OTP
class ResendOtpResponse {
  final String? message;
  final int statusCode;

  ResendOtpResponse({
    this.message,
    required this.statusCode,
  });

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;
    return ResendOtpResponse(
      message: json['message'],
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200;
  bool get isEmailNotRegistered =>
      statusCode == 400 && message?.contains('not registered') == true;
}

// Response model for password reset request
class PasswordResetRequestResponse {
  final String? message;
  final String? error;
  final int statusCode;

  PasswordResetRequestResponse({
    this.message,
    this.error,
    required this.statusCode,
  });

  factory PasswordResetRequestResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;
    final String? message = json['message'];

    // Success response
    if (statusCode == 200) {
      return PasswordResetRequestResponse(
        message: message,
        statusCode: statusCode,
      );
    }

    // Error response
    return PasswordResetRequestResponse(
      error: message ?? json['error'],
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200;
}

// Response model for password reset
class PasswordResetResponse {
  final String? message;
  final String? error;
  final int statusCode;

  PasswordResetResponse({
    this.message,
    this.error,
    required this.statusCode,
  });

  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['statusCode'] ?? 500;
    final String? message = json['message'];

    // Success response
    if (statusCode == 200) {
      return PasswordResetResponse(
        message: message,
        statusCode: statusCode,
      );
    }

    // Error response
    return PasswordResetResponse(
      error: message ?? json['error'],
      statusCode: statusCode,
    );
  }

  bool get isSuccess => statusCode == 200;
}
