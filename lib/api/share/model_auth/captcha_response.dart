class CaptchaResponse {
  final String message;
  final String? error;

  CaptchaResponse({required this.message, this.error});

  factory CaptchaResponse.fromJson(Map<String, dynamic> json) {
    return CaptchaResponse(
      message: json['message'],
      error: json['error'],
    );
  }
}