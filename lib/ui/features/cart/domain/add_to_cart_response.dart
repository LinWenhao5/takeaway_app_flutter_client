class AddToCartResponse {
  final String message;

  AddToCartResponse({required this.message});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(message: json['message']);
  }
}
