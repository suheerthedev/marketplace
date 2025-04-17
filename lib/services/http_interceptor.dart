import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:marketplace/app/app.locator.dart';
import 'package:marketplace/app/app.logger.dart';
import 'package:marketplace/services/token_service.dart';

// Extended HTTP client with authentication interceptor
class AuthenticatedClient extends http.BaseClient {
  final log = getLogger('AuthenticatedClient');
  final http.Client _inner = http.Client();
  final TokenService _tokenService = locator<TokenService>();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      // Get token from token service
      final token = await _tokenService.getToken();

      // Add token to request if available
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      // Add common headers
      request.headers['Accept'] = 'application/json';

      // Content-Type is only set if not already present
      if (!request.headers.containsKey('Content-Type')) {
        request.headers['Content-Type'] = 'application/json';
      }

      // Send the request
      return _inner.send(request);
    } catch (e) {
      log.e('Error intercepting request: $e');
      throw e;
    }
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}

// Create HTTP client with authentication
http.Client createAuthenticatedClient() {
  return AuthenticatedClient();
}

// Function to create headers with token
Future<Map<String, String>> createAuthHeaders({
  bool includeContentType = true,
  String contentType = 'application/json',
}) async {
  final tokenService = locator<TokenService>();
  final token = await tokenService.getToken();

  final headers = <String, String>{
    'Accept': 'application/json',
  };

  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  if (includeContentType) {
    headers['Content-Type'] = contentType;
  }

  return headers;
}
