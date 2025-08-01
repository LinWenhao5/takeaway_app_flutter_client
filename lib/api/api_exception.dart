class ApiException implements Exception {
  final int statusCode;
  final dynamic responseBody;

  ApiException({required this.statusCode, required this.responseBody});

  @override
  String toString() => 'ApiException($statusCode): $responseBody';
}
