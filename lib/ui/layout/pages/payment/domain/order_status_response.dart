import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_status.dart';

class OrderStatusResponse {
  final bool success;
  final int orderId;
  final OrderStatus status;
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
      status: OrderStatusExtension.fromString(json['status'] ?? ''),
      message: json['message'],
    );
  }
}