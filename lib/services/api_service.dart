import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marketplace/app/app.logger.dart';
import 'package:marketplace/config/api_config.dart';

class ApiService {
  final log = getLogger('ApiService');
  final String baseUrl = ApiConfig.baseUrl;

  // HTTP GET request
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    String? token,
  }) async {
    try {
      // Ensure proper URL formatting
      String url = baseUrl;
      if (endpoint.startsWith('/')) {
        url += endpoint;
      } else {
        url += '/' + endpoint;
      }

      // Create URL with query parameters
      final uri = Uri.parse(url).replace(
        queryParameters: queryParams,
      );

      // Prepare headers
      final headers = _prepareHeaders(token);

      log.i('GET Request: $uri');
      final response = await http.get(uri, headers: headers);

      return _processResponse(response);
    } catch (e) {
      log.e('GET Request Error: $e');
      return {
        'error': e.toString(),
        'statusCode': 500,
      };
    }
  }

  // HTTP POST request
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Object? body,
    Map<String, dynamic>? queryParams,
    String? token,
  }) async {
    try {
      // Ensure proper URL formatting
      String url = baseUrl;
      if (endpoint.startsWith('/')) {
        url += endpoint;
      } else {
        url += '/' + endpoint;
      }

      // Create URL with query parameters
      final uri = Uri.parse(url).replace(
        queryParameters: queryParams,
      );

      // Prepare headers
      final headers = _prepareHeaders(token);

      // Process body
      String? processedBody;
      if (body != null && body is Map) {
        processedBody = jsonEncode(body);
      }

      log.i('POST Request: $uri');
      log.i('POST Headers: $headers');
      log.i('POST Body: $processedBody');

      final response =
          await http.post(uri, headers: headers, body: processedBody);

      return _processResponse(response);
    } catch (e) {
      log.e('POST Request Error: $e');
      return {
        'error': e.toString(),
        'statusCode': 500,
      };
    }
  }

  // Helper method to prepare headers
  Map<String, String> _prepareHeaders(String? token) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add authorization token if available
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  // Helper method to process HTTP response
  Map<String, dynamic> _processResponse(http.Response response) {
    log.i('Response Status: ${response.statusCode}');
    log.i('Response Body: ${response.body}');

    // Always include status code in the response
    Map<String, dynamic> result = {
      'statusCode': response.statusCode,
    };

    try {
      // Try to parse JSON response
      if (response.body.isNotEmpty) {
        final jsonData = json.decode(response.body);
        // Add JSON data to result
        result.addAll(jsonData);
      }

      return result;
    } catch (e) {
      log.e('Error parsing response: $e');
      return {
        'error': 'Failed to parse response',
        'statusCode': response.statusCode,
        'body': response.body
      };
    }
  }
}
