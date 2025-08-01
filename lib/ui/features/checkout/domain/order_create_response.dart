class OrderCreateResponse {
  final bool success;
  final int? orderId;
  final String? paymentUrl;
  final String? message;

  OrderCreateResponse({
    required this.success,
    this.orderId,
    this.paymentUrl,
    this.message,
  });

  factory OrderCreateResponse.fromJson(Map<String, dynamic> json) {
    return OrderCreateResponse(
      success: json['success'] ?? false,
      orderId: json['order_id'],
      paymentUrl: json['payment_url'],
      message: json['message'],
    );
  }
}
