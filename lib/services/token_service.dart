import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketplace/app/app.logger.dart';

class TokenService {
  final log = getLogger('TokenService');

  // Keys for SharedPreferences
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';

  // Get the authentication token
  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } catch (e) {
      log.e('Error getting token: $e');
      return null;
    }
  }

  // Save the authentication token
  Future<bool> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_tokenKey, token);
    } catch (e) {
      log.e('Error saving token: $e');
      return false;
    }
  }

  // Save the refresh token (if applicable)
  Future<bool> saveRefreshToken(String refreshToken) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_refreshTokenKey, refreshToken);
    } catch (e) {
      log.e('Error saving refresh token: $e');
      return false;
    }
  }

  // Get the refresh token
  Future<String?> getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_refreshTokenKey);
    } catch (e) {
      log.e('Error getting refresh token: $e');
      return null;
    }
  }

  // Save token expiry timestamp
  Future<bool> saveTokenExpiry(DateTime expiryTime) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(
          _tokenExpiryKey, expiryTime.toIso8601String());
    } catch (e) {
      log.e('Error saving token expiry: $e');
      return false;
    }
  }

  // Get token expiry timestamp
  Future<DateTime?> getTokenExpiry() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiryString = prefs.getString(_tokenExpiryKey);
      if (expiryString != null) {
        return DateTime.parse(expiryString);
      }
      return null;
    } catch (e) {
      log.e('Error getting token expiry: $e');
      return null;
    }
  }

  // Check if token is expired
  Future<bool> isTokenExpired() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) return true;

    return DateTime.now().isAfter(expiry);
  }

  // Clear all tokens (for logout)
  Future<bool> clearTokens() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_refreshTokenKey);
      await prefs.remove(_tokenExpiryKey);
      return true;
    } catch (e) {
      log.e('Error clearing tokens: $e');
      return false;
    }
  }
}
