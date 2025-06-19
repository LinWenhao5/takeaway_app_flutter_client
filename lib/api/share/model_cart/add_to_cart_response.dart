class AddToCartResponse {
  final String message;
  final String? error;

  AddToCartResponse({required this.message, this.error});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      message: json['message'],
      error: json['error'],
    );
  }
}