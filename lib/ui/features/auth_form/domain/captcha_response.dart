class CaptchaResponse {
  final String message;

  CaptchaResponse({required this.message});

  factory CaptchaResponse.fromJson(Map<String, dynamic> json) {
    return CaptchaResponse(
      message: json['message'],
    );
  }
}