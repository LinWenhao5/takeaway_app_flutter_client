class OrderStatusResponse {
  final bool success;
  final int orderId;
  final String status;
  final String? message;

  OrderStatusResponse({
    required this.success,
    required this.orderId,
    required this.status,
    this.message,
  });

  factory OrderStatusResponse.fromJson(Map<String, dynamic> json) {
    return OrderStatusResponse(
      success: json['success'] ?? false,
      orderId: json['order_id'] ?? 0,
      status: json['status'] ?? '',
      message: json['message'],
    );
  }
}