import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:takeaway_app_flutter_client/api/api_exception.dart';
import 'package:takeaway_app_flutter_client/main_app.dart';
import 'dart:convert';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/token_storage.dart';

class ApiClient {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://takeawayappserver-production.up.railway.app/api',
  );

  static Future<Map<String, String>> _getHeaders() async {
    final token = await TokenStorage.getToken();
    return {
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<dynamic> get(
    String path, {
    Map<String, String>? params,
    bool shouldRedirectOn401 = true,
  }) async {
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: params);
    final headers = await _getHeaders();
    final response = await http.get(uri, headers: headers);
    return _processResponse(response, shouldRedirectOn401: shouldRedirectOn401);
  }

  static Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool shouldRedirectOn401 = true,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = await _getHeaders();
    headers['Content-Type'] = 'application/json';
    final response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return _processResponse(response, shouldRedirectOn401: shouldRedirectOn401);
  }

  static Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? body,
    bool shouldRedirectOn401 = true,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = await _getHeaders();
    headers['Content-Type'] = 'application/json';

    final request =
        http.Request('DELETE', uri)
          ..headers.addAll(headers)
          ..body = json.encode(body);

    final response = await http.Client().send(request);
    final responseBody = await response.stream.bytesToString();

    return _processResponse(
      http.Response(responseBody, response.statusCode),
      shouldRedirectOn401: shouldRedirectOn401,
    );
  }

  static Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    bool shouldRedirectOn401 = true,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = await _getHeaders();
    headers['Content-Type'] = 'application/json';

    final response = await http.put(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return _processResponse(response, shouldRedirectOn401: shouldRedirectOn401);
  }

  static dynamic _processResponse(
    http.Response response, {
    bool shouldRedirectOn401 = true,
  }) {
    if (response.statusCode == 401) {
      TokenStorage.clearToken();
      if (shouldRedirectOn401) {
        _redirectToLogin();
      }
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        responseBody: json.decode(response.body),
      );
    }
  }

  static void _redirectToLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = navigatorKey.currentContext;
      if (context != null) {
        Navigator.of(context).pushNamed('/login');
      }
    });
  }
}
