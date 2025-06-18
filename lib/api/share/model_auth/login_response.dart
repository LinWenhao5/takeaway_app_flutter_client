class LoginResponse{
  final String? token;
  final String message;
  final String? error;

  LoginResponse({
    this.token,
    required this.message,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      message: json['message'],
      error: json['error'],
    );
  }
}