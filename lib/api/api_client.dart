import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:takeaway_app_flutter_client/config/app_config.dart';

class ApiClient {
  static String get baseUrl => AppConfig.apiBaseUrl;

  static Future<dynamic> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: params);
    final response = await http.get(uri, headers: {
      'Accept': 'application/json',
    });
    return _processResponse(response);
  }

  static Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  static dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        responseBody: json.decode(response.body),
      );
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final dynamic responseBody;

  ApiException({required this.statusCode, required this.responseBody});

  @override
  String toString() {
    return 'ApiException: $statusCode, $responseBody';
  }
}