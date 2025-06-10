class LoginResponse {
  final String? token;
  final String message;
  final Map<String, List<String>>? errors;

  LoginResponse({
    this.token,
    required this.message,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      message: json['message'],
      errors: json['errors'] != null
          ? (json['errors'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, List<String>.from(value as List)),
            )
          : null,
    );
  }

  String? getFirstError() {
    if (errors != null && errors!.isNotEmpty) {
      final firstErrorList = errors!.values.first;
      if (firstErrorList.isNotEmpty) {
        return firstErrorList.first;
      }
    }
    return null;
  }
}