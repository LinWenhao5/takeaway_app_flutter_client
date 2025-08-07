class OrderRepayResponse {
  final bool success;
  final int orderId;
  final String paymentUrl;
  final String? message;

  OrderRepayResponse({
    required this.success,
    required this.orderId,
    required this.paymentUrl,
    this.message,
  });

  factory OrderRepayResponse.fromJson(Map<String, dynamic> json) {
    return OrderRepayResponse(
      success: json['success'] ?? false,
      orderId: json['order_id'] ?? 0,
      paymentUrl: json['payment_url'] ?? '',
      message: json['message'],
    );
  }
}